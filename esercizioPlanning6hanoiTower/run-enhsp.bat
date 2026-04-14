::@echo off
:: 1. Run the planner
::java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -planner sat-hadd -sjr
::java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -sjr

:: 2. Create the logsPDDL folder if it doesn't already exist
::mkdir "%~dp0logsPDDL" 2>nul

:: 3. Rescue the JSON file and put it inside the logsPDDL folder!
::move "%~2.sp_log" "%~dp0logsPDDL\" >nul 2>&1
::move "%~dp2*.json" "%~dp0logsPDDL\" >nul 2>&1

:: 4. Force a "Success" code so VSCode doesn't throw a fake error popup
::exit /b 0

:: site to visualize the node tree
:: https://clementchamayou.github.io/enhsptree/






@echo off
:: ==========================================
:: ENHSP RUNNER SCRIPT
:: ==========================================

:: 0. Generate a robust timestamp (Format: YYYYMMDD_HHMMSS)
:: We use PowerShell to avoid issues with Italian regional date formats (slashes)
for /f %%i in ('powershell -Command "Get-Date -format 'yyyyMMdd_HHmmss'"') do set TIMESTAMP=%%i

:: ==========================================
:: 1. RUN THE PLANNER (CONFIGURATION BLOCK)
:: ==========================================
::
:: COMMON FLAGS EXPLAINED:
:: -o %1        : "Operator". Points to your Domain file (sent by VS Code).
:: -f %2        : "Fact". Points to your Problem file (sent by VS Code).
:: -sjr         : "Search JSON Report". Exports the decision tree for web visualization.
:: -sp <file>   : "Save Plan". Saves the final sequence of actions to a text file.
:: -timeout <n> : Stops the planner after 'n' seconds. (Crucial for your 5-instance benchmarking!)
:: -onlyplan    : Hides the verbose engine metrics and only outputs the clean action list.
:: -pt          : "Print Trajectory". Shows the numeric values (like battery) after every single step.
::
:: HOW TO USE: 
:: Uncomment ONLY ONE of the 'java -jar' lines below by removing the '::' at the start.
:: Ensure all other 'java -jar' lines are commented out with '::'.
:: ==========================================

:: --- OPTION A: THE DRAFTING MODE (Satisficing) ---
:: Best for everyday coding and testing logic. Finds a working plan quickly using the h_add heuristic.
java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -planner sat-hadd -sjr

:: --- OPTION B: THE PERFECTIONIST MODE (Optimal) ---
:: Best for finding the absolute lowest-cost/battery path. Uses the h_max heuristic. (Warning: Much slower!)
::java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -planner opt-hrmax -sjr

:: --- OPTION C: THE EXAM BENCHMARK MODE (Data Collection) ---
:: Best for testing your 5 scaling instances. Stops after 60s, hides console clutter, and saves the plan to a file.
::java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -planner sat-hadd -timeout 60 -onlyplan -sp "%~dp0logsPDDL\clean_plan_output.txt"

:: --- OPTION D: THE DEEP DEBUGGER MODE (Verbose) ---
:: Best when the planner does something weird. Prints the exact state of the universe (and battery) after every step.
:: java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -planner sat-hadd -pt -print_actions


:: 2. Create the logsPDDL folder if it doesn't already exist
:: %~dp0 is a Windows variable that means "the exact folder where this .bat file lives".
:: 2>nul hides the annoying "Folder already exists" error if you run it multiple times.
mkdir "%~dp0logsPDDL" 2>nul

:: 3. Rescue the sp_log file and put it inside the logsPDDL folder!
:: BUG FIX: We changed .sp_log to *.sp_log to catch the file the -sjr flag actually generated.
:: (It looks in the directory of your problem file, which is %~dp2, and moves any .sp_log files).
:: Rescue the sp_log file, move it, AND rename it with the timestamp!
:: It will output files named like: plan_tree_20260414_144117.sp_log
move "%~dp2*.sp_log" "%~dp0logsPDDL\plan_tree_%TIMESTAMP%.sp_log" >nul 2>&1
::move "%~dp2*.sp_log" "%~dp0logsPDDL\" >nul 2>&1

:: 4. Force a "Success" code so VSCode doesn't throw a fake error popup
:: If the move command failed (e.g., no sp_log was generated), VS Code might think the whole run crashed.
:: This exit code tells VS Code "Everything is fine, we finished successfully."
exit /b 0

:: Site to visualize the node tree
:: https://clementchamayou.github.io/enhsptree/