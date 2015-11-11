:: This is the quick program launcher to launch any executable(.exe, .bat etc) 
:: under windows by the <hotkey, path> you set in hotkeysetter.bat

:: only to specify the hotkey, like "java, python, etc" in the command line interface 
:: you could quickly open the program as you want

ECHO OFF
:: continue navigating
ECHO current time and date
ECHO %Time% . %Date%

:: current directory info
:: DIR

:: ECHO your network status are stored in ipconfig file
:: IPConfig > ipconfig.txt

:: ECHO CHeck your port status in portstatus file
:: netstat > portstatus.txt


:: SET /p _delete="Delte them all?[Y|N] "
:: IF %_delete% == Y (del ipconfig.txt portstatus.txt) 

: start
SET /P _searchkey="Enter your hotkey to open the program(like java, python etc): "

:: search the right path corresponds to the user's input hotkey
FOR /F "tokens=1,2 delims=," %%G IN (keymap.txt) DO (
  IF %%G == %_searchkey% (CMD /k %%H)
)


:: ECHO eof
PAUSE

:: DO IT RECURSIVELY 
GOTO :start

