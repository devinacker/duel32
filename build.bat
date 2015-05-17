@ECHO OFF

SET RELEASE=f

CD %~dp0
MKDIR build
XCOPY /s /y /exclude:exclude.txt wadsrc build
CD build
MKDIR acs
..\bin\acc.exe scripts\GLOBAL.acs acs\GLOBAL.o
IF errorlevel 1 (
	PAUSE
	exit /b 1
)
FOR /R %%f IN (*.png) DO ..\bin\pngout.exe "%%f"
..\bin\kzip.exe /r ..\duel32%RELEASE%.pk3 *
CD ..
