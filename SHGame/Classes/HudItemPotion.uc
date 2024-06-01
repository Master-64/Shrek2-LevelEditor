//================================================================================
// HudItemPotion.
//================================================================================

class HudItemPotion extends SHHudItem;

var string PotionTextures[19];
var int posX;
var int posY;
var Texture PotionTX[19];

function int GetItemXPos(optional Canvas Canvas)
{
}

function int GetItemYPos(optional Canvas Canvas)
{
}

function int GetCount()
{
}

function UpdatePotionTexture()
{
}

function DrawHudItem(Canvas Canvas)
{
}

function bool CanUseThePotions()
{
}

function Font GetSHFontSize(Canvas Canvas)
{
}

defaultproperties
{
     PotionTextures(0)="SH_Hud.potions.potion1_Hud"
     PotionTextures(1)="SH_Hud.potions.potion2_Hud"
     PotionTextures(2)="SH_Hud.potions.potion3_Hud"
     PotionTextures(3)="SH_Hud.potions.potion4_Hud"
     PotionTextures(4)="SH_Hud.potions.potion5_Hud"
     PotionTextures(5)="SH_Hud.potions.potion6_Hud"
     PotionTextures(6)="SH_Hud.potions.potion7_Hud"
     PotionTextures(7)="SH_Hud.potions.potion8_Hud"
     PotionTextures(8)="SH_Hud.potions.potion9_Hud"
     PotionTextures(9)="SH_Hud.Timer.Timer"
     PotionTextures(10)="SH_Hud.potions.potion1_gray"
     PotionTextures(11)="SH_Hud.potions.potion2_gray"
     PotionTextures(12)="SH_Hud.potions.potion3_gray"
     PotionTextures(13)="SH_Hud.potions.potion4_gray"
     PotionTextures(14)="SH_Hud.potions.potion5_gray"
     PotionTextures(15)="SH_Hud.potions.potion6_gray"
     PotionTextures(16)="SH_Hud.potions.potion7_gray"
     PotionTextures(17)="SH_Hud.potions.potion8_gray"
     PotionTextures(18)="SH_Hud.potions.potion9_gray"
     posX=517
     posY=19
     bDisplayCount=True
     nCountMiddleX=182
     nCountMiddleY=95
     StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinShape'
     DrawScale=0.130000
     bAlwaysTick=True
}
