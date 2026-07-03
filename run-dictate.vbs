' Launches dictate.py hidden (no console window). Portable: finds its own folder
' and the standard per-user Python 3.12. Copy this into shell:startup to auto-run at login.
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
here = fso.GetParentFolderName(WScript.ScriptFullName)
pyw = sh.ExpandEnvironmentStrings("%LOCALAPPDATA%\Programs\Python\Python312\pythonw.exe")
If Not fso.FileExists(pyw) Then pyw = "pythonw"  ' fallback: whatever's on PATH
sh.Run """" & pyw & """ """ & here & "\dictate.py""", 0, False
