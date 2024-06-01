//*******************************************************************************
//* DriveThroughMenu generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class DriveThroughMenu extends SHGUIPage
    instanced;

const AcceptBtnTop = 0.805;
const AcceptBtnLeft = 0.265;
const AcceptBtnWidth = 0.15875;
const AcceptBtnHeight = 0.105;
const AcceptBtnHGap = 0.31375;
const HelpBtnTop = 0.80666667;
const HelpBtnLeft = 0.46;
const HelpBtnWidth = 0.07875;
const HelpBtnHeight = 0.1083333;
const CoinCountLeft = 0.4;
const CoinCountTop = 0.12666667;
const CoinCountWidth = 0.2;
const CoinCountHeight = 0.06;
const BuyLeft = 0.2325;
const BuyTop = 0.36166667;
const BuyWidth = 0.08;
const BuyHeight = 0.07666667;
const BuyH_Gap = 0.30125;
const BuyV_Gap = 0.12166667;
const BuyH_Gap2 = 0.01875;
const PotionCountLeft = 0.325;
const PotionCountTop = 0.2595833;
const PotionCountWidth = 0.05;
const PotionCountHeight = 0.05;
const PotionCountH_Gap = 0.0375;
const CostLeft = 0.1641667;
const CostTop = 0.3725;
const CostWidth = 0.06;
const CostHeight = 0.06;
const CostH_Gap = 0.3005;
const CostH2_Gap = 0.02;
const CostV_Gap = 0.12333333;
const PotionNameLeft = 0.1;
const PotionNameTop = 0.291667;
const PotionNameWidth = 0.15;
const PotionNameHeight = 0.06;
const PotionNameH_Gap = 0.3;
const PotionNameV_Gap = 0.06;
const RollOverLeft = 0.08375;
const RollOverTop = 0.34333333;
const RollOverWidth = 0.23375;
const RollOverHeight = 0.11166667;
const RollOverH_Gap = 0.3;
const RollOverH2_Gap = 0.01875;
const RollOverV_Gap = 0.12333333;
const HintLeft = 0.110;
const HintTop = 0.73333;
const HintWidth = 0.39375;
const HintHeight = 0.048333;
const PotionHintLeft = 0.50375;
const PotionHintWidth = 0.39375;
const JustLeft = 0.17083333;
const JustTop = 0.346667;
const JustWidth = 0.05375;
const JustHeight = 0.026667;
const JustH_Gap = 0.3005;
const JustH2_Gap = 0.02;
const JustV_Gap = 0.12333333;
const CoinTop = 0.42666667;
const CoinLeft = 0.17083333;

var /*0x00000000-0x80000000*/ export editinline GUIButton btnAccept;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnCancel;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnHelp;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy1;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy2;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy3;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy4;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy5;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy6;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy7;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy8;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuy9;
var /*0x00000000-0x80000000*/ export editinline GUIButton btnBuys[9];
var /*0x00000000-0x80000000*/ export editinline GUILabel LblCoinCount;
var /*0x00000000-0x80000000*/ export editinline GUILabel LblInventory;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount1;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount2;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount3;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount4;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount5;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount6;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount7;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount8;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCount9;
var /*0x00000000-0x80000000*/ export editinline GUILabel lblPotionCounts[9];
var /*0x00000000-0x80000000*/ export editinline GUILabel LblHint;
var /*0x00000000-0x80000000*/ export editinline GUILabel LblPotionName;
var Sound sfxAccept;
var Sound sfxCancel;
var Sound sfxHelp;
var Sound sfxBuy;
var Sound sfxCoin;
var int CoinCount;
var int PotionCount[9];
var int PotionsPurchased[9];
var int PotionCost[9];
var string PotionNames[9];
var string PotionHints[9];
var string HelpDialogs;

function InitComponent(GUIController MyController, GUIComponent MyOwner);

function SetInventoryDisplay();

function SetImageLocations();

function bool InternalOnClick(GUIComponent Sender);

function PlayHelpDialog();

function PlayNoCashDialog();

function PlayIntroDialog();

function PlayCheckoutDialog();

function PotionSelected(int whichpotion);

function PlayBuyPotionDialog(int whichpotion);

function PlayBuyLovePotionDialog();

function PlayBuyFreezePotionDialog();

function PlayBuyshrinkPotionDialog();

function PlayBuyFrogPotionDialog();

function PlayBuyStinkPotionDialog();

function PlayBuySleepPotionDialog();

function PlayBuyInvisiblePotionDialog();

function PlayBuyWeeMePotionDialog();

function PlayBuyStrengthPotionDialog();

function AcceptPurchase();

event ChangeHint(string NewHint);

defaultproperties
{
    Begin Object name=cBtnYes class=GUIButton
        StyleName="SHFGM_Accept"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnAccept=cBtnYes
    Begin Object name=cBtnNo class=GUIButton
        StyleName="SHFGM_Cancel"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnCancel=cBtnNo
    Begin Object name=cbtnHelp class=GUIButton
        StyleName="SHFGM_Help"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnHelp=cbtnHelp
    Begin Object name=cbtnBuy1 class=GUIButton
        StyleName="SHFGM_1Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy1=cbtnBuy1
    Begin Object name=cbtnBuy2 class=GUIButton
        StyleName="SHFGM_2Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy2=cbtnBuy2
    Begin Object name=cbtnBuy3 class=GUIButton
        StyleName="SHFGM_3Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy3=cbtnBuy3
    Begin Object name=cbtnBuy4 class=GUIButton
        StyleName="SHFGM_4Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy4=cbtnBuy4
    Begin Object name=cbtnBuy5 class=GUIButton
        StyleName="SHFGM_5Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy5=cbtnBuy5
    Begin Object name=cbtnBuy6 class=GUIButton
        StyleName="SHFGM_6Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy6=cbtnBuy6
    Begin Object name=cbtnBuy7 class=GUIButton
        StyleName="SHFGM_7Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy7=cbtnBuy7
    Begin Object name=cbtnBuy8 class=GUIButton
        StyleName="SHFGM_8Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy8=cbtnBuy8
    Begin Object name=cbtnBuy9 class=GUIButton
        StyleName="SHFGM_9Potion"
        bNeverFocus=true
        OnClick=InternalOnClick
    End Object
    btnBuy9=cbtnBuy9
    Begin Object name=cLblCoinCount class=GUILabel
        TextAlign=1
        StyleName="SHFGM_CoinCount"
    End Object
    LblCoinCount=cLblCoinCount
    Begin Object name=cLblInventory class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghWhite"
    End Object
    LblInventory=cLblInventory
    Begin Object name=clblPotionCount1 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount1=clblPotionCount1
    Begin Object name=clblPotionCount2 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount2=clblPotionCount2
    Begin Object name=clblPotionCount3 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount3=clblPotionCount3
    Begin Object name=clblPotionCount4 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount4=clblPotionCount4
    Begin Object name=clblPotionCount5 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount5=clblPotionCount5
    Begin Object name=clblPotionCount6 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount6=clblPotionCount6
    Begin Object name=clblPotionCount7 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount7=clblPotionCount7
    Begin Object name=clblPotionCount8 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount8=clblPotionCount8
    Begin Object name=clblPotionCount9 class=GUILabel
        TextAlign=1
        StyleName="SH12AuptimaghBlack"
    End Object
    lblPotionCount9=clblPotionCount9
    Begin Object name=cLblHint class=GUILabel
        TextAlign=1
        StyleName="SH14AuptimaghWhite"
    End Object
    LblHint=cLblHint
    Begin Object name=cLblPotionName class=GUILabel
        TextAlign=1
        StyleName="SH14AuptimaghRed"
    End Object
    LblPotionName=cLblPotionName
    sfxAccept=Sound'UI.PotionUI_checkout'
    sfxCancel=Sound'UI.PotionUI_cancel'
    sfxHelp=Sound'UI.PotionUI_help'
    sfxBuy=Sound'UI.PotionUI_get_item'
    sfxCoin=Sound'UI.PotionUI_coin_countdown'
    PotionCost[0]=30
    PotionCost[1]=45
    PotionCost[2]=40
    PotionCost[3]=45
    PotionCost[4]=45
    PotionCost[5]=35
    PotionCost[6]=45
    PotionCost[7]=45
    PotionCost[8]=45
    PotionNames[0]="Strength"
    PotionNames[1]="Froggy"
    PotionNames[2]="Invisibility"
    PotionNames[3]="Sleep"
    PotionNames[4]="Stinky"
    PotionNames[5]="Micro-me"
    PotionNames[6]="Shrink"
    PotionNames[7]="Freeze"
    PotionNames[8]="#9"
    PotionHints[0]="Strength hint"
    PotionHints[1]="Froggy hint"
    PotionHints[2]="Invisibility hint"
    PotionHints[3]="Sleep hint"
    PotionHints[4]="Stinky hint"
    PotionHints[5]="Micro-me hint"
    PotionHints[6]="Shrink hint"
    PotionHints[7]="Freeze hint"
    PotionHints[8]="#9 hint"
    Background=Texture'FGM_Potion_Menu.new_drivethru.FGM_Drvthru_Main3'
    WinHeight=1
}