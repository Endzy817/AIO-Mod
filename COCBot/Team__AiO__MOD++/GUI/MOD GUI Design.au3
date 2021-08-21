; #FUNCTION# ====================================================================================================================
; Name ..........: MOD GUI Design
; Description ...: This file creates the "MOD" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: NguyenAnhHD
; Modified ......: Team AiO MOD++ (2020)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hGUI_MOD = 0
Global $g_hGUI_MOD_TAB = 0, $g_hGUI_MOD_TAB_ITEM1 = 0, $g_hGUI_MOD_TAB_ITEM2 = 0, $g_hGUI_MOD_TAB_ITEM3 = 0, $g_hGUI_MOD_TAB_ITEM4 = 0, $g_hGUI_MOD_TAB_ITEM5 = 0, $g_hGUI_MOD_TAB_ITEM6 = 0, $g_hGUI_MOD_TAB_ITEM7 = 0

#include "MOD GUI Design - SuperXP.au3"
#include "MOD GUI Design - Humanization.au3"
#include "MOD GUI Design - ChatActions.au3"
#include "MOD GUI Design - GTFO.au3"
#include "MOD GUI Design - AiO-Debug.au3"
#include "MOD GUI Design - WarPreparation.au3"

Func CreateMODTab()

	$g_hGUI_MOD = _GUICreate("", $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, $_GUI_CHILD_LEFT, $_GUI_CHILD_TOP, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hFrmBotEx)

	GUISwitch($g_hGUI_MOD)
	$g_hGUI_MOD_TAB = GUICtrlCreateTab(0, 0, $g_iSizeWGrpTab1, $g_iSizeHGrpTab1, $TCS_RIGHTJUSTIFY)

		$g_hGUI_MOD_TAB_ITEM1 = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_00", "Super XP"))
			TabSuperXPGUI()
		$g_hGUI_MOD_TAB_ITEM2 = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_02", "Humanization"))
			TabHumanizationGUI()
		$g_hGUI_MOD_TAB_ITEM3 = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_03", "Chat"))
			TabChatActionsGUI()
		$g_hGUI_MOD_TAB_ITEM4 = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_04", "GTFO"))
			TabGTFOGUI()
		$g_hGUI_MOD_TAB_ITEM5 = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_05", "Prewar"))
			TabWarPreparationGUI()
		$g_hGUI_MOD_TAB_ITEM6 = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_06", "Misc"))
			TabMiscGUI()

	If $g_bDevMode Then
		$g_hGUI_MOD_TAB_ITEM7 = GUICtrlCreateTabItem(GetTranslatedFileIni("MBR Main GUI", "Tab_06_STab_07", "Debug"))
			TabDebugGUI()
		EndIf

	GUICtrlCreateTabItem("")
EndFunc   ;==>CreateMODTab

; Tab Misc GUI - Team AiO MOD++
 Func TabMiscGUI()
	SplashStep("Loading M0d - Misc...")

	;Local $x = 10, $y = 45

	GUICtrlCreateLabel(GetTranslatedFileIni("MiscMODs", "AttackLabel",  "Attack"), 7, 192, 436, 22, BitOR($SS_CENTER,$SS_CENTERIMAGE))
	GUICtrlSetTip(-1, GetTranslatedFileIni("MiscMODs", "AttackTip",  "Attacks extra functions."))
	GUICtrlSetBkColor(-1, 0x333300)
	GUICtrlSetFont(-1, 12, 500, 0, "Candara", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, 0xFFCC00)

  	$g_hAvoidLocate = GUICtrlCreateCheckbox(GetTranslatedFileIni("MiscMODs", "AvoidLocate.",  "Skip first check."), 32, 224, 161, 17)
  	GUICtrlSetOnEvent(-1, "chkDelayMod")
  	_GUICtrlSetTip(-1, GetTranslatedFileIni("MiscMODs", "AvoidLocateTip", "Skip first check without attack first."))

	GUICtrlCreateLabel(GetTranslatedFileIni("MiscMODs", "OtherSettingsLabel", "Other"), 7, 280, 436, 22, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetTip(-1, GetTranslatedFileIni("MiscMODs", "OtherSettingsTip", "Other settings"))
	GUICtrlSetBkColor(-1, 0x333300)
	GUICtrlSetFont(-1, 12, 500, 0, "Candara", $CLEARTYPE_QUALITY)
	GUICtrlSetColor(-1, 0xFFCC00)

	$g_hAvoidLocation = GUICtrlCreateCheckbox(GetTranslatedFileIni("MiscMODs", "AvoidLocation", "Skip buildings location."), 32, 312, 145, 17)
	GUICtrlSetOnEvent(-1, "chkDelayMod")

	Local $iX = 32, $iY = 312
	$iY += 25
	$g_hChkBotLogLineLimit = GUICtrlCreateCheckbox(GetTranslatedFileIni("MiscMODs", "BotLogLineLimit", "Disable clear bot log, and line limit to: "), $iX, $iY, -1, -1)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MiscMODs", "BotLogLineLimitTips", "Bot log will never clear after battle, and clear bot log will replace will line limit."))
	GUICtrlSetOnEvent(-1, "chkBotLogLineLimit")
	
	$g_hTxtLogLineLimit = _GUICtrlCreateInput("240", $iX + 300, $iY + 2, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MiscMODs", "BotLogLineLimitValue", "Please enter how many line to limit for the bot log."))
	GUICtrlSetLimit(-1, 4)
	GUICtrlSetOnEvent(-1, "txtLogLineLimit")

	GUICtrlCreateTabItem("")
EndFunc   ;==>TabMiscGUI

Global $g_hChkCollectMagicItems, _ ;$g_hChkCollectFree, _
$g_hBtnMagicItemsConfig, _
$g_hChkBuilderPotion, $g_hChkClockTowerPotion, $g_hChkHeroPotion, $g_hChkLabPotion, $g_hChkPowerPotion, $g_hChkResourcePotion, _
$g_hComboClockTowerPotion, $g_hComboHeroPotion, $g_hComboPowerPotion, _
$g_hInputBuilderPotion, $g_hInputLabPotion, $g_hInputGoldItems, $g_hInputElixirItems, $g_hInputDarkElixirItems

Func CreateMiscMagicSubTab()

	; GUI SubTab
	Local $x = 15, $y = 45

	GUICtrlCreateGroup("Collect Items", 16, 24, 408, 78)
	$g_hChkCollectMagicItems = GUICtrlCreateCheckbox("Collect magic items", 56, 48, 105, 17)
	GUICtrlSetOnEvent(-1, "btnDDApply")
	$g_hChkFreeMagicItems = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkFreeMagicItems", "Collect Free Magic Items"), 56, 73, 200, 17)
	GUICtrlSetOnEvent(-1, "ChkFreeMagicItems")
	$g_hBtnMagicItemsConfig = GUICtrlCreateButton("Settings", 176, 48, 97, 25)
	GUICtrlSetOnEvent(-1, "btnDailyDiscounts")

	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlCreateGroup("Magic Items", 16, 104, 408, 257)
	$g_hChkBuilderPotion = GUICtrlCreateCheckbox("Use builder potion when busy builders is > = : ", 56, 128, 225, 17)
	GUICtrlSetOnEvent(-1, "MagicItemsRefresh")
	$g_hChkClockTowerPotion = GUICtrlCreateCheckbox("Use clock tower potion when :", 56, 160, 217, 17)
	GUICtrlSetState (-1, $GUI_DISABLE)
	$g_hChkHeroPotion = GUICtrlCreateCheckbox("Use hero potion whem are avariable : ", 56, 192, 217, 17)
	GUICtrlSetState (-1, $GUI_DISABLE)
	$g_hChkLabPotion = GUICtrlCreateCheckbox("Use research potion when laboratory hours is >= ", 56, 224, 233, 17)
	$g_hChkPowerPotion = GUICtrlCreateCheckbox("Use power potion during : ", 56, 256, 225, 17)
	GUICtrlSetState (-1, $GUI_DISABLE)
	$g_hChkResourcePotion = GUICtrlCreateCheckbox("Use resource potion only if storage are :", 56, 288, 225, 17)
	GUICtrlSetOnEvent(-1, "MagicItemsRefresh")
	$g_hInputBuilderPotion = _GUICtrlCreateInput("Number", 296, 128, 41, 21)
	GUICtrlSetOnEvent(-1, "MagicItemsRefresh")
	$g_hComboClockTowerPotion = GUICtrlCreateCombo("Select", 296, 160, 89, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	GUICtrlSetState (-1, $GUI_DISABLE)
	$g_hComboHeroPotion = GUICtrlCreateCombo("Select", 296, 192, 89, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	GUICtrlSetState (-1, $GUI_HIDE)
	$g_hInputLabPotion = _GUICtrlCreateInput("Hours", 296, 224, 41, 21)
	$g_hComboPowerPotion = GUICtrlCreateCombo("Select", 296, 256, 89, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
	GUICtrlSetState (-1, $GUI_DISABLE)
	$g_hInputGoldItems = _GUICtrlCreateInput("1000000", 88, 320, 73, 21)
	GUICtrlSetOnEvent(-1, "MagicItemsRefresh")
	$g_hInputElixirItems = _GUICtrlCreateInput("1000000", 192, 320, 73, 21)
	GUICtrlSetOnEvent(-1, "MagicItemsRefresh")
	$g_hInputDarkElixirItems = _GUICtrlCreateInput("1000", 296, 320, 49, 21)
	GUICtrlSetOnEvent(-1, "MagicItemsRefresh")
	GUICtrlCreateLabel("Lower : ", 40, 320, 42, 17)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnShop, 24, 46, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnModBuilderP, 24, 126, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnModClockTowerP, 24, 158, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnModHeroP, 24, 190, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnLabP, 24, 222, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnModPowerP, 24, 254, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnModResourceP, 24, 284, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnGoldP, 163, 318, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnElixirP, 265, 318, 25, 25)
	_GUICtrlCreateIcon($g_sLibModIconPath, $eIcnDarkP, 345, 318, 25, 25)

EndFunc   ;==>CreateMiscMagicSubTab