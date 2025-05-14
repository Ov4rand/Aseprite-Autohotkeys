#IfWinActive, ahk_exe aseprite.exe

; Track current tool state: 0 = Pencil, 1 = Eraser
toolState := 0

e::
if (toolState = 0) {
    Send, e  ; Switch to Eraser
    toolState := 1
} else {
    Send, b  ; Switch back to Pencil
    toolState := 0
}
return
