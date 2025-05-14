#IfWinActive, ahk_exe aseprite.exe

Numpad0::
    GetCursorPosY(startY)
    lastSteps := 0
    idleCount := 0

    Loop {
        GetCursorPosY(newY)
        delta := startY - newY
        steps := Floor(delta / 5)

        if (steps != lastSteps) {
            idleCount := 0
            diff := steps - lastSteps
            if (diff > 0) {
                Loop %diff%
                    Send ^{WheelUp}
            } else {
                Loop % Abs(diff)
                    Send ^{WheelDown}
            }
            lastSteps := steps
        } else {
            idleCount++
            if (idleCount > 20)  ; exit if there's no movement for ~200ms
                break
        }

        Sleep 10
    }
return

GetCursorPosY(ByRef y) {
    VarSetCapacity(pt, 8, 0)
    DllCall("GetCursorPos", "Ptr", &pt)
    y := NumGet(pt, 4, "Int")
}
#IfWinActive
