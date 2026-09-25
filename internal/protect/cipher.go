package protect

// Cipher and hash constants. Every intermediate value stays well below 2^53, so
// the arithmetic is exact both here (int64) and in the emitted Lua stub, whose
// numbers are IEEE-754 doubles. This is why the scheme avoids bitwise ops
// entirely — WoW 3.3.5a's Lua cannot be assumed to have a `bit` library.
const (
	lcgMul  = 16807      // Park–Miller MINSTD multiplier
	lcgMod  = 2147483647 // 2^31 - 1
	hashMul = 31
	hashMod = 2147483647
)

// encrypt applies the arithmetic stream cipher to plain using the given seed and
// returns the ciphertext together with a rolling tamper hash of the plaintext.
// The Lua stub reproduces both loops exactly to recover and verify the source.
func encrypt(plain []byte, seed int64) (cipher []byte, hash int64) {
	state := seed
	cipher = make([]byte, len(plain))
	for i, p := range plain {
		state = (state * lcgMul) % lcgMod
		ks := state % 256
		cipher[i] = byte((int64(p) + ks) % 256)
		hash = (hash*hashMul + int64(p)) % hashMod
	}
	return cipher, hash
}

// decrypt inverts encrypt. It exists for round-trip testing; at runtime the Lua
// stub performs the equivalent work.
func decrypt(cipher []byte, seed int64) []byte {
	state := seed
	out := make([]byte, len(cipher))
	for i, c := range cipher {
		state = (state * lcgMul) % lcgMod
		ks := state % 256
		out[i] = byte((int64(c) - ks + 256) % 256)
	}
	return out
}
