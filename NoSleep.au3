#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Graphicloads-100-Flat-2-Pointer-2.ico
#AutoIt3Wrapper_Outfile_x64=_NoSleep.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=No Sleep
#AutoIt3Wrapper_Res_Description=No Sleep
#AutoIt3Wrapper_Res_Fileversion=2.0.0.0
#AutoIt3Wrapper_Res_ProductName=No_Sleep
#AutoIt3Wrapper_Res_ProductVersion=2.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Carm0
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
Local $f, $c
Global $q = 0, $hTimer = 0, $aPos, $bPos
Global $y = @DesktopHeight * .8
Global $x = @DesktopWidth * .8

#include <TrayConstants.au3>
Opt("TrayMenuMode", 3)
Opt("TrayOnEventMode", 1)
TrayCreateItem("About")
TrayItemSetOnEvent(-1, "About")
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "About") ; Display the About MsgBox when the tray icon is double clicked on with the primary mouse button.

TraySetState($TRAY_ICONSTATE_SHOW) ; Show the tray menu.


While 1
	Sleep(100)
	$q = $q + 1
	Call("Checktime")
WEnd


Func Checktime()
	$fDiff = TimerDiff($hTimer)
	If $q = 1 Then
		$aPos = MouseGetPos()
		$hTimer = TimerInit()
	ElseIf $fDiff > 30000 Then
		$q = 0
		$bPos = MouseGetPos()
		If ($aPos[0] = $bPos[0]) And ($aPos[1] = $bPos[1]) Then
			$z = Random(1, $y)
			$v = Random(1, $x)
			MouseMove($v, $z, 25)
			$q = 0
			$fDiff = 0
			$hTimer = 0
			$bPos = 0
			$bPos = 0
		EndIf
	EndIf
EndFunc   ;==>Checktime

Func About()
	; Display a message box about the AutoIt version and installation path of the AutoIt executable.
	MsgBox(0, "Do NOT SLEEP", "No Sleep Script" & @CRLF & @CRLF & _
			"Version: 2.0.0.0" & @CRLF & _
			"No Sleep Script by Carm0", 5) ; Find the folder of a full path.
EndFunc ;==>About
