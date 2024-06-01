//================================================================================
// ShrekController.
//================================================================================

class ShrekController extends ShHeroController
  Config(User);

var string IngameWantedPosterPopUpImage;
var bool bFadeInWantedPoster;
var bool bRevertRender;
var SlotMachine ActiveMAchine;
var DriveThrough ActiveDriveThrough;
var HudItemHealthBar HudHealthPtr;
var HudItemCoins HudCoinPtr;
var transient SHPickup PosterToDestroy;
var Sound minsfx;
var bool bFirstCoin;

function bool UpdateHealthManagerStatus()
{
}

function bool UpdateHudCoinStatus()
{
}

function bool FlashCoinHud()
{
}

function PickUpOwnedInventoryItem(class<Pickup> item)
{
}

function Vector FindStartVelocity()
{
}

function MenToMice(int Radius)
{
}

function Vector FindPointInFrontOfHero()
{
}

function SpawnPotionPixies(int Num, bool IsSmall)
{
}

function HandlePickup(Pickup Pickup)
{
}

function ShowInGameMenuControls()
{
}

function ShowInGameMenuPosters()
{
}

function ShowInGameMenuYesNo()
{
}

function ShowInGameMenuOptions()
{
}

function ShowReturnToFEYesNo()
{
}

function ShowGenericMenu(string MenuName)
{
}

function ShowGenericMenuNoPause(string MenuName)
{
}

function ClientReplaceMenu(string Menu, optional bool bDisconnect, optional string Msg1, optional string Msg2)
{
}

function ForceLoadPotionSelectMenu()
{
}

function ForceInGameMenu()
{
}

exec function UseCarriedInventoryItem()
{
}

exec function UseStrengthPotion()
{
}

exec function UseSmallMicePotion()
{
}

exec function UseLargeMicePotion()
{
}

exec function UseSmallPixiePotion()
{
}

exec function UseLargePixiePotion()
{
}

exec function RestartFEMenu()
{
}

exec function LoadInGameWantedMenu()
{
}

exec function ToggleHud()
{
}

exec function MortifyPlayer()
{
}

exec function ShowInGameMenu()
{
}

exec function ShowMininized()
{
}

exec function ShowMaximized()
{
}

exec function AddCoins(int H)
{
}

exec function ToggleAutoLeveling()
{
}

exec function ToggleVisibility()
{
}

exec function ToggleStrengthAttributes()
{
}

exec function ShowCreditsMenu()
{
}

exec function LoadPotionSelectMenu()
{
}

defaultproperties
{
     IngameWantedPosterPopUpImage="SH_Menu.WantedPosters.Full_Want_Shrek"
     bFadeInWantedPoster=True
     minsfx=Sound'UI.page_turn'
     bFirstCoin=True
}
