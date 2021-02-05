#include <Date.au3>
#include <ScreenCapture.au3>

;~ $iPID = Run('"' & @ComSpec & '" /c cmd start ' & @ScriptDir & "\platform-tools\adb.exe -s 127.0.0.1:5555 shell", '', @SW_HIDE, $STDIN_CHILD)


;~ $iPID = Run('"' & @ComSpec & '" /c cmd /c start '  & @ScriptDir & '\platform-tools\adb.exe -s 127.0.0.1:5555 shell', '',  @SW_HIDE, $STDIN_CHILD + $STDOUT_CHILD  + $RUN_CREATE_NEW_CONSOLE)

;~ RunWait(@ComSpec & " /c " & $CMD)
;~  Local $iPID = Run("notepad.exe", "", @SW_DISABLE)

const $startBtn = 0x6BCA12
const $eventAccess = 0xFFD21F
const $fight = 0x9CC9E4
const $rezulBtn = 0x0E90E8
const $collectBtn = 0x63C50A
const $nextBtn = 0x0E91E8
const $seriaWin = 0xEC4520
const $dirADB = 'C:\Program Files\BlueStacks\HD-Adb.exe'

HotKeySet("t","test")
HotKeySet("y","Example")

HotKeySet("b","main")
HotKeySet("{ESC}","killswitch")

Global $iPID

func test()
	_log('Connecting....')
	$adbConnectPID = Run($dirADB  & " connect 127.0.0.1:5555", "", @SW_HIDE, $STDIN_CHILD)
	_log($adbConnectPID)
EndFunc



Func Example()
	_log($dirADB)

	$iPID = Run($dirADB & " -s 127.0.0.1:5555 shell", "", @SW_HIDE, $STDIN_CHILD)
	_log($iPID)
	StdinWrite($iPID, "input tap 1140 844")

	; Calling StdinWrite without a second parameter closes the stream.
	StdinWrite($iPID)


EndFunc   ;==>Example



func _screen()
	$time = StringReplace (_NowTime(), ":", "_")


	$ActiveWindow = WinGetHandle("[active]")
	$fFreeBmp = True
	$Image = _ScreenCapture_CaptureWnd ( "", $ActiveWindow, 0, 0, -1, -1)
	_ScreenCapture_SaveImage ( @ScriptDir & "\images\" & _NowDate() &"-"& $time & ".jpg", $Image)

EndFunc

func main()
	_screen()
	while 1
	_log("Start")
	Sleep(3000)
	$pix = pixelSearch(572, 47, 1213, 230, 0x3E1DAB, 1) ; cancel invite friend
	  if IsArray($pix) Then
		  MouseClick("LEFT", $pix[0], $pix[1],1,1)
	  EndIf

	$pix = pixelSearch(920, 152, 964, 190, 0x3E1DAB, 1) ; cancel invite friend
	  if IsArray($pix) Then
		  _click(920, 152)
	  EndIf

		$pix = pixelSearch(411, 456, 446, 487, 0xEE4822, 1) ; cancel invite friend
	  if IsArray($pix) Then
		  _click(446, 487)
	  EndIf

		$pix = pixelSearch(204, 330, 261, 367, 0x389FBF, 1) ; level up
	  if IsArray($pix) Then
		  _click(798, 642)
	  EndIf

		$pix = pixelSearch(300, 234, 373, 294, 0x0A8CEC, 1) ; level up
	  if IsArray($pix) Then
		  _click(798, 642)
	  EndIf


	If (isMainScreen()) Then
		_log("isMainScreen")

		If(isHasMission()) Then
			_log("isHasMission")
			openMissionScreen()
			Sleep(3000)
			missionBot()
			Send("g")
		EndIf

		If(isHasEvent()) Then
			_log("isHasEvent")
			openEventScreen()
			Sleep(3000)
			missionBot()
			Sleep(3000)
			eventBot()
			Sleep(3000)
			ContinueLoop
		EndIf

		MouseClick("LEFT", 1085, 672, 1, 1)
	EndIf

	If (isEventScreen()) Then
		_log("If (isEventScreen()) Then")
		missionBot()
		eventBot()
		Sleep(3000)
	EndIf
;695 8054 31

	If(isFightScreen()) Then
		_log("If(isFightScreen()) Then")
		fightBot()
		Sleep(3000)
	EndIf

	If(isTablePlayers()) Then
		log("isTablePlayers")
		TablePlayersClick()
	EndIf

	If(isRezultScreen()) Then
		_log("isRezultScreen")
		specCollectClick()
		Sleep(3000)
	EndIf


	If(isSpecColletc()) Then
		_log("isSpecColletc")
		specCollectClick()
	EndIf

	If(isSeriaWinScreen()) Then
		_log("isSeriaWinScreen")
		seriaWinClick()
	EndIf

	If(isImproveHeroes()) Then
		_log("isImproveHeroes")
		_click(943, 173) ; Close
		Sleep(3000)
		_click(498, 498) ; Acept
	EndIf


	WEnd
;~ _log(isMainScreen())
;~ _log(isMissionScreen())
;~ _log(isEventScreen())
;~ _log(isHasEvent())
;~ _log(isHasMission())
EndFunc


func isMainScreen()
	$count = 0
	$pix = pixelSearch(0, 0, 1919, 1079, 0x69C911, 2)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(23, 418, 157, 489, 0xFFF3DD, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	_log($count > 1)
	  Return $count > 1

EndFunc

func openMissionScreen()
	_log("openMissionScreen")
	MouseClick("LEFT", 87, 458,1,1)
EndFunc

func isMissionScreen()
	_log("isMissionScreen")
	$count = 0
		$pix = pixelSearch(0, 0, 1919, 1079, 0xFFC410, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(0, 0, 1919, 1079, 0xE378AC, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	_log($count > 1)
	  Return $count > 1
EndFunc

func missionBot()
	_log("missionBot")
	$count = 1
	while $count
		$pix = pixelSearch(0, 0, 1919, 1079, 0xFEAC27, 1)
	  if IsArray($pix) Then
		  _screen()
		  _log("Collect Box Start")
		 MouseClick("LEFT", $pix[0], $pix[1],1,1)
		 Sleep(3000)
		 Send("g")
		 Sleep(3000)
		 _log("Collect Box END")
	  Else
		 $count = 0
	  EndIf
	WEnd
EndFunc



func isFightScreen()
		$pix = pixelSearch(739, 559, 1112, 709, $fight, 1)
		if IsArray($pix) Then
			Return True
		Else
			Return False
		EndIf
EndFunc



func isEventScreen()
		$count = 0
		$pix = pixelSearch(0, 0, 1919, 1079, 0xA081EF, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(0, 0, 1919, 1079, 0x1196EA, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1

EndFunc

func isHasEvent()
	$count = 0
	$pix = pixelSearch(12, 242, 207, 333, 0xFFD21F, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  Return $count == 1
EndFunc

func eventBot()
	_log("eventBot")
	MouseClick("LEFT", 1085, 672, 1, 1)
	Sleep(3000)
	If(isNotEnought()) Then
		_log("isNotEnought")
		MouseClick("LEFT", 810, 253, 1, 1)
		Sleep(3000)
		MouseClick("LEFT", 52, 85, 1, 1)
		Return False
	EndIf
	Sleep(3000)
	MouseClick("LEFT", 985, 669, 1, 1)
	$pix = pixelSearch(1026, 236, 1145, 382	, 0x7797B3, 1) ; finish event
	  if IsArray($pix) Then
		  _log("Finish End")
		  Send("g")
	  EndIf
EndFunc

func openEventScreen()
	MouseClick("LEFT", 100, 301,1,1)
EndFunc

func isHasMission()
	$count = 0
	$pix = pixelSearch(14, 420, 198, 490, 0xFFD21F, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  Return $count == 1
EndFunc




func fightBot()

	$pix = pixelSearch(568, 436, 628, 488, 0xEE72A1, 100)
	  if IsArray($pix) Then
		  _log(1)

	Send("{e}")
	Send("{w down}")
	Sleep(5000)
	Send("{w up}")
	Send("{q}")
	  Else
		  Send("p")
	   _log(0)
	  EndIf
EndFunc


func isNotEnought()
	_log("func isNotEnought")
	  $pix = pixelSearch(329, 184, 923, 604, 0x1171C9, 1)
	  if IsArray($pix) Then
		  _log("func isNotEnought true")
		 Return True
	  Else
		 _log("func isNotEnought False")
	  Return False
	  EndIf

EndFunc

func isSpecColletc()
		$count = 0
		$pix = pixelSearch(532, 386, 671, 488, 0xFF8A00, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(463, 93, 778, 195, 0xFFF000, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1
EndFunc

func specCollectClick()
	MouseClick("LEFT", 619, 629,1,1)
EndFunc


func isTablePlayers()
		$count = 0
		$pix = pixelSearch(0, 0, 1919, 1079, 0x00447E, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(0, 0, 1919, 1079,0x0E94EA, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1
EndFunc

func isCollectWinScreen()
		$count = 0
		$pix = pixelSearch(0, 0, 1919, 1079, 0x0F98EC	, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(0, 0, 1919, 1079,0xEE3113, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1
EndFunc

func rezultClick()
	MouseClick("LEFT", 102, 667,1,1)
EndFunc

func isRezultScreen()
		$count = 0
		$pix = pixelSearch(395, 406, 839, 565, 0x62A3FB	, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(395, 406, 839, 565, 0xFF2246	, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(395, 406, 839, 565, 0xFCD300	, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1
EndFunc

func isSeriaWinScreen()
		$count = 0
		$pix = pixelSearch(357, 261, 898, 382, 0xFFE300	, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(318, 494, 614, 619 ,0xED4722, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1
EndFunc

func seriaWinClick()
	MouseClick("LEFT", 465, 551,1,1)
EndFunc

func TablePlayersClick()
	MouseClick("LEFT", 608, 642,1,1)
EndFunc



func isImproveHeroes()
		$count = 0
		$pix = pixelSearch(243, 138, 1007, 654, 0x1E226A	, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(243, 138, 1007, 654 ,0x610015, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1
EndFunc

func isRatingUp()
		$count = 0
		$pix = pixelSearch(196, 131, 1007, 654, 0x1E226A	, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf
	  $pix = pixelSearch(243, 138, 1007, 654 ,0x610015, 1)
	  if IsArray($pix) Then
		  $count = $count + 1
	  EndIf

	  Return $count > 1
EndFunc





func move()
	Send("{w down}")
	Sleep(5000)
	Send("{w up}")
EndFunc



func killswitch()
   Exit
EndFunc

func _log($text)
	ConsoleWrite ($text  & @CRLF )
EndFunc

func _click($x,$y)
	MouseClick("LEFT", $x, $y, 1, 1)
EndFunc

while 1
   Sleep(50)
WEnd
