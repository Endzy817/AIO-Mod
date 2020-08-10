; #FUNCTION# ====================================================================================================================
; Name ..........: Functions_Team__AiO__MOD++
; Description ...: This file Includes several files in the current script.
; Syntax ........: #include
; Parameters ....: None
; Return values .: None
; Author ........: Team AiO MOD++ (2019)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

; <><><><><><><><><><><><><><><> Team AiO MOD++ (2020) <><><><><><><><><><><><><><><>
; Low level func order.
#include "functions\AU3\FixedArray.au3"

; DOCR
#include "functions\Read Text\DOCRBundles.au3"
#include "functions\Read Text\getOcrDissociable.au3"

; DMatching
#include "functions\Pixels\DMatchingBundles.au3"
#include "functions\Pixels\DMatching.au3"

; Other
#include "functions\Mod's\ModFuncs.au3"
#include "functions\Pixels\_Wait4Pixel.au3"
#include "functions\Pixels\ImgFuncs.au3"

; CheckModVersion - Team AiO MOD++
#include "functions\Mod's\CheckModVersion.au3"

; Check Stop For War - Team AiO MOD++
#include "functions\Mod's\CheckStopForWar.au3"

; MagicItems - Team AiO MOD++
#include "functions\Mod's\MagicItems.au3"

; SuperXP / GoblinXP - Team AiO MOD++
#include "functions\Mod's\SuperXP\ArrayFunctions.au3"
#include "functions\Mod's\SuperXP\multiSearch.au3"
#include "functions\Mod's\SuperXP\SuperXP.au3"

; Humanization - Team AiO MOD++
#include "functions\Mod's\Humanization\BotHumanization.au3"
#include "functions\Mod's\Humanization\AttackNDefenseActions.au3"
#include "functions\Mod's\Humanization\BestClansNPlayersActions.au3"
#include "functions\Mod's\Humanization\ChatActions.au3"
#include "functions\Mod's\Humanization\ClanActions.au3"
#include "functions\Mod's\Humanization\ClanWarActions.au3"

; ChatActions - Team AiO MOD++
#include "functions\Mod's\ChatActions\MultyLang.au3"
#include "functions\Mod's\ChatActions\IAChat.au3"
#include "functions\Mod's\ChatActions\ChatActions.au3"

; Auto Dock, Hide Emulator & Bot - Team AiO MOD++
#include "functions\Mod's\AutoHideDockMinimize.au3"

; Check Collector Outside - Team AiO MOD++
#include "functions\Mod's\CheckCollectorsOutside\AreCollectorsOutside.au3"
#include "functions\Mod's\CheckCollectorsOutside\AreCollectorsNearRedline.au3"
#include "functions\Mod's\CheckCollectorsOutside\isOutsideEllipse.au3"
#include "functions\Mod's\CheckCollectorsOutside\CustomDetect.au3"

; Switch Profiles - Team AiO MOD++
#include "functions\Mod's\ProfilesOptions\SwitchProfiles.au3"

; Farm Schedule - Team AiO MOD++
#include "functions\Mod's\ProfilesOptions\FarmSchedule.au3"

; GTFO
#include "functions\Mod's\GTFO\GTFO.au3"
#include "functions\Mod's\GTFO\KickOut.au3"

; Moved to the end to avoid any global declare issues - Team AiO MOD++
#include "functions\Config\saveConfig.au3"
#include "functions\Config\readConfig.au3"
#include "functions\Config\applyConfig.au3"

; Custom Builder Base
#include "functions\Mod's\BuilderBase\ExtraFuncs.au3"
#include "functions\Mod's\BuilderBase\BuilderBaseMain.au3"
#include "functions\Mod's\BuilderBase\BuilderBaseDebugUI.au3"
#include "functions\Mod's\BuilderBase\Attack\BuilderBaseImageDetection.au3"
#include "functions\Mod's\BuilderBase\Attack\BuilderBaseCSV.au3"
#include "functions\Mod's\BuilderBase\Attack\BuilderBaseAttack.au3"
#include "functions\Mod's\BuilderBase\Village\BuilderBaseZoomOut.au3"
;~ #include "functions\Mod's\BuilderBase\Attack\BuilderBaseAttackBar.au3"
;~ #include "functions\Mod's\BuilderBase\Attack\BuilderBaseSmartAttack.au3"
;~ #include "functions\Mod's\BuilderBase\Camps\BuilderBaseCheckArmy.au3"

#include "functions\Mod's\BuilderBase\Village\UpgradeWalls.au3"
#include "functions\Mod's\BuilderBase\Village\BattleMachineUpgrade.au3"

#include "functions\Mod's\BuilderBase\Camps\BuilderBaseCorrectAttackBar.au3"
#include "functions\Mod's\BuilderBase\Camps\BuilderBaseCheckArmy.au3"

;~ #include "functions\Mod's\BuilderBase\Village\Collect.au3"
;~ #include "functions\Mod's\BuilderBase\Village\StartClockTowerBoost.au3"
;~ #include "functions\Mod's\BuilderBase\Village\BuilderBaseReport.au3"
;~ #include "functions\Mod's\BuilderBase\Village\SuggestedUpgrades.au3"
;~ #include "functions\Mod's\BuilderBase\Village\CleanBBYard.au3"
;~ #include "functions\Mod's\BuilderBase\Village\StarLaboratory.au3"

;
;#include "functions\Mod's\GetCastle.au3"
;---------------------------------------------------------------;

#include "functions\Mod's\Attack\GetButtons.au3"
#include "functions\Mod's\Attack\VerifyDropPoints.au3"