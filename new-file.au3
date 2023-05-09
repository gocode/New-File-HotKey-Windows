#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#Include <GuiListView.au3>
#include <Array.au3>

AutoItSetOption("WinTitleMatchMode", 3)

HotKeySet("^+f", "HotKeyPressed") ; Ctrl+Shift+f

While 1
        Sleep(100)
WEnd

Func HotKeyPressed()

	;MsgBox($MB_SYSTEMMODAL, "", "This is a message.")
	
	If WinActive("[CLASS:CabinetWClass]") Then
	
      $hWnd = WinActive("[CLASS:CabinetWClass]");

      Local $sToolbarText = ControlGetText("[ACTIVE]", "", "[CLASS:ToolbarWindow32;INSTANCE:3]")  

      Local $sAddress = StringReplace($sToolbarText, "Adresse : ", "")

      CreateNewFile($hWnd, $sAddress)

	EndIf

EndFunc   ;==>HotKeyPressed


Func CreateNewFile($hWnd, $Path)
	
		ConsoleWrite("Open path : " & $Path & @CRLF)

		; Create a constant variable in Local scope of the message to display in FileSaveDialog.
		Local Const $sMessage = "Créer un nouveau fichier"

		; Display a save dialog to select a file.
		Local $sFileSaveDialog = FileSaveDialog($sMessage, $Path, "All (*.*)", $FD_PATHMUSTEXIST, "", $hWnd)

		If @error Then
				$error = @error

				; Display the error message.
				;MsgBox($MB_SYSTEMMODAL, "", "No file was saved. | Error (" & $error & ")")
		Else
				; Retrieve the filename from the filepath
				Local $sFileName = StringTrimLeft($sFileSaveDialog, StringInStr($sFileSaveDialog, "\", $STR_NOCASESENSEBASIC, -1))

				ConsoleWrite("Save at : " & $Path & "\" & $sFileName & @CRLF)

				FileOpen($Path & "\" & $sFileName, 1)

				; Display the saved file.
				;MsgBox($MB_SYSTEMMODAL, "", "You saved the following file:" & @CRLF & $sFileSaveDialog)
		EndIf
EndFunc   ;==>CreateNewFile
