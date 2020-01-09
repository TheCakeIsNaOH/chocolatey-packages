;HASINTERNETCONN=0 use to disable registration
setup_path       = %1%
desktop_shortcut = %2%

Run, %setup_path%
WinWait, Macrium Reflect Installer
h := WinExist()
ControlClick, Button2 , ahk_id %h%

WinWait, Macrium Reflect Free Edition
WinActivate

ControlClick, Button1 , ahk_id %h%
Sleep 500

WinWait,, License Agreement
ControlClick, Button2 , ahk_id %h%
Sleep 500
ControlClick, Button5 , ahk_id %h%
Sleep 500

ControlClick, Button5 , ahk_id %h%
Sleep 500
	
ControlClick, Button7 , ahk_id %h%	
Sleep 500

ControlClick, Button1 , ahk_id %h%	
Sleep 500

ControlClick, Button3 , ahk_id %h%
Sleep 500

if (desktop_shortcut = "yes") {
	ControlClick, Button4 , ahk_id %h%
	Sleep 500
}

ControlClick, Button6 , ahk_id %h%
Sleep 500
	
ControlClick, Button1 , ahk_id %h%	

WinWait, Macrium Reflect Free Edition, &Finish
WinActivate

ControlClick, Button3 , ahk_id %h%
Sleep 500
	
ControlClick, Button4 , ahk_id %h%