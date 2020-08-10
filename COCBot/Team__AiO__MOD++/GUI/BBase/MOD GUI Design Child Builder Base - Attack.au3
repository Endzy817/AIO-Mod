; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "Attack Plan" tab under the "Builder Base" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Chilly-Chill (5/2019) (redo), ProMac (03-2018)
; Modifier ......: Boldina (01/2020)
; Remarks .......: This file is part of MyBot, previously known as Mybot and ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hChkBBStopAt3 = 0, $g_hChkBBTrophiesRange = 0, $g_hTxtBBDropTrophiesMin = 0, $g_hLblBBDropTrophiesDash = 0, $g_hTxtBBDropTrophiesMax = 0, $g_hCmbBBAttackStyle[3] = [0, 0, 0]
Global $g_hCmbBBArmy1 = 0, $g_hCmbBBArmy2 = 0, $g_hCmbBBArmy3 = 0, $g_hCmbBBArmy4 = 0, $g_hCmbBBArmy5 = 0, $g_hCmbBBArmy6 = 0
Global $g_hIcnBBarmy1 = 0, $g_hIcnBBarmy2 = 0, $g_hIcnBBarmy3 = 0, $g_hIcnBBarmy4 = 0, $g_hIcnBBarmy5 = 0, $g_hIcnBBarmy6 = 0
Global $g_hLblNotesScriptBB[3] = [0, 0, 0], $g_hGrpOptionsBB = 0, $g_hGrpAttackStyleBB = 0, $g_hGrpGuideScriptBB[3] = [0, 0, 0], $g_hIcnBBCSV[4] = [0, 0, 0, 0]
Global $g_hGUI_ATTACK_PLAN_BUILDER_BASE = 0, $g_hGUI_ATTACK_PLAN_BUILDER_BASE_CSV = 0
Global $g_hChkBBCustomAttack = 0
Global $g_hChkBBGetFromCSV = 0 ;AIO ++

Func CreateAttackPlanBuilderBaseSubTab()


	$g_hGUI_ATTACK_PLAN_BUILDER_BASE = _GUICreate("", $g_iSizeWGrpTab2, $g_iSizeHGrpTab2, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hGUI_BUILDER_BASE)
	GUISetBkColor($COLOR_WHITE, $g_hGUI_ATTACK_PLAN_BUILDER_BASE)

	Local $x = 0, $y = 0
	GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "Group_01", "Train Army"), $x, $y, $g_iSizeWGrpTab2 - 2, 85)
	$x = +8

	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "lblBBArmyCamp1", "Army Camp 1"), $x + 5, $y + 15)
	$g_hComboTroopBB[0] = GUICtrlCreateCombo("", $x + 5, $y + 30, 62, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sBBTroopsOrderDefault, "0")
	_GUICtrlComboBox_SetCurSel($g_hComboTroopBB[0], 0)
	GUICtrlSetOnEvent(-1, "GUIBBCustomArmy")
	$g_hIcnTroopBB[0] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, $x + 5 + 19, $y + 54, 24, 24)

	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "lblBBArmyCamp2", "Army Camp 2"), $x + 75, $y + 15)
	$g_hComboTroopBB[1] = GUICtrlCreateCombo("", $x + 75, $y + 30, 62, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sBBTroopsOrderDefault, "0")
	_GUICtrlComboBox_SetCurSel($g_hComboTroopBB[1], 0)
	GUICtrlSetOnEvent(-1, "GUIBBCustomArmy")
	$g_hIcnTroopBB[1] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, $x + 75 + 19, $y + 54, 24, 24)

	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "lblBBArmyCamp3", "Army Camp 3"), $x + 145, $y + 15)
	$g_hComboTroopBB[2] = GUICtrlCreateCombo("", $x + 145, $y + 30, 62, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sBBTroopsOrderDefault, "0")
	_GUICtrlComboBox_SetCurSel($g_hComboTroopBB[2], 0)
	GUICtrlSetOnEvent(-1, "GUIBBCustomArmy")
	$g_hIcnTroopBB[2] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, $x + 145 + 19, $y + 54, 24, 24)

	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "lblBBArmyCamp4", "Army Camp 4"), $x + 215, $y + 15)
	$g_hComboTroopBB[3] = GUICtrlCreateCombo("", $x + 215, $y + 30, 62, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sBBTroopsOrderDefault, "0")
	_GUICtrlComboBox_SetCurSel($g_hComboTroopBB[3], 0)
	GUICtrlSetOnEvent(-1, "GUIBBCustomArmy")
	$g_hIcnTroopBB[3] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, $x + 215 + 19, $y + 54, 24, 24)

	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "lblBBArmyCamp5", "Army Camp 5"), $x + 285, $y + 15)
	$g_hComboTroopBB[4] = GUICtrlCreateCombo("", $x + 285, $y + 30, 62, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sBBTroopsOrderDefault, "0")
	_GUICtrlComboBox_SetCurSel($g_hComboTroopBB[4], 0)
	GUICtrlSetOnEvent(-1, "GUIBBCustomArmy")
	$g_hIcnTroopBB[4] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, $x + 285 + 19, $y + 54, 24, 24)

	GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "lblBBArmyCamp6", "Army Camp 6"), $x + 355, $y + 15)
	$g_hComboTroopBB[5] = GUICtrlCreateCombo("", $x + 355, $y + 30, 62, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, $g_sBBTroopsOrderDefault, "0")
	_GUICtrlComboBox_SetCurSel($g_hComboTroopBB[5], 0)
	GUICtrlSetOnEvent(-1, "GUIBBCustomArmy")
	$g_hIcnTroopBB[5] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, $x + 355 + 19, $y + 54, 24, 24)
	GUICtrlCreateGroup("", -99, -99, 1, 1)


	$x = 0
	$y = 90
	$g_hGrpOptionsBB = GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "Group_02", "Options"), $x, $y, $g_iSizeWGrpTab2 - 2, $g_iSizeHGrpTab4 - 90)
	$g_hCmbBBAttack = GUICtrlCreateCombo( GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "CmbAttackStyle", ""), $x + 5, $y + 15, 80, -1, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, "CSV|Smart Attack")
	GUICtrlSetOnEvent(-1, "cmbBBAttack")
	_GUICtrlComboBox_SetCurSel($g_hCmbBBAttack, $g_eBBAttackCSV)         ; set default to csv

	$g_hChkBBStopAt3 = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "ChkBBStopAt3", "Stop at 3 wins"), $x + 5, $y + 15, -1, -1)

	$g_hChkBBTrophiesRange = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "ChkBBDropTrophies", "Trophies Range") & ": ", $x + 100, $y + 15, -1, -1)
	GUICtrlSetOnEvent(-1, "chkBBtrophiesRange")
	$g_hTxtBBDropTrophiesMin = _GUICtrlCreateInput("1250", $x + 203, $y + 15, 40, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$g_hLblBBDropTrophiesDash = GUICtrlCreateLabel("-", $x + 245, $y + 15 + 2)
	$g_hTxtBBDropTrophiesMax = _GUICtrlCreateInput("2500", $x + 250, $y + 15, 40, -1, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))

	$g_hChkBBCustomAttack = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "ChkBBCustomAttack ", "Attack according to the opponent."), $x + 300, $y + 15, -1, -1)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "ChkBBCustomAttack_Info_01", "Select 3 attacks and the bot will select the best to use according with opponent!") & @CRLF & _
			GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "ChkBBCustomAttack_Info_02", "Don't worry about the army, the bot will select correct army at attack bar!"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "ChkBBCustomAttack")

	$g_hChkBBGetFromCSV = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "ChkBBGetFromCSV", "Force get troops from CSV in standard attack"), $x + 5, $y + 100, 180, 30, $BS_MULTILINE)
	GUICtrlSetOnEvent(-1, "ChkBBGetFromCSV")

	$g_hChkBBWaitForMachine = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBWaitForMachine", "Wait For Battle Machine"), $x + 5, $y + 120, 180, -1)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "ChkBBWaitForMachine_Info_01", "Makes the bot not attack while Machine is down."))
	;GUICtrlSetState(-1, $GUI_DISABLE)

	$g_hLblBBNextTroopDelay = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "LblBBNextTroopDelay", "Next Troop Delay"), $x + 40, $y + 37 + 130)
	$g_hCmbBBNextTroopDelay = GUICtrlCreateCombo("", $x + 70, $y + 54 + 130, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "CmbBBNextTroopDelay_Info_01", "Set the delay between different troops. 1 fastest to 9 slowest."))
	GUICtrlSetOnEvent(-1, "cmbBBNextTroopDelay")
	GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9")
	GUICtrlSetState(-1, $GUI_DISABLE)
	_GUICtrlComboBox_SetCurSel($g_hCmbBBNextTroopDelay, 4)     ; start in middle
	$g_hLblBBSameTroopDelay = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "LblBBSameTroopDelay", "Same Troop Delay"), $x + 40, $y + 93 + 120)
	$g_hCmbBBSameTroopDelay = GUICtrlCreateCombo("", $x + 70, $y + 110 + 120, 30, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "CmbBBSameTroopDelay_Info_01", "Set the delay between same troops. 1 fastest to 9 slowest."))
	GUICtrlSetOnEvent(-1, "cmbBBSameTroopDelay")
	GUICtrlSetData(-1, "1|2|3|4|5|6|7|8|9")
	GUICtrlSetState(-1, $GUI_DISABLE)
	_GUICtrlComboBox_SetCurSel($g_hCmbBBSameTroopDelay, 4)     ; start in middle

	$g_hBtnBBDropOrder = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrder", "Drop Order"), $x + 60, $y + 265, -1, -1)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrder_Info", "Set a custom dropping order for your troops."))
	GUICtrlSetBkColor(-1, $COLOR_RED)
	GUICtrlSetOnEvent(-1, "btnBBDropOrder")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_hGUI_ATTACK_PLAN_BUILDER_BASE_CSV = _GUICreate("", $g_iSizeWGrpTab2 - 2, $g_iSizeHGrpTab4, 0, 140, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hGUI_ATTACK_PLAN_BUILDER_BASE)

	$y = 5
	$x = 5
	$g_hGrpAttackStyleBB = GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "Group_03", "Attack Style"), $x, $y, $g_iSizeWGrpTab2 - 12, $g_iSizeHGrpTab4 - 90)
	$y += 15
	$g_hGrpGuideScriptBB[0] = GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "GrpGuideScriptBB_Info_01", "CSV For Standard Base"), $x + 5, $y, 134, $g_iSizeHGrpTab4 - 133)
	GUICtrlSetFont(-1, 7)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$g_hGrpGuideScriptBB[1] = GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "GrpGuideScriptBB_Info_02", "CSV For Weak Ground Base"), $x + 130 + 10, $y, 134, $g_iSizeHGrpTab4 - 133)
	GUICtrlSetFont(-1, 7)
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$g_hGrpGuideScriptBB[2] = GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "GrpGuideScriptBB_Info_03", "CSV For Weak Air Base"), $x + 130 + 130 + 15, $y, 134, $g_iSizeHGrpTab4 - 133)
	GUICtrlSetFont(-1, 7)
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$y += 15
	$x = 7
	$g_hCmbBBAttackStyle[0] = GUICtrlCreateCombo("", $x + 5, $y, 130, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL, $WS_VSCROLL))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "CmbScriptName", "Choose the script; You can edit/add new scripts located in folder: 'CSV/BuilderBase'"))
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	GUICtrlSetOnEvent(-1, "chkBBStyle")

	$g_hCmbBBAttackStyle[1] = GUICtrlCreateCombo("", $x + 130 + 10, $y, 130, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL, $WS_VSCROLL))
	GUICtrlSetOnEvent(-1, "chkBBStyle")
	GUICtrlSetState(-1, $GUI_HIDE)
	$g_hCmbBBAttackStyle[2] = GUICtrlCreateCombo("", $x + 130 + 130 + 15, $y, 130, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL, $WS_VSCROLL))
	GUICtrlSetOnEvent(-1, "chkBBStyle")
	GUICtrlSetState(-1, $GUI_HIDE)

	$g_hIcnBBCSV[0] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnReload, $x + 409, $y + 2, 16, 16)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "IconReload_Info_01", "Reload Script Files"))
	GUICtrlSetOnEvent(-1, 'UpdateComboScriptNameBB')         ; Run this function when the secondary GUI [X] is clicked

	$y += 20
	$g_hLblNotesScriptBB[0] = GUICtrlCreateLabel("", $x + 5, $y + 5, 130, 155)
	$g_hLblNotesScriptBB[1] = GUICtrlCreateLabel("", $x + 130 + 10, $y + 5, 130, 155)
	GUICtrlSetState(-1, $GUI_HIDE)
	$g_hLblNotesScriptBB[2] = GUICtrlCreateLabel("", $x + 130 + 130 + 15, $y + 5, 130, 155)
	GUICtrlSetState(-1, $GUI_HIDE)

	$g_hIcnBBCSV[1] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnEdit, $x + 409, $y + 2, 16, 16)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "IconShow-Edit_Info_01", "Show/Edit current Attack Script"))
	GUICtrlSetOnEvent(-1, "EditScriptBB")

	$y += 20
	$g_hIcnBBCSV[2] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnAddcvs, $x + 409, $y + 2, 16, 16)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "IconCreate_Info_01", "Create a new Attack Script"))
	GUICtrlSetOnEvent(-1, "NewScriptBB")

	$y += 20
	$g_hIcnBBCSV[3] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnCopy, $x + 409, $y + 2, 16, 16)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Builder Base - Attack", "IconCopy_Info_01", "Copy current Attack Script to a new name"))
	GUICtrlSetOnEvent(-1, "DuplicateScriptBB")

	GUICtrlCreateGroup("", -99, -99, 1, 1)

	;------------------------------------------------------------------------------------------
	;----- populate list of script and assign the default value if no exist profile -----------
	PopulateComboScriptsFilesBB()
	For $i = 0 To 2
		Local $tempindex = _GUICtrlComboBox_FindStringExact($g_hCmbBBAttackStyle[$i], $g_sAttackScrScriptNameBB[$i])
		If $tempindex = -1 Then $tempindex = 0
		_GUICtrlComboBox_SetCurSel($g_hCmbBBAttackStyle[$i], $tempindex)
	Next
	CreateBBDropOrderGUI()
EndFunc   ;==>CreateAttackPlanBuilderBaseSubTab

; Builder base drop order gui
Func CreateBBDropOrderGUI()
	$g_hGUI_BBDropOrder = GUICreate("Custom Order", 428, 350, 240, 124)

	Local $x = 0, $y = 8
	GUICtrlCreateGroup("BB Custom dropping order.", 8, $y, 409, 278)
	$y += 16
	$g_hChkBBCustomDropOrderEnable = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BBChkCustomDropOrderEnable", "Enable Custom Dropping Order"), 16, $y, 162, 17)
	GUICtrlSetState(-1, $GUI_UNCHECKED)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BBChkCustomDropOrderEnable_Info_01", "Enable to select a custom troops dropping order"))
	GUICtrlSetOnEvent(-1, "chkBBDropOrder")

	$y += 24

	$g_sIcnBBOrder[0] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 48, $y, 32, 32)
	GUICtrlCreateLabel("1:", 24, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[0] = GUICtrlCreateCombo("", 40, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 0 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[1] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 128, $y, 32, 32)
	GUICtrlCreateLabel("2:", 104, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[1] = GUICtrlCreateCombo("", 120, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 1 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[2] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 208, $y, 32, 32)
	GUICtrlCreateLabel("3:", 184, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[2] = GUICtrlCreateCombo("", 200, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 2 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[3] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 288, $y, 32, 32)
	GUICtrlCreateLabel("4:", 264, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[3] = GUICtrlCreateCombo("", 280, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 3 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[4] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 368, $y, 32, 32)
	GUICtrlCreateLabel("5:", 344, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[4] = GUICtrlCreateCombo("", 360, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 4 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)

	$y += 68

	$g_sIcnBBOrder[5] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 48, $y, 32, 32)
	GUICtrlCreateLabel("6:", 24, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[5] = GUICtrlCreateCombo("", 40, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 5 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[6] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 128, $y, 32, 32)
	GUICtrlCreateLabel("7:", 104, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[6] = GUICtrlCreateCombo("", 120, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 6 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[7] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 208, $y, 32, 32)
	GUICtrlCreateLabel("8:", 184, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[7] = GUICtrlCreateCombo("", 200, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 7 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[8] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 288, $y, 32, 32)
	GUICtrlCreateLabel("9:", 264, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[8] = GUICtrlCreateCombo("", 280, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 8 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[9] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 368, $y, 32, 32)
	GUICtrlCreateLabel("10:", 336, $y + 36, 19, 17)
	$g_ahCmbBBDropOrder[9] = GUICtrlCreateCombo("", 360, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 9 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)

	$y += 68

	$g_sIcnBBOrder[10] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 208, $y, 32, 32)
	GUICtrlCreateLabel("11:", 184, $y + 36, 13, 17)
	$g_ahCmbBBDropOrder[10] = GUICtrlCreateCombo("", 200, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 10 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)
	$g_sIcnBBOrder[11] = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBlank, 368, $y, 32, 32)
	GUICtrlCreateLabel("12:", 336, $y + 36, 19, 17)
	$g_ahCmbBBDropOrder[11] = GUICtrlCreateCombo("", 360, $y + 36, 49, 25, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "GUIBBDropOrder")
	GUICtrlSetData(-1, $g_sBBDropOrderDefault)
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "TxtBBDropOrder", "Enter sequence order for drop of troop #" & 11 + 1))
	GUICtrlSetState(-1, $GUI_DISABLE)

	$y += 72

	; Create push button to set training order once completed
	$g_hBtnBBDropOrderSet = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrderSet", "Apply New Order"), 72, $y, 129, 25)
	GUICtrlSetState(-1, BitOR($GUI_UNCHECKED, $GUI_DISABLE))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrderSet_Info_01", "Push button when finished selecting custom troops dropping order") & @CRLF & _
			GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrderSet_Info_02", "When not all troop slots are filled, will use default order."))
	GUICtrlSetOnEvent(-1, "BtnBBDropOrderSet")
	$g_hBtnBBRemoveDropOrder = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBRemoveDropOrder", "Empty Drop List"), 224, $y, 129, 25)
	GUICtrlSetState(-1, BitOR($GUI_UNCHECKED, $GUI_DISABLE))
	_GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBRemoveDropOrder_Info_01", "Push button to remove all troops from list and start over"))
	GUICtrlSetOnEvent(-1, "BtnBBRemoveDropOrder")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$y += 50

	$g_hBtnBBClose = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Child Village - Misc", "BtnBBDropOrderClose", "Close"), 344, $y, 65, 25)
	GUICtrlSetOnEvent(-1, "CloseCustomBBDropOrder")
EndFunc   ;==>CreateBBDropOrderGUI
