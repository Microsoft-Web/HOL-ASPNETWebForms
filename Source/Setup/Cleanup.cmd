@echo off
echo.
echo ======================================================
echo Uninstall Visual Studio 11 Code Snippets for the lab
echo ======================================================
echo.

SET Preffix=WebFormsLabEx

DEL /Q /F "%USERPROFILE%\Documents\Visual Studio 11\Code Snippets\Visual C#\My Code Snippets\%Preffix%*.snippet" 2>NUL
DEL /Q /F "%USERPROFILE%\Documents\Visual Studio 11\Code Snippets\Visual Basic\My Code Snippets\%Preffix%*.snippet" 2>NUL
DEL /Q /F "%USERPROFILE%\Documents\Visual Studio 11\Code Snippets\XML\My Xml Snippets\%Preffix%*.snippet" 2>NUL
DEL /Q /F "%USERPROFILE%\Documents\Visual Studio 11\Code Snippets\Visual Web Developer\My HTML Snippets\%Preffix%*.snippet" 2>NUL
DEL /Q /F "%USERPROFILE%\Documents\Visual Studio 11\Code Snippets\SQL\My Code Snippets\%Preffix%*.snippet" 2>NUL
DEL /Q /F "%USERPROFILE%\Documents\Visual Studio 11\Code Snippets\Visual C++\My Code Snippets\%Preffix%*.snippet" 2>NUL
DEL /Q /F "%USERPROFILE%\Documents\Visual Studio 11\Code Snippets\JavaScript\My Code Snippets\%Preffix%*.snippet" 2>NUL

echo Lab Code snippets have been removed!
echo.
pause