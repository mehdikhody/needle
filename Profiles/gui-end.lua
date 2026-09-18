if MK_FRAME_BASE_LAYER and MK_FRAME_TEXT_LAYER and MK_FRAME_LINES then
    local data = table.concat(MK_FRAME_LINES, "\n")
    MK_FRAME_TEXT_LAYER:SetText(data)
end