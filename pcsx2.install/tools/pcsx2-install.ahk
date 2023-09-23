#SingleInstance force, NoEnv
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SetTitleMatchMode("RegEx")

if (%0% < 1) {
	FileAppend("`"Too few arguments given`"", "*")
	Exit()
}

file := 1
Run(file)

WinWait("PCSX2 [\d\.]+ Setup", , 30)
hwnd := WinExist()
Sleep(200)
ControlClick("Button4", "ahk_id " hwnd, , , , "NA")
Sleep(200)
ControlClick("Button2", "ahk_id " hwnd, , , , "NA")

; Runs a new exe for installation section, must get window handle again
WinWait("PCSX2 [\d\.]+ Setup", "Choose Components", 30)
hwnd := WinExist()
Sleep(200)
ControlClick("Button2", "ahk_id " hwnd, , , , "NA")
WinWait("PCSX2 [\d\.]+ Setup", "Choose Install Location", 30)
ControlClick("Button2", "ahk_id " hwnd, , , , "NA")

Sleep(600)
ControlClick("Button1", "PCSX2 [\d\.]+ Setup", , , , "NA")

WinWait("PCSX2 [\d\.]+ Setup", "has been installed", 30)
ControlClick("Button4", "ahk_id " hwnd, , , , "NA")
Sleep(50)
ControlClick("Button2", "ahk_id " hwnd, , , , "NA")