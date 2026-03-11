@echo off
:: 1. Run the planner
::java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -planner sat-hadd -sjr
java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -sjr

:: 2. Create the logsPDDL folder if it doesn't already exist
mkdir "%~dp0logsPDDL" 2>nul

:: 3. Rescue the JSON file and put it inside the logsPDDL folder!
move "%~2.sp_log" "%~dp0logsPDDL\" >nul 2>&1
::move "%~dp2*.json" "%~dp0logsPDDL\" >nul 2>&1

:: 4. Force a "Success" code so VSCode doesn't throw a fake error popup
::exit /b 0

:: site to visualize the node tree
:: https://clementchamayou.github.io/enhsptree/
