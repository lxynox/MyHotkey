:: 				------ START CODE -------
ECHO OFF
ECHO This is the automation file for setting up your personal hotkeys

:: show TIME and DATE first
ECHO %time% . %date%

:: show your current directory info
dir

:: show your ip configuration & netstat
IPCONFIG > ipconfig.txt
NETSTAT > portstatus.txt

:: make a new directory - named MyHotkey
MKDIR MyHotkey

:: retrieve user inputs
:: get user defined hotkey, like "abc, bcd"
SET /p _hotkey="Enter your hotkey name(like "abc,bcd"): " 
SET /p _targetpath="Enter the path to the hotkey(path/to/key): "

 
:: ECHO SPECIAL CHARACTERS
(
ECHO ^<!DOCTYPE html^>                     				  > index.html
ECHO   ^<head^>			     					  >> index.html
ECHO     ^<title^>Generated html^</title^> 			          >> index.html
ECHO   ^</head^> 						    	  >> index.html	
ECHO   ^<body^>Greetings from xuanyu li   				  >> index.html
ECHO   ^<form^  style="width:800px;margin-left:auto;margin-right:auto"    >> index.html
ECHO   	    method="get"action=""^>   					  >> index.html
ECHO     ^<table style="border-spacing:50px"^>				  >> index.html		            >> index.html
ECHO	   ^<th^>key^</th^>^<th^>path^</th^>			          >> index.html
ECHO       ^<tr^>		             				  >> index.html
ECHO         ^<td^>^<input type="text" name="key"/^>^</td^>               >> index.html
ECHO	     ^<td^>^<input type="text" name="path"/^>^</td^>              >> index.html
ECHO	   ^</tr^>							  >> index.html
ECHO     ^</table^>					   		  >> index.html
ECHO     ^<input type="submit" value="Commit Change"/^>			  >> index.html
ECHO       ^</form^>   					 	          >> index.html		
ECHO   ^</body^>^</html^> 		      			          >> index.html		
)
start index.html

:makefile
:: ECHO Defined hotkey, Defined path > log.txt
ECHO %_hotkey%, %_targetpath% >> log.txt
start log.txt

SET /a _open=1
if %_open% == 1 (
  start %_targetpath%
)


SET /P _searchkey="Enter your hotkey to open the program: "
:: search the right path corresponds to the user's input hotkey
FOR /F "tokens=1,2 delims=," %%G IN (log.txt) DO IF %%G == %_searchkey% start %%H

:: continue navigating
ECHO PLEASE CHOOSE THE DIRECTORY YOU WOULD LIKE TO ACCESS BY PRESS YOUR DEFINED HOTKEY


:: start newFile.html

PING http://home.allenlxy.com
ECHO All is done pinging my website
PAUSE

