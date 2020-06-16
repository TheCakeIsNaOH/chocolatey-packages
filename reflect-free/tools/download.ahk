exe_path   = %1%
setup_dir  = %2%
SetControlDelay -1
Run, %exe_path%

WinWait, Macrium Reflect Download Agent
hwnd := WinExist()

; Set download directory
ControlSetText, Edit2, %setup_dir%, ahk_id %hwnd%
Sleep 500

; Do not run after download
Control, Uncheck, , Button6, ahk_id %hwnd%

Sleep 3000

; Download
ControlClick, Button10, ahk_id %hwnd% , , , , NA
;Sleep 100
;Send, {Enter}

; Accept overwrite old installer if needed
Sleep 1500
IfWinExist,,&Yes
{
    WinActivate
    ControlClick, Button1, , &Yes , , , NA
}


; Exit after done downloading
loop {
    Sleep 1000
    IfWinExist,, Click to view log file
    {
        WinActivate
        ControlClick, Button1, , Click to view log file , , , NA
        ControlClick, Button11, ahk_id %hwnd% , , , , NA
        break
    }
}

