#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <MsgBoxConstants.au3>
Send("!{ESC}")
;Sleep(1)
$sOldClip = ClipGet()
Send("^c")
$curentClip = ClipGet()
;Sleep(10)

;~ ShellExecute("https://en.wikipedia.org/w/index.php?search=" & $curentClip )
;~ ShellExecute("https://www.google.com/search?q=" & $curentClip )
;~ ;Sleep(100)
ShellExecute("C:\Program Files (x86)\GoldenDict\GoldenDict.exe")
if WinActivate('[REGEXPTITLE:GoldenDict]','') then 
	;$currentActiveWindowTitle  = WinGetTitle("[active]")
	;MsgBox($MB_SYSTEMMODAL, "Title =" & $currentActiveWindowTitle , "currentWord =  " & $curentClip)
	Sleep(10)
Else
	MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Error", "Window GoldenDict not activated")
;Sleep(10)
EndIf
Send("^v")
Send("{ENTER}")
;MsgBox($MB_SYSTEMMODAL, "Title", "currentActive =  " & $currentActiveWindowTitle & " seconds or select the OK button.", $curentClip)
;ClipPut($sOldClip)