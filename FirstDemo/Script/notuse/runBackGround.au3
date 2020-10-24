#include <Clipboard.au3>
HotKeySet("!^c", "GoogleSearch") ;Set Ctrl+Alt+C to launch the function

Global $sOldClip ;Declare the varible(s) for clipboard

While 1 ;Keep the script open and running in the background
Sleep(10)
WEnd

Func GoogleSearch() ;Our Function
$sOldClip = ClipGet() ;Save Current Clipboard
Send("^c") ;Copy Selected Text to Clipboard
ShellExecute("https://www.google.com/search?q=" & ClipGet()) ;Navigate to search
ClipPut($sOldClip) ;Restore Old Clipboard
EndFunc