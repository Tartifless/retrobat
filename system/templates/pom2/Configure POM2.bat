@echo off
rem Launch POM2 with its settings kept inside the emulator folder, exactly like a game launched from RetroBat does
rem POM2 has no portable mode with no command line override.
setlocal
set "APPDATA=%~dp0."
"%~dp0POM2.exe" %*
endlocal