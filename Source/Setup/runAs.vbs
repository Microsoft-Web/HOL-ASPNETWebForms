setupScript = "doSetup.cmd"

If wscript.arguments.length<>0 Then
	setupScript = wscript.arguments(0)
End if

args = ""
Set shell = CreateObject("Shell.Application")
shell.ShellExecute setupScript, args, "", "runas"

