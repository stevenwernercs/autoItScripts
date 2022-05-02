#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
#Region ### START Koda GUI section ### Form=C:\Users\West\Documents\AutoIt\Koda\CalendarW.kxf

$Calendar = GUICreate("Calendar:", 215, 278, 483, 274)

GUICtrlCreateLabel("Total:", 0, 0, 80, 17)
$TOTAL = GUICtrlCreateLabel("", 49, 4, 164, 41, $SS_RIGHT)
	GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$YEARp = GUICtrlCreateProgress(1, 45, 212, 8)
GUICtrlCreateLabel("Year:", 0, 54, 80, 17)
$YEAR = GUICtrlCreateLabel("$", 49, 60, 164, 41, $SS_RIGHT)
	GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$MONTHp = GUICtrlCreateProgress(1, 101, 212, 8)
GUICtrlCreateLabel("Month:", 0, 110, 80, 17)
$MONTH = GUICtrlCreateLabel("", 49, 116, 164, 41, $SS_RIGHT)
	GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$WEEKp = GUICtrlCreateProgress(1, 157, 212, 8)
GUICtrlCreateLabel("Week:", 0, 166, 80, 17)
$WEEK = GUICtrlCreateLabel("", 49, 172, 164, 41, $SS_RIGHT)
	GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$DAYp = GUICtrlCreateProgress(1, 213, 212, 8)
GUICtrlCreateLabel("Day:", 0, 222, 23, 17)
$DAY = GUICtrlCreateLabel("", 99, 228, 114, 41, $SS_RIGHT)
	GUICtrlSetFont(-1, 24, 400, 0, "MS Sans Serif")
$PENNYp = GUICtrlCreateProgress(1, 269, 212, 8)
;GUICtrlSetState(-1, $GUI_HIDE)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Opt("GUIOnEventMode", 1)
GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")

$Cday = @YDAY
$hr = 10.11071429
$y = 500
$m = 1335.4 - 500
$w = 0
$d = (@HOUR * $hr) + (@MIN * ($hr/60)) + (@SEC * (($hr/60)/60))
$t = (1335.4) + (Floor(((@YDAY - 27) * ($hr*24))*100)/100) + $d

$y = 2497.24
For $i = @MON To 3 Step -1
	$y = $y + (_DateDaysInMonth(@YEAR, $i - 1) * ($hr*24))
Next
$m = Floor(@MDAY/7) * 7 * ($hr*24)
$w = ((@WDAY - 1) * ($hr*24))

GUICtrlSetData($YEAR, "$" & Floor($y*100)/100)
GUICtrlSetData($MONTH, "$" & Floor($m*100)/100)
GUICtrlSetData($WEEK, "$" & Floor($w*100)/100)

$i = 1
While $i > 0
	;MsgBox(0, Floor((Mod($d*100, 1)*100)*(36/10)), "")
	;GUICtrlDelete($PENNYp)
	;$PENNYp= GUICtrlCreateGraphic(35, 230, 40, 40)
	;GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0, 0xff)
	;GUICtrlSetGraphic(-1, $GUI_GR_PIE, 20, 20, 20, 90, -Floor((Mod($d*100, 1)*100)*(36/10)))
	GUICtrlSetData($PENNYp, Mod($d*100, 1)*100)
	$d = $d + ((($hr/60)/60)/10)
	$t = $t + ((($hr/60)/60)/10)
	GUICtrlSetData($DAY, "$" & Floor($d*100)/100)
	GUICtrlSetData($TOTAL, "$" & Floor($t*100)/100)
	GUICtrlSetData($DAYp, (@HOUR * 60 + @MIN) * (10/144))
	GUICtrlSetData($WEEKp, (@WDAY / 7) * 100)
	GUICtrlSetData($MONTHp, (@MDAY / _DateDaysInMonth(@YEAR, @MON)) * 100)
	GUICtrlSetData($YEARp, @YDAY * (100/365))
	If ($i / 36000) = 1 Then
		$d = (@HOUR * $hr) + (@MIN * ($hr/60)) + (@SEC * (($hr/60)/60))
		$i = 1
	ElseIf @YDAY > $Cday Then
		If @MON = 1 Then
			$w = ((@WDAY - 3) * ($hr*24))
		Else
			$y = 2497.24
			For $i = @MON To 3 Step -1
				$y = $y + (_DateDaysInMonth(@YEAR, $i - 1) * ($hr*24))
			Next
			$m = Floor(@MDAY/7) * 7 * ($hr*24)
			$w = ((@WDAY - 1) * ($hr*24))
		EndIf
		$d = (@HOUR * $hr) + (@MIN * ($hr/60)) + (@SEC * (($hr/60)/60))
		$t = (1335.4) + (Floor(((@YDAY - 27) * ($hr*24))*100)/100) + $d
		GUICtrlSetData($YEAR, "$" & Floor($y*100)/100)
		GUICtrlSetData($MONTH, "$" & Floor($m*100)/100)
		GUICtrlSetData($WEEK, "$" & Floor($w*100)/100)
		$Cday+=1
	EndIf
	$i+=1
	sleep(100)
WEnd




Func SpecialEvents()
	If @GUI_CtrlId = $GUI_EVENT_CLOSE Then Exit
EndFunc   ;==>SpecialEvents
