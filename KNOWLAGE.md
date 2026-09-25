# needle: working knowledge

Notes for Claude (and anyone else) picking this project up. They cover how
needle builds profiles, the NI loader it targets, and conventions and gotchas
learned while working on it. Anything marked **(unverified)** was reasoned
out, not tested in game.

---

## 1. What needle is

A Go CLI that bundles Lua **abilities** and **rotations** from `Profiles/` into
**NI (ni v2)** rotation files for WoW 3.3.5 (Wrath), and optionally encrypts
them.

```
go run ./cmd -c Profiles/config.json          # uses "watch" from config
go run ./cmd -c <cfg> -w=false                # one-shot build
```

### `Profiles/config.json`
| key | meaning |
|---|---|
| `name`, `version` | output names: `<name>_v<version>_<Spec>.lua`, Data module `<name>_v<version>.lua` |
| `expansion` | output subfolder (`Wrath`) |
| `input` / `output` | source `Profiles/` dir; NI `addon\Rotations` dir |
| `debug` | wrap each ability in `pcall` and print errors in red |
| `print` | print each ability ID as it runs / casts (noisy) |
| `watch` | rebuild on `.lua`/`.json` changes under input (the `-w` flag overrides) |
| `encode` | encrypt profiles + Data module into self-decrypting stubs (`internal/protect`) |
| `allow` | character names allowed to run MK (baked into the Data module) |
| `remote` | bool: add the addon-whisper kill switch (see §4.6) |

`app.Load()` rewrites config.json only if normalizing it changes something,
so the watcher doesn't retrigger itself.

### Build pipeline (Go)
1. `internal/tree`: `Tree` = root abilities (`Profiles/*.lua`), per-class
   profiles (`Profiles/<Class>/*.json`, each with that class dir's abilities),
   and `Data` (`Profiles/Data/*.lua`). Only class dirs from `internal/wow` are
   scanned.
2. `internal/metadata`: leading `-- Key: value` comment lines become
   metadata (see §3.2); the rest is the ability body.
3. `internal/tmpl/ability.lua.tmpl`: wraps each ability (casting via
   `SpellId`, validity checks, debug pcall).
4. `internal/tmpl/data.lua.tmpl`: builds `local MK = {}` + `MK.ALLOW` +
   each Data file in its own `do ... end` + the remote block + `return MK`.
5. `internal/tmpl/profile.lua.tmpl`: `local MK = ni.utils.require("<DataID>")`,
   `QUEUE`, `ABILITIES`, a queue **function** that returns `{}` when
   `MK.Blocked()` or when the player isn't in `MK.ALLOW`, then
   `ni.bootstrap.profile(ID, queue, ABILITIES)`.
6. `internal/protect`: minify, then encrypt with a pure-Lua arithmetic cipher
   (no bit lib), then a stub that `loadstring`s and runs it with a proxy `ni`
   (the stub reads each `ni.<field>` the source uses). The stub `return`s the
   chunk's result, so the encoded Data module still returns `MK`.
7. `internal/bundler`: `BundleData()` writes `Output/Data/<DataID>.lua`
   first (if it fails, profiles are skipped). Then each profile goes to
   `Output/<Class>/<Expansion>/<ProfileID>.lua`.
8. `internal/app/run.go`: when `remote` is true, writes
   `remote-macros.txt` next to config.json (text embedded from
   `internal/tmpl/remote-macros.txt`). It's regenerated every build, so it
   shouldn't be committed.

`internal/app/structure.go` creates `Input/Data`, `Output/Data` and the
class dirs. Watch (`internal/app/watch.go`) ignores non-`.lua`/`.json` files
and anything under output, debounces 300ms and serializes builds.

---

## 2. NI loader (`G:\Extra\MK NI LOADER`)

```
ni.dll, p_call.dll, settings.json, firefox.exe
addon\
  Core\        ni's Lua framework (read-only reference)
  Rotations\   profiles, one folder per class + Generic\ + Data\
    Data\      shared modules loaded with ni.utils.require
    <Class>\Wrath\MK_v12_<Spec>.lua   (needle output)
  Settings\    per-character json (<Name>_<Realm>.json) + our ui_cache.json
```

`Rotations\Data\` holds `MK_v12.lua` (needle output), `MK_v10.5.lua`
(older build), `MK8.lua` (the user's old hand-written module:
`local MK8 = {STATE, FRAME, HOTKEY}` ... `return MK8`), and third-party modules
(`Riot`, `Kusbas`, `A1`, `Wotlkpvp`, `BROKEN`, `Data_Example`).
Older MK builds sit next to new ones in the class folders (`MK_v10_*`,
`MK_v11_*`, ...). `MK_v10_*` are plain text; later ones are encoded.

### Core files
| file | provides |
|---|---|
| `core.lua` | `ni.functions` (native: cast, clickat, los, getom, registercallback, loadcontent/savecontent, require, webrequest, ...), `ni.require` (cached per session) |
| `loading.lua` | builds `ni.*`: `ni.vars` from `Settings\<Name>_<Realm>.json`, `ni.utils.require/json/savesetting/getsettings`, `ni.frames, ni.combatlog, ni.delayfor, ni.events = frames.lua`, `ni.power, ni.rune`, `ni.unit`, `ni.player`, `ni.spell`, `ni.members`, `ni.objects` |
| `bootstrap.lua` | `ni.bootstrap.profile(name, queue, abilities, OnLoad, OnUnLoad)` and `.rotation(name, queue, abilities, data, GUI)`; queue may be a **function** (`isFunction(self.queue) and self.queue()`); runs abilities in order, stops at the first that returns true |
| `frames.lua` | main OnUpdate loop: honors `ni.vars.profiles.delay`, the spell queue, then `ni.rotation.profile[active]:execute()`; `ni.delayfor(sec, fn)`; **key hook** `ni.events.registerkeyevent(name, fn(keyType, key))` (returning true = handled, likely swallowed) |
| `rotation.lua` | NI's own modifier hotkeys (`ni.vars.hotkeys.*`: aoe/cd/pause/custom) |
| `spell.lua` | `ni.spell.cast/castat/castqueue/available/cd/gcd/valid/...`; `castat(spell, "target"|"mouse", offset)` casts then clicks the ground |
| `power.lua` | `ni.power.*`, `ni.rune.available/deathrunes/cd(type)/bloodrunecd/...` (`cd` returns `oncd, offcd`) |
| `unit.lua` | `ni.unit.*`; `buffremaining`/`debuffremaining` return **0 when missing**; `enemiesinrange(unit, yd)` returns a table |
| `mainui.lua` | NI's UI; its start/stop hotkeys use `SetBindingClick` on a hidden button |
| `vars.lua` | defaults: `ni.vars.profiles.enabled/active/delay`, `hotkeys`, `combat` |

### Facts worth remembering
- **Require cache:** `ni.utils.require(name)` searches `Rotations\Data`, is
  cached per session, and `/reload` clears it. **After a rebuild you must
  `/reload`**, or profiles keep using the old Data module.
- **Settings files:** `ni.utils.savesetting(file, tbl)` and
  `getsettings(file)` read and write JSON under `addon\Settings\`. That folder
  is per PC, not per character. Never use NI's own `<Name>_<Realm>.json`.
- **Bare `ni` is hidden (unverified):** in profile files, a bare `ni` appears
  to be nil. Only `ni.<field>` written literally resolves, which is why
  `protect` rewrites access through a proxy. Keep writing `ni.x.y` literally.
- **Globals:** the Data module keeps its state in the `MK` table rather than
  in globals, because its environment may not match the profile's. Profile
  hotkeys still use `MK_*` globals.
- **docs:** `docs/` is the official **ni v2 legacy API docs** (docsify site).
  API pages: `debug, generic (delayfor, require), healing, members, memory,
  object-manager, player, power, rune, spell, unit, vars`, plus quickstart
  and FAQ.
- **Quickstart warning:** it says dynamic queues don't work "with Data files".
  That refers to `ni.bootstrap.rotation`'s `data` argument. Our
  `bootstrap.profile` plus `ni.utils.require` combination is fine.

---

## 3. Writing profiles (`Profiles/`)

### 3.1 Layout and naming
- **Root** `Profiles/*.lua`: shared abilities (`core-*`, `gui-*`,
  `hotkey-*`, `use-*`).
- **Class dir:**
  - `<spec>.json` holds the rotation.
  - The spell table is a `.lua` whose ID is listed **first** in the rotation
    (e.g. `fury`, `unholy`, `h-spells`), and it sets `MK_<SPELL> = id` globals.
  - Each ability is one `.lua`.
- **Ability prefixes:**

  | Class | Prefixes |
  |---|---|
  | Death Knight | `f-` frost, `u-` unholy, `b-` blood |
  | Warrior | `w-` shared, `f-` fury |
  | Hunter | `h-` shared, `m-` marks, `s-` survival |
  | Druid | `b-` balance |
  | Rogue | `a-` assassination |
  | Shaman | `e-` elemental |
  | Warlock | `a-` affliction |

  Abilities in a class dir are shared by every spec of that class, so reuse
  is fine, e.g. unholy uses `f-horn-of-winter`.
- **`Profiles/Data/*.lua`** holds the shared MK module (§4). Write into `MK`
  (`function MK.X()`); each file gets its own `do` block.

### 3.2 Ability metadata headers
```lua
-- SpellId: MK_ICY_TOUCH      -- template casts this when the body returns true
-- Target: target             -- optional; adds UnitExists/range/facing checks
-- Facing: false              -- optional (default true)
-- Los: false                 -- optional (default true)

-- normal comments go AFTER a blank line
```
- **Every leading `-- key: value` line is metadata**, even ones meant as
  comments. Put a blank line before comments that contain a colon.
- **With `SpellId`:** the body only decides (`return true`). The template
  first checks `IsUsableSpell` and `ni.spell.available`. With a `Target`, it
  also checks `ni.spell.valid`; friendly targets get facing=false.
- **Without `SpellId`:** cast yourself (`ni.spell.cast(...)`) and
  `return true`. Use this for multi-spell or multi-unit logic, ground spells
  (`ni.spell.castat`), racials and gloves.
- **Returning true stops the queue for that tick.**

### 3.3 Rotation header (order matters)
```
<spells>, gui-begin, gui-profile, hotkey-*..., hotkey-gui, gui-end,
core-death, [core-pet], core-start, [pre-combat stuff], core-combat,
use-healthstone, core-target-enemy, [core-attack], <spec abilities...>
```
- **`core-death` must run before `core-start`.** Otherwise the death lockout
  never records.
- `core-combat` returns when out of combat, so pre-pull abilities (e.g.
  `u-raise-dead`) go before it.
- `core-interrupt` and `hotkey-interrupt` were **deleted**; interrupts are
  gone.

### 3.4 Current hotkeys
| key | what | implementation |
|---|---|---|
| L Ctrl | Rotation on/off | `MK.Toggle` (modifier poll) |
| L Shift (hold) | Pause | `MK.Pressed` |
| L Alt | AOE: toggle (`hotkey-aoe`) or hold (`hotkey-aoe-hold`) | modifier poll; **also fires on Alt+Tab (open issue)** |
| R Alt | Cooldowns | `MK.Toggle` |
| L Shift + R Shift | Toggle frame | `MK.Toggle` on `MK.FRAME.SHOWN` |
| R Ctrl + 1..0 | Pet Control, Misdirection, Shot, Hurricane, Raging, ... | `MK.BindToggle/BindPress` via the NI key hook; numbers assigned in rotation order |

Hunter's Mark has no hotkey. It throttles itself with `ni.delayfor(10, ...)`,
and with Improved Hunter's Mark (19423, found by localized name) it only
counts the player's own mark.

---

## 4. The MK Data module (`Profiles/Data/`)

### 4.1 `functions.lua`
- `MK.IsUsableSpell(id)`, `MK.HasPowerToCast(id)`, `MK.GetRuneCooldown(i)`,
  `MK.Include(str, list)`
- `MK.EachNameplate(fn)`: loops `nameplate1..60` over units that exist and
  stops at the first non-nil return.
- `MK.UseHands()`: glove tinker, skipped while Hyperspeed (54758) is up.

### 4.2 `gui.lua`
- **State:** `MK.FRAME = {SIDE, X, Y, SHOWN, BASE, TEXT, LINES}`.
- **Per tick:** `MK.GuiBegin()` / `MK.GuiEnd()`. The frame is destroyed when
  NI profiles are disabled.
- **Lines:** `MK.Line(text)`, and `MK.Status(label, on, inverted)` for
  "label: Enabled/Disabled" in green/red.

### 4.3 `hotkeys.lua`
- `MK.Pressed({"LCTRL","RSHIFT",...})`: true when exactly those modifiers are
  held.
- `MK.KeyPress(name, keys, delay)` and
  `MK.Toggle(name, keys, value, default, delay) -> value`: usage
  `MK_X = MK.Toggle("x", {...}, MK_X, default)`.
- **R Ctrl + number** via `ni.events.registerkeyevent("MK_HOTKEYS", onKey)`:
  - `MK.BindPress(name) -> pressed, label` and
    `MK.BindToggle(name, value, default) -> value, label`.
  - Slots 1–9, 0 are handed out in first-call order; the label is
    "R Ctrl + N", or "no key" when all are taken.
  - R Ctrl presses are swallowed (return true); L Ctrl + number passes
    through to the game.
  - Press and release are told apart by the order of events, since NI's
    keyType values are undocumented. The key may be a VK code (48–57) or a
    string.
  - Debug: `/run MK_KEY_DEBUG = true` prints raw key events.

### 4.4 `encounters.lua`
`MK.YOGG_TARGETS`, `MK.MIMIRON_TARGETS`, `MK.PET_IGNORED`, `MK.PET_PRIORITY`

### 4.5 `deathknight.lua`
- `MK.GargoyleActive()`: Gargoyle cooldown started less than 30s ago.
- `MK.RunesReady(type)`: 1 Blood, 2 Unholy, 3 Frost; Death runes count for
  all. Goes by `GetRuneType`, not slot order.
- `MK.PoolForDeathAndDecay()`: target in melee and DnD cooldown under 3s.
- It keeps its own spell ID copies instead of reading profile globals.
- **DK presence rule:** Unholy and Blood never change the presence while
  Frost Presence is active (tanking). Summon Gargoyle casts in any presence
  except Blood.
- **Profiles are priority lists only.** No scripted openers or sequence
  runners (the user rejected a Data `opener.lua`); write guide openers as
  priority conditions.

### 4.6 Generated blocks
- **Allow list:** `MK.ALLOW = {["Name"]=true}` (only if `allow` is set).
- **Remote** (`internal/tmpl/remote.lua.tmpl`, only if `remote: true`):
  - **Storage:** a **PC-wide** `{disabled=true}` flag in
    `Settings\ui_cache.json`.
  - **`MK.Blocked()`:** true when disabled; also hides the frame.
  - **Protocol:** `CHAT_MSG_ADDON` WHISPER with prefixes `MK_CHECKOUT`,
    `MK_TOGGLE`, `MK_ENABLE`, `MK_DISABLE`. The payload is `<guid>[-...]` and
    must match `UnitGUID("player")`.
  - **Replies:** `<prefix>_RESPONSE` with "ON"/"OFF", or "<version> ON" for
    checkout. Received `*_RESPONSE` messages print in chat.
  - **No admin check** (the user's choice): anyone who knows the protocol can
    toggle anyone.
  - **Dev macros:** in `remote-macros.txt`, using `UnitGUID("target")`.

---

## 5. WoW 3.3.5 API gotchas learned
- **No general key polling:** there's no `IsKeyDown`; only
  `Is{Left,Right}{Shift,Control,Alt}KeyDown` and `IsMouseButtonDown`. Use the
  NI key hook for other keys.
- **Bindings:** they can't tell left from right modifiers ("CTRL-1" means
  either Ctrl). `GetBindingAction(key)` ignores override bindings; pass
  `true` as a 2nd arg to include them (unverified).
- **Default Ctrl + 1..0** are pet-bar keys (`BONUSACTIONBUTTON1..`).
- **Addon whispers:** the `sender` in `CHAT_MSG_ADDON` is set by the server,
  so it can't be spoofed.
- **`GetTime()`** is the local PC's uptime, so it's not comparable across
  players.
- **Localized names:** `GetSpellInfo(id)` returns the name in the client's
  language. Use it to find talents by name (`GetTalentInfo` loop) instead of
  hard-coded tab/index.
- **Presences:** DK presences are checked as player buffs (`u-presence`,
  unverified).

---

## 6. Old PQR profiles (reference)
- **Location:** `G:\Extra\MK PQR 3.3.5\Profiles\MK5_<CLASS>_{Rotations,Abilities}.xml`.
- **Format:** Rotations list abilities as `A|B|C`. Abilities are
  `<Ability><Name>..<SpellID>..<Lua>..</Ability>`, with Lua XML-escaped
  (`&lt;` and so on).
- **Extract with:**
  ```bash
  perl -0777 -ne 'while (/<Ability>(.*?)<\/Ability>/gs) { my $a=$1; my ($n)=$a=~/<Name>(.*?)<\/Name>/s; next unless $n =~ /^U - /; my ($l)=$a=~/<Lua>(.*?)<\/Lua>/s; print "== $n\n$l\n" }' MK5_DEATHKNIGHT_Abilities.xml | sed 's/&lt;/</g; s/&gt;/>/g; s/&amp;/\&/g'
  ```
- **Idea worth keeping:** the PQR Unholy pooled runes before Death and Decay
  (`MK_DND`). It's ported as `MK.PoolForDeathAndDecay`.
- **Unholy guide used:** wowtbc.gg/wotlk/class-guides/unholy-death-knight/.
  Spell names on that page are icon links, so read them with JS, not page
  text.

---

## 7. Working in this repo
- **Shell:** Windows with Git Bash. **No python, no luac.** Use perl, awk and
  sed.
- **Test builds:** use a scratch config with `output` in the scratchpad and
  `encode: false`, then run `go run ./cmd -c <cfg> -w=false`. Write the
  config with `printf` and forward-slash paths; JSON rejects `\P`.
- **Rough Lua check:** count `function`/`if`/`do` against `end` with awk,
  ignoring comments and strings.
- **Rotation ID check:** every ID in `*.json` must exist as
  `<Class>/<id>.lua` or `Profiles/<id>.lua`.
- **Commits:**
  - Conventional Commits in the caveman-commit style.
  - **No AI attribution trailers.**
  - The git identity isn't configured; use
    `git -c user.name=Mehdi -c user.email=khodayari.khoram@gmail.com commit`.
  - Commit only when asked.
- **CRLF:** `core.autocrlf` rewrites LF files and prints warnings; add
  `-c core.safecrlf=false` or ignore them.
- **User preferences:**
  - Wants a plan before bigger hotkey or behavior changes.
  - Likes features generated from Go templates, with a config switch.
  - Terse answers.

## 8. Open / unverified
- **Alt+Tab AOE:** L Alt fires AOE on Alt+Tab. Options offered: tap-to-toggle
  via the key hook, hold with cancel on other keys, or R Ctrl + N. No answer
  yet.
- **Unholy profile:** untested in game. To check: presence detection by
  buff, `castat` for DnD, Blood Tap/Ghoul Frenzy interplay.
- **Blood profile:** untested in game. To check: Hysteria on self, Blood Boil
  at 5+ mobs (`enemiesinrange("target", 10) >= 4`), and whether Death Coil
  pooling for Dancing Rune Weapon wastes Runic Power.
- **Blood spell IDs:** Heart Strike 55262, Dancing Rune Weapon 49028,
  Hysteria 49016 and Rune Tap 48982 come from DarhangeR's PQR, since the
  user's MK PQR files never had a Blood rotation.
- **Key hook:** keyType values are unknown; the handler is written not to
  depend on them.
- **`remote-macros.txt`:** should be added to `.gitignore`.
