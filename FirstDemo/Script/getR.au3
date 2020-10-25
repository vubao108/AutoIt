#include <Clipboard.au3>
#include <Date.au3>
#include <Misc.au3>

HotKeySet("^n", "GetR")
Func GetR()
    ClipPut("")
    $num = _WaitForKeypressOrClick()
    WriteLog($num)
    For $i = 0 To $num Step +1
        Send("^a")
        Sleep(30)
        Send("+t")
        WriteLog("GetR")
    Next
    Send("{ESCAPE}")
  
EndFunc


Func _WaitForKeypressOrClick()
    While 1
       For $c = 1 To 165
          If _IsPressed($c) Then 
             Return($c)
          EndIf
       Next
       Sleep(20)
    WEnd
 EndFunc

 Func WriteLog($stringToWrite)

    $sFilePath = "log_autoit.txt"

    ; Create a temporary file to write data to.
    If Not FileWrite($sFilePath, _NowDate() & " " & _NowTime() & " ")  Then
        MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the log file.")
        Return False
    EndIf

    ; Open the file for writing (append to the end of a file) and store the handle to a variable.
    Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)
    If $hFileOpen = -1 Then
        MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the log file.")
        Return False
    EndIf

    ; Write data to the file using the handle returned by FileOpen.

    FileWrite($hFileOpen, $stringToWrite & @CRLF)


    ; Close the handle returned by FileOpen.
    FileClose($hFileOpen)
EndFunc
