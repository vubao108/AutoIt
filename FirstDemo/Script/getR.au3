#include <Clipboard.au3>
#include <Date.au3>
#include <Misc.au3>

HotKeySet("!r", "GetR")
HotKeySet("!a", "GetA")
HotKeySet("!c", "GetCungC")
HotKeySet("!l", "GetL")
HotKeySet("!j", "GetSongMa")
HotKeySet("!k", "GetNguaChem")
While 1 ;Keep the script open and running in the background
    Sleep(10)
WEnd
    
Func GetR()
    ;ClipPut("")
    WriteLog("GetR")
    $num = _WaitForKeypressOrClick() 
    WriteLog($num)
    For $i = 1 To $num Step +1
        Send("^a")
        Sleep(30)
        Send("+r")
       
    Next
     WriteLog("GetR: " &$num)
    Send("{ESCAPE}")
  
EndFunc

Func GetA()
    ;ClipPut("")
    WriteLog("GetA")
    $num = _WaitForKeypressOrClick() 
    WriteLog($num)
    For $i = 1 To $num Step +1
        Send("^a")
        Sleep(30)
        Send("+a")
       
    Next
     WriteLog("GetA: " &$num)
    Send("{ESCAPE}")
  
EndFunc

Func GetCungC()
    ;ClipPut("")
    WriteLog("GetA")
    $num = _WaitForKeypressOrClick() 
    WriteLog($num)
    For $i = 1 To $num Step +1
        Send("^a")
        Sleep(30)
        Send("+c")
       
    Next
     WriteLog("GetA: " &$num)
    Send("{ESCAPE}")
  
EndFunc

Func GetSongMa()
    ;ClipPut("")
    WriteLog("GetL")
    $num = _WaitForKeypressOrClick() 
    WriteLog($num)
    For $i = 1 To $num Step +1
        Send("^L")
        Sleep(30)
        Send("+r")
       
    Next
     WriteLog("GetL: " &$num)
    Send("{ESCAPE}")
  
EndFunc

Func GetNguaChem()
    ;ClipPut("")
    WriteLog("GetL")
    $num = _WaitForKeypressOrClick() 
    WriteLog($num)
    For $i = 1 To $num Step +1
        Send("^L")
        Sleep(30)
        Send("+c")
       
    Next
     WriteLog("GetL: " &$num)
    Send("{ESCAPE}")
  
EndFunc

Func GetL()
    ;ClipPut("")
    WriteLog("GetL")
    $num = _WaitForKeypressOrClick() 
    WriteLog($num)
    For $i = 1 To $num Step +1
        Send("^L")
        Sleep(30)
        Send("+l")
       
    Next
     WriteLog("GetL: " &$num)
    Send("{ESCAPE}")
  
EndFunc

Func _WaitForKeypressOrClick()
    While 1
       For $c = 31 To 39  Step +1
          If _IsPressed($c) Then 
            WriteLog($c)
            Return(Dec($c) - Dec(30))
          EndIf
       Next

       For $c2 = 60 To 69  Step +1
        If _IsPressed($c2) Then 
          WriteLog($c2)
          Return(Dec($c2) - 86)
        EndIf
     Next
       Sleep(10)
    WEnd
 EndFunc

 Func WriteLog($stringToWrite)

    $sFilePath = "log_autoit.txt"

    ; ; Create a temporary file to write data to.
    ; If Not FileWrite($sFilePath, _NowDate() & " " & _NowTime() & " ")  Then
        ; MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the log file.")
        ; Return False
    ; EndIf

    ; ; Open the file for writing (append to the end of a file) and store the handle to a variable.
    ; Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)
    ; If $hFileOpen = -1 Then
        ; MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the log file.")
        ; Return False
    ; EndIf

    ; ; Write data to the file using the handle returned by FileOpen.

    ; FileWrite($hFileOpen, $stringToWrite & @CRLF)


    ; ; Close the handle returned by FileOpen.
    ; FileClose($hFileOpen)
EndFunc


 Func WriteLog2($stringToWrite)

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
