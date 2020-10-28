#include <Clipboard.au3>
#include <Date.au3>

;HotKeySet("^n", "GetR")
HotKeySet("^!c", "GoogleSearch") ;Set Ctrl+Alt+C to launch the function
HotKeySet("^!g","SearchWikiGoogleGoldenDict")
HotKeySet("{F2}","SearchGoldenDict")
HotKeySet("{F3}","InsertAnkiNote")
HotKeySet("^!n","OpenCurrentTextboxWithNotepad")
;HotKeySet("^!d","SearchGoldenDict")

Global $sOldClip ;Declare the varible(s) for clipboard

While 1 ;Keep the script open and running in the background
Sleep(10)
WEnd



Func GoogleSearch() ;Our Function
    ;$sOldClip = ClipGet() ;Save Current Clipboard
    ClipPut("")
    Send("^c")
    ;Sleep(80)
    ;$currentClip = ClipGet()
    if StringLen(ClipGet()) = 0 then
        ;ClipPut("")
        WriteLog("ClipGet()="&ClipGet())
        Send("^a")   
        Sleep(80)       
        Send("^c")  
          
    EndIf
    Sleep(80)  
    $currentClip = ClipGet()
    ShellExecute("https://www.google.com/search?q=" & $currentClip) ;Navigate to search
    WriteLog("Google search: " & $currentClip)
    ;ClipPut("")
    ;Sleep(20)
    ;Send("{ESCAPE}")
    Send("{^ up}")
    ClipPut("")
    ;ClipPut($sOldClip) ;Restore Old Clipboard

EndFunc

Func SearchWikiGoogleGoldenDict()
    ;Sleep(1)
    $sOldClip = ClipGet()
    ClipPut("")
    Send("^c")
    Sleep(80)
    ;$currentClip = ClipGet()
    if StringLen(ClipGet()) = 0 then
        ;ClipPut("")
        WriteLog("ClipGet()="&ClipGet())
        Send("^a")   
        Sleep(80)       
        Send("^c")
        Sleep(80)
    EndIf
    $currentClip = ClipGet()
    ;Sleep(10)

    ShellExecute("https://en.wikipedia.org/w/index.php?search=" & $currentClip )
    ShellExecute("https://www.google.com/search?q=" & $currentClip )
        
    ;~ ShellExecute("C:\Program Files (x86)\GoldenDict\GoldenDict.exe")
    ;~ WinWaitActive('[REGEXPTITLE:GoldenDict]','',0)
    ;~ Sleep(100)
        
    ;~ Send("^v")
    ;~ Send("{ENTER}")
    WriteLog("Searched Wiki vs Google: "&$currentClip)

    if(StringLen($currentClip) < 50) then
        SearchGoldenDict()
    EndIf
   
    ;~ Else
    ;~     MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Error", "Window GoldenDict not activated")
    ;~ ;Sleep(10)
    ;~ EndIf
    ClipPut("")
EndFunc

    

Func SearchGoldenDict()
    Send("^c")
    Sleep(80)
    $currentClip = ClipGet()

    ShellExecute("C:\Program Files (x86)\GoldenDict\GoldenDict.exe")
    Sleep(10)
    ;$winActiveHandle = WinActivate('[REGEXPTITLE:GoldenDict]')
  
    ;WriteLog("brefore call WinWaitActive, Current active title: " & WinGetTitle("[ACTIVE]"))
    
    WinActivate('[CLASS:QWidget]')
    ;WriteLog("brefore call WinActive, Current active title: " & WinGetTitle("[ACTIVE]"))
    
    $activeresult = WinWaitActive('[CLASS:QWidget]')
    $currentActiveTitle =  WinGetTitle("[ACTIVE]")
    WriteLog("after call WinWaitActive, Current active title: " & $currentActiveTitle) 
   
    if $activeresult = False Then
        ;MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Error", "Window GoldenDict not activated")
        WriteLog("Cannot active goldendict with word "&$currentClip)
        
    else 
        WriteLog($currentClip)
        ;start delete old word in goldendict
        $lenOld = StringLen($currentActiveTitle)
        if WinActive('[CLASS:QWidget]') Then
            Sleep(20)
            Send('^a')
            Sleep(20)
            Send('{BS}')
            Sleep(80)
            ;end delete old word
            Send("^v")
            Sleep(20)
            Send("{ENTER}")
            $containSpace = StringInStr($currentClip," ")
            WriteLog("containSpace = " &$containSpace)
            if $containSpace = 0 then
                Sleep(20)
                Send("!s")
            EndIf
        EndIf
        ;Sleep(
        
        ;
    EndIf
    ;ClipPut("")
EndFunc

Func InsertAnkiNote()
    $word = ClipGet()
    Sleep(20)
    Send("^c")
    Sleep(80)
    $meaning = ClipGet()
    $meaning= StringReplace($meaning,@CRLF,'<br>')    
    WriteLog("insertAnkiNote " & $word &":" & $meaning)
    Run('C:\Python38\python.exe F:\Code\AutoIt\anki\importCardWhileRead.py "' & $word &'" "' & $meaning &'"')
    ;ClipPut("")
EndFunc

Func OpenCurrentTextboxWithNotepad()
    ClipPut("")
    Send("^c")
    ;$currentClip = ClipGet()
    Sleep(80)
    if StringLen(ClipGet()) = 0 then
        ;ClipPut("")
        WriteLog("ClipGet()="&ClipGet())
        Send("^a") 
        Sleep(80)       
        Send("^c")       
    EndIf

    $tmpWithNewLine = ClipGet() &  @CRLF;
    ClipPut($tmpWithNewLine)

    if CheckProgramExisted("notepad.exe") = 0 then
        ShellExecute("C:\Windows\notepad.exe") ;Navigate to search
    EndIf

    $h = WinWait("[CLASS:Notepad]")
    WinActivate($h)
    Sleep(10)
    Send("^v")

    ;WriteLog("Google search: " & $currentClip)
    ;ClipPut("")
EndFunc

Func WriteLog($stringToWrite)

    $sFilePath = "F:\Code\AutoIt\FirstDemo\Script\log_autoit.txt"

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

Func CheckProgramExisted($exe)
    Opt('RunErrorsFatal',0)

    ;~ $exe = 'notepad.exe'
    $answer = ""
    $result = 0
    $pid = Run($exe,'',@SW_HIDE)
    If @error Then
        $answer = $exe & ' not exist'
        $result = 0
    Else
        ProcessClose($pid)
        $answer = $exe & ' exist'   
        $result = 1
    EndIf

    ;MsgBox(0,'Answer', $answer)
    WriteLog($exe & " " & $answer )
    Return $result

EndFunc


