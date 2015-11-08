:: This the bat file for storing <hotkey, path> pairs into an external file
:: You can directly check or modify the txt file(keymap.txt)
:: The external file named as keymap.txt with each line formatted as 
:: 	hotkey_name , program_path seperated by semicolons
:: Another bat file, quicklauncher.bat, serves the ability to open a program only using 
:: 	the defined hotkey
			
::			 ----- START CODE -----
:: IN ORDER TO REMOVE COMMAND LINE MSG, CLOSE ECHO
ECHO OFF 
SETLOCAL enabledelayedexpansion

:: get <hotkey, path> pairs
:start
SET /p _hotkey="Enter your hotkey name(like "java, python"): " 
SET /p _targetpath="Enter the path to the hotkey(path/to/hotkey): "

:: store into external file - keymap.txt
:: CHECK IF THE FILE IS CREATED
IF EXIST keymap.txt (
:: check if repeated  
  SET /a "_count=0" 
  SET "_repeated=false"

  FOR /F "tokens=1,2 delims=," %%G IN (keymap.txt) DO (
    IF %%G == %_hotkey% (
      ECHO REPEATED HOTKEY 
      SET "_repeated=true"
      SET /p _mod="Modify its path?[Y|N]: "
      IF !_mod! == Y (
        ECHO %%G, %_targetpath% >> newkeymap.txt
      )
    ) ELSE (
      IF !_count! == 0 (
        :: initialize first line of the new file
        ECHO %%G, %%H > newkeymap.txt
        SET /a "_count=1" 
      ) ELSE ECHO %%G, %%H >> newkeymap.txt
    )
  )
  :: no repeat case: append the new <key, value> pair to the file
  IF !_repeated! == false (
    ECHO %_hotkey%, %_targetpath% >> newkeymap.txt
  )
  :: delete old and rename the new one as the old
  DEL keymap.txt
  RENAME newkeymap.txt keymap.txt
) ELSE (
  ECHO HOTKEY, PATH > keymap.txt
  ECHO %_hotkey%, %_targetpath% >> keymap.txt
)

:: Ask user whether willing to open the file
:openfile
SET /p _open="Do you want to open the keymap file?[Y|N]: "
IF %_open% == Y (
  start keymap.txt
  GOTO :start
) ELSE (EXIT)