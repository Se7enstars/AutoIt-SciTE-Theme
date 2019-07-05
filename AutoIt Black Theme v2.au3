#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=SCITE.ico
#AutoIt3Wrapper_Res_Description=Se7enstars SciTE black theme
#AutoIt3Wrapper_Res_Fileversion=2.0.0.5
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=© Se7enstars Inc.
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Scite Black theme for AutoIt v3", 499, 201)
GUISetIcon("C:\Program Files\AutoIt3\SciTE\SciTE.exe", -1)
$Button1 = GUICtrlCreateButton("Установить", 408, 120, 83, 20)
GUICtrlSetFont(-1, Default, 800, 0)
GUICtrlSetTip(-1, "Установить тему")
GUICtrlSetCursor (-1, 0)
$Progress1 = GUICtrlCreateProgress(8, 120, 390, 20)
$Label1 = GUICtrlCreateLabel("Путь к папке Scite (AppData)", 8, 45, 300, 17)
$ScitePath = @LocalAppDataDir & "\AutoIt v3\SciTE\"
$Input1 = GUICtrlCreateInput($ScitePath, 8, 60, 449, 21)
$Label3 = GUICtrlCreateLabel("Установка 0%", 194, 95, 150, 17)
$Label4 = GUICtrlCreateLabel("Scite Black theme for AutoIt v3", 51, 6, 363, 31)
GUICtrlSetFont(-1, 16, 800, 0, "Elephant")
$Icon1 = GUICtrlCreateIcon(@AutoItExe, -1, 8, 4, 32, 32)
$Button2 = GUICtrlCreateButton("...", 464, 60, 27, 21)
GUICtrlSetTip(-1, "Select Scite dir from AppData\Local\...")
$Button4 = GUICtrlCreateButton("ю", 464, 91, 27, 21)
GUICtrlSetFont(-1, 10, 800, 0, "Webdings")
GUICtrlSetTip(-1, "О программе")
GUICtrlSetCursor (-1, 4)
$red = GUICtrlCreateLabel("", 8, 145, 483, 15)
GUICtrlSetBkColor(-1, 0xff0000)
$white = GUICtrlCreateLabel("S E 7 E N S T A R S", 8, 160, 483, 20, 0x01 + 0x0200)
GUICtrlSetFont(-1, 10, 800, Default, "Times new roman", 5)
GUICtrlSetBkColor(-1, 0xffffff)
$green = GUICtrlCreateLabel("", 8, 180, 483, 15)
GUICtrlSetBkColor(-1, 0x00ff00)
$RuChrCheck = GUICtrlCreateCheckbox("Ru - char'set", 350, 95, 100, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button2
			$tmp = FileSelectFolder("Выбирайте Путь к папке Scite (AppData)", @LocalAppDataDir, Default, Default, $Form1)
			If Not @error Then
				If StringInStr($tmp, "SciTE") Then
					$tmp &= "\"
					GUICtrlSetData($Input1, $tmp)
				Else
					MsgBox(48, "Внимание!", "Не тот путь выбран!", 0, $Form1)
				EndIf
			EndIf
		Case $Button4
			_Onas()
		Case $Button1
			If GUICtrlRead($Input1) <> "" Then
				_Install()
			Else
				MsgBox(48, "Внимание!", "Не тот путь выбран для папки SciTE!", 0, $Form1)
			EndIf
	EndSwitch
WEnd

Func  _Onas()
	$text = "Программа обновлено: 10.06.2018"& @CRLF &"Разработчики:"& @CRLF _
	&"-- Se7enstars (O.SRB)"& @CRLF &"-- Flash (Muhammadjon)"& @CRLF &"Версия: 2.0"
	MsgBox(64, "О нас", $text)
EndFunc


Func _Install()
	Sleep(50)
	_Progress(1)
	If FileExists($ScitePath & "SciTEUser.properties") Then
		$hmsg = MsgBox(4+32, "Внимание", "Хотите установить тему?", 0, $Form1)
		If $hmsg = 6 Then
			FileDelete($ScitePath & "SciTEUser.properties")
			_Progress(2)
			FileWrite(FileOpen($ScitePath & "SciTEUser.properties", 1), _GetTheme())
			MsgBox(64, "Статус", "Все! Установленно", 0, $Form1)
		Else
			_Progress(3)
		EndIf
	Else
		_Progress(2)
		FileWrite(FileOpen($ScitePath & "SciTEUser.properties", 1), _GetTheme())
		MsgBox(64, "Статус", "Все! Установленно", 0, $Form1)
	EndIf

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
	ElseIf $n = 3 Then
		For $i=50 To 0 Step -1
			GUICtrlSetData($Label3, "Установка "&$i&"%")
			GUICtrlSetData($Progress1, $i)
			Sleep(1)
		Next
	Else
		;;
	EndIf
EndFunc

Func _GetTheme()
	$Theme = "import au3.UserUdfs" & @CRLF & _
	"import au3.keywords.user.abbreviations" & @CRLF & _
	"font.base=font:Verdana,size:10,$(font.override)" & @CRLF & _
	"font.monospace=font:Courier New,size:10" & @CRLF & _
	"proper.case=0" & @CRLF & _
	"use.tabs=1" & @CRLF & _
	"indent.size=4" & @CRLF & _
	"indent.size.*.au3=4" & @CRLF & _
	"tabsize=4" & @CRLF & _
	"style.au3.32=style.*.32=$(font.base),back:#3F3F3F" & @CRLF & _
	"caret.line.back=#303030" & @CRLF & _
	"selection.fore=#01B9C2" & @CRLF & _
	"selection.alpha=50" & @CRLF & _
	"selection.back=#3A3A3A" & @CRLF & _
	"style.au3.34=fore:#D7C47D,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.35=fore:#7F9F7F,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.0=fore:#DCDCCC,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.1=fore:#7F9F7F,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.2=fore:#7F9F7F,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.3=fore:#8CD0D3,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.4=fore:#EFEF7E,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.5=fore:#D7C47D,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.6=fore:#FFAD77,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.7=fore:#CC9393,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.8=fore:#9F9D6D,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.9=fore:#CEDBDB,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.10=fore:#BDE4BA,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.11=fore:#FFCFAF,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.12=fore:#E0B3E1,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.13=fore:#CC9393,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.14=fore:#CF72CF,italics,bold,back:#3F3F3F" & @CRLF & _
	"style.au3.15=fore:#0080FF,italics,bold,back:#3F3F3F" & @CRLF & _
	"openpath.$(au3)=$(SciteDefaultHome)\..\include;" & @CRLF
	If GUICtrlRead($RuChrCheck) = 1 Then
		$Theme &= "character.set=1251"
	EndIf
	Return $Theme
EndFunc



