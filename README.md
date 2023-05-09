# New-File-HotKey-Windows
Create new file from Keyboard shortcuts on Windows with AutoIt 3

Tested on Windows 10

## How to use it ?

You can execute the new-file.au3 file the [AutoIt running script](https://www.autoitscript.com/site/autoit/downloads/) software.

Or you can compile it to exe, with the [Aut2Exe](https://www.autoitscript.com/site/autoit/downloads/) software.


## Start the program on Windows startup

You can launch the exe file on Windows startup :

1. Create a shortcut of the exe file (right click: Create shortcut)
2. Move the new shortcut in your startup folder : C:\Users\%user%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
3. Et voilà

## Customization

You can change the keyboard hotkey in this function :
```
HotKeySet("^+f", "HotKeyPressed") ; Ctrl+Shift+f
```

You will find how to use other special keys in this [documentation](https://www.autoitscript.com/autoit3/docs/functions/Send.htm)
