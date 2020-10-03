; #FUNCTION# ====================================================================================================================
; Name ..........: Collect Free Magic Items from trader
; Description ...: Inspired in CollectFreeMagicItems() (ProMac (03-2018))
; Syntax ........: CollectMagicItems()
; Parameters ....:
; Return values .: None
; Author ........: Chilly-Chill, Boldina (boludoz) (7/5/2019), NguyenAnhHD, Dissociable (3/5/2020), Team AIO Mod++ (2020)
; Modified ......: 
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2020
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func CollectMagicItems($bTest = False)
	If Not $g_bRunState Then Return
	
	If Not ($g_iTownHallLevel >= 8 Or $g_iTownHallLevel = 0) Then Return ; Must be Th8 or more to use the Trader
	
	If Not ($g_bChkCollectFreeMagicItems Or $g_bChkCollectMagicItems) Then Return


	Local Static $iLastTimeChecked[8] = [0, 0, 0, 0, 0, 0, 0, 0]
	If $bTest = False And $iLastTimeChecked[$g_iCurAccount] = @MDAY Then Return
	
	CheckMainScreen(False)

	Local $sSetLog = ($g_bChkCollectMagicItems) ? ("Collecting Magic Items") : ("Collecting Free Magic Items")
	SetLog($sSetLog, $COLOR_INFO)
	If _Sleep($DELAYCOLLECT2) Then Return

	; Check Trader Icon on Main Village
	If QuickMIS("BC1", $g_sImgTrader, 120, 155, 230, 250, True, False) Then
		SetLog("Trader available, Entering Daily Discounts", $COLOR_SUCCESS)
		Click($g_iQuickMISX + Random(115, 125, 1), $g_iQuickMISY + Random(150, 170, 1))
	ElseIf QuickMIS("BC1", $g_sImgTraderMod, 72, 113, 280, 220, True, False) Then
		SetLog("Trader available, Entering Daily Discounts", $COLOR_SUCCESS)
		Click($g_iQuickMISX - Random(70, 82, 1) + 72, $g_iQuickMISY + Random(0, 37, 1)  + 113)
	Else
		SetLog("Trader unavailable", $COLOR_INFO)
		Return
	EndIf

	; Check Daily Discounts Window
	If _WaitForCheckImgGone(@ScriptDir & "\COCBot\Team__AiO__MOD++\Images\Obstacles", "FV", "X") Then ; White in 'X'.
		CheckMainScreen(False)
		Return False
	EndIf

	If Not $g_bRunState Then Return
	Local $aOcrPositions[3][2] = [[200, 439], [390, 439], [580, 439]]
	Local $aResults[3] = ["", "", ""]
	Local $aResultsProx[3] = ["", "", ""]

	If Not $bTest Then $iLastTimeChecked[$g_iCurAccount] = @MDAY

	_ImageSearchXML($g_sImgDirDailyDiscounts, 0, "140,230,720,485", True, False, True, 25)
	If $bTest Then _ArrayDisplay($g_aImageSearchXML)

	For $i = 0 To 2
		; Positioned precisely the item, and determines if this is enabled your purchase, if it is not enabled, add N / A, Exits the loop avoiding adding more than one item.
		For $iResult = 0 To UBound($g_aImageSearchXML) - 1
			If ($g_aImageSearchXML[$iResult][1]) > ($aOcrPositions[$i][0] - 41) And ($g_aImageSearchXML[$iResult][1]) < ($aOcrPositions[$i][0] + 135) Then
				$aResultsProx[$i] = ($g_abChkDD_Deals[GetDealIndex($g_aImageSearchXML[$iResult][0])] = True) ? ($g_aImageSearchXML[$iResult][0]) : ("#" & $i+1 & ": " & $g_aImageSearchXML[$iResult][0])
				_ArrayDelete($g_aImageSearchXML, $iResult) ; Optimization
				ExitLoop
			EndIf
		Next
		If $bTest Then _ArrayDisplay($aResultsProx)
		$aResults[$i] = getOcrAndCapture("coc-freemagicitems", $aOcrPositions[$i][0], $aOcrPositions[$i][1], 80, 25, True)

		If $aResults[$i] <> "" Then
			If (BitAND($g_bChkCollectMagicItems, $g_aImageSearchXML <> -1, 1 > StringInStr($aResultsProx[$i], "#" & $i+1), $aResultsProx[$i] <> "")) Or (BitAND($aResults[$i] = "FREE", $g_bChkCollectFreeMagicItems)) Then
				SetLog("Magic Item detected : " & $aResultsProx[$i], $COLOR_INFO)
				If Not $bTest Then
					Click($aOcrPositions[$i][0], $aOcrPositions[$i][1], 1, 0)
				Else
					SetLog("Daily Discounts: " & "X: " & $aOcrPositions[$i][0] & " | " & "Y: " & $aOcrPositions[$i][1], $COLOR_DEBUG)
				EndIf
				If _Sleep(200) Then Return
				If Not $bTest And $g_bChkCollectMagicItems Then
					If ButtonClickDM(@ScriptDir & "\COCBot\Team__AiO__MOD++\Bundles\Button\GemItems", 225, 71, 490, 509) Then
						SetLog("Successfully purchased " & $aResultsProx[$i], $COLOR_SUCCESS)
					EndIf
				EndIf
				If _Sleep(500) Then Return
			Else
				If _ColorCheck(_GetPixelColor(200, 439 + 5, True), Hex(0x5D79C5, 6), 5) Or _ColorCheck(_GetPixelColor(200, 439 + 5, True), Hex(0x0D9A7C, 6), 5) Then
					$aResults[$i] = "(" & $aResults[$i] & " Gems)"
				Else
					$aResults[$i] = Int($aResults[$i]) > 0 ? "(No Space In Castle)" : "(Collected)"
				EndIf
			EndIf
		ElseIf $aResults[$i] = "" Then
			$aResults[$i] = "(No Gems)"
		EndIf

		If Not $g_bRunState Then Return
	Next

	SetLog("Daily Discounts: " & $aResultsProx[0] & " " & $aResults[0] & " | " & $aResultsProx[1] & " " & $aResults[1] & " | " & $aResultsProx[2] & " " & $aResults[2], $COLOR_INFO)
	ClickAway() ;Click Away
	If _Sleep(1000) Then Return
EndFunc   ;==>CollectFreeMagicItems

Func GetDealIndex($sName)
	Switch($sName)
		Case "TrainPotion"
			Return $g_eDDPotionTrain
		Case "ClockPotion"
			Return $g_eDDPotionClock
		Case "ResearchPotion"
			Return $g_eDDPotionResearch
		Case "ResourcePotion"
			Return $g_eDDPotionResource
		Case "BuilderPotion"
			Return $g_eDDPotionBuilder
		Case "PowerPotion"
			Return $g_eDDPotionPower
		Case "HeroPotion"
			Return $g_eDDPotionHero
		Case "WallRing"
			Local $sSearchDiamond = GetDiamondFromRect("140,240,720,485")
			If UBound(decodeSingleCoord(findImage("WallRingAmountx5", $g_sImgDDWallRingx5, $sSearchDiamond, 1, True))) > 1 Then
				Return $g_eDDWallRing5
			ElseIf UBound(decodeSingleCoord(findImage("WallRingAmountx10", $g_sImgDDWallRingx10, $sSearchDiamond, 1, True))) > 1 Then
				Return $g_eDDWallRing10
			EndIf
		Case "Shovel"
			Return $g_eDDShovel
		Case "BookHeros"
			Return $g_eDDBookHeros
		Case "BookFighting"
			Return $g_eDDBookFighting
		Case "BookSpells"
			Return $g_eDDBookSpells
		Case "BookBuilding"
			Return $g_eDDBookBuilding
		Case "RuneGold"
			Return $g_eDDRuneGold
		Case "RuneElixir"
			Return $g_eDDRuneElixir
		Case "RuneDarkElixir"
			Return $g_eDDRuneDarkElixir
		Case "RuneBBGold"
			Return $g_eDDRuneBBGold
		Case "RuneBBElixir"
			Return $g_eDDRuneBBElixir
		Case Else
			Return -1 ; error
	EndSwitch
EndFunc   ;==>GetDealIndex