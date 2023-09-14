Set shell = WScript.CreateObject("WScript.Shell")

desktopPath = shell.SpecialFolders("Desktop")
fil = desktopPath + "\Ruby Terminal.lnk"

Set shortCut = shell.CreateShortcut(fil)
shortCut.TargetPath = "c:\home\winconf\terminal.bat"
shortCut.IconLocation = "c:\home\winconf\terminal.ico"

shortCut.Save
