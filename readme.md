#MyHotkey
  - hotkeysetter.bat 
	Run this program first to set the hotkey and its path
  - quicklauncher.bat
	Run this program after hotkeys are set
  - keymap.txt  
	user has two way to change its content:
	  1. change it directly by open this file and modify file its content 
          2. follow the instructions on hotkeysetter.bat and change its content
  - readme.txt	
	user manual of this program

#WorkFlow
1. open hotkeysetter.bat and follow its instructions 
2. open quicklauncher to quick launch your target program
3. Or your can ommit step 1 by manually changing the content in keymap.txt 
4. But if do so, keep the format of 
	key, path/to/key 
   for each line 
5. currently, the key is case sensitive, while the path is not


revised version 1.0 (Better use Git for control version)
  - quick launcher changed - change start %%H to CMD /k %%H
