#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=SCITE.ico
#AutoIt3Wrapper_UseUpx=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Scite Black theme for AutoIt v3", 499, 201, 218, 129)
GUISetIcon("C:\Program Files (x86)\AutoIt3\SciTE\SciTE.exe", -1)
$Button1 = GUICtrlCreateButton("Установить", 408, 160, 83, 25)
GUICtrlSetTip(-1, "Установить тему")
GUICtrlSetCursor (-1, 0)
$Progress1 = GUICtrlCreateProgress(8, 163, 390, 20)
$Label1 = GUICtrlCreateLabel("Путь к папками Autoit v3", 8, 40, 129, 17)
If @AutoItExe Then
	$ScitePath = StringReplace(@AutoItExe, "autoit3.exe", "") & "SciTE\Properties\"
Else
	$ScitePath = "Не найден папка с установленно AutoIt 3"
EndIf
$Input1 = GUICtrlCreateInput($ScitePath, 8, 60, 449, 21)
$Label2 = GUICtrlCreateLabel("Путь к папками User", 10, 89, 109, 17)
$Input2 = GUICtrlCreateInput(@UserProfileDir & "\", 8, 104, 449, 21)
$Label3 = GUICtrlCreateLabel("Установка 0%", 194, 136, 150, 17)
$Label4 = GUICtrlCreateLabel("Scite Black theme for AutoIt v3", 51, 6, 363, 31)
GUICtrlSetFont(-1, 16, 800, 0, "Elephant")
$Icon1 = GUICtrlCreateIcon(@AutoItExe, -1, 8, 4, 32, 32)
$Button2 = GUICtrlCreateButton("...", 464, 60, 27, 21)
GUICtrlSetTip(-1, "Выбирайте каталог к папка установленный AutoIt3")
$Button3 = GUICtrlCreateButton("...", 464, 103, 27, 21)
GUICtrlSetTip(-1, "Выбирайте каталог к папка установленный Пользватель")
$Button4 = GUICtrlCreateButton("!", 464, 131, 27, 21)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUICtrlSetTip(-1, "О программе")
GUICtrlSetCursor (-1, 4)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button2
			$tmp = FileSelectFolder("Выбирайте каталог к папка установленный AutoIt3", @ProgramFilesDir, Default, Default, $Form1)
			If Not @error Then
				If StringInStr($tmp, "AutoIt") Then
					$tmp &= "\SciTE\Properties\"
					GUICtrlSetData($Input1, $tmp)
				Else
					MsgBox(48, "Внимание!", "Не тот путь выбран!", 0, $Form1)
				EndIf
			EndIf
		Case $Button3
			$tmp = FileSelectFolder("Выбирайте каталог к папка установленный Пользватель", @UserProfileDir, Default, Default, $Form1)
			GUICtrlSetData($Input2, $tmp & "\")
		Case $Button4
			_Onas()
		Case $Button1
			If GUICtrlRead($Input1) <> "" Then
				If GUICtrlRead($Input2) <> "" Then
					_Install()
				Else
					MsgBox(48, "Внимание!", "Не тот путь выбран для папки USER!", 0, $Form1)
				EndIf
			Else
				MsgBox(48, "Внимание!", "Не тот путь выбран для папки AutoIt3!", 0, $Form1)
			EndIf
	EndSwitch
WEnd

Func  _Onas()
	$text = "Программа разработанно: 07.11.2016"& @CRLF &"Разработчики:"& @CRLF _
	&"-- Se7enstars (O.SRB)"& @CRLF &"-- Flash (Muhammadjon)"& @CRLF &"Версия: 1.0.0"
	MsgBox(64, "О нас", $text)
EndFunc


Func _Install()
	FileInstall("others.properties", GUICtrlRead($Input1) & "others.properties", 1)
	_Progress(1)
	FileInstall("SciTEUser.properties", GUICtrlRead($Input2) & "SciTEUser.properties", 1)
	_Progress(2)
	MsgBox(64, "Статус", "Все! Установленно", 0, $Form1)
EndFunc

Func _Progress($n)
	If $n = 1 Then
		For $i=0 To 50 Step 1
			GUICtrlSetData($Label3, "Установка "&$i&"%")
			GUICtrlSetData($Progress1, $i)
			Sleep(10)
		Next
	ElseIf $n = 2 Then
		For $i=50 To 100 Step 1
			GUICtrlSetData($Label3, "Установка "&$i&"%")
			GUICtrlSetData($Progress1, $i)
			Sleep(100)
		Next
	EndIf
EndFunc






