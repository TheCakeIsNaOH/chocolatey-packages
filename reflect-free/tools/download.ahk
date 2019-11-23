exe_path   = %1%
setup_dir  = %2%

Run, %exe_path%

WinWait, Macrium Reflect Download Agent
hwnd := WinExist()

; Set download directory
ControlSetText, Edit2, %setup_dir%, ahk_id %hwnd%
Sleep 500

; Do not run after download
ControlClick, Button6, ahk_id %hwnd%

Sleep 3000

; Download
ControlClick, Button10, ahk_id %hwnd%
Sleep 100
Send, {Enter}

; Accept overwrite old installer if needed
Sleep 1500
IfWinExist,,&Yes
{
    WinActivate
    Send, {ENTER}
}


; Exit after done downloading
loop {
    Sleep 1000
    IfWinExist,, Click to view log file
    {
        WinActivate
        Send, {ENTER}
        ControlSend,,{ESC}, ahk_id %hwnd% 
        break
    }
}

