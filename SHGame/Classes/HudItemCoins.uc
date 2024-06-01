//================================================================================
// HudItemCoins.
//================================================================================

class HudItemCoins extends SHHudItem;

function int GetItemXPos(optional Canvas Canvas)
{
}

function int GetItemYPos(optional Canvas Canvas)
{
}

function int GetCount()
{
}

function Font GetSHFontSize(Canvas Canvas)
{
}

defaultproperties
{
     bDisplayCount=True
     nCountMiddleX=105
     nCountMiddleY=40
     StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinShape'
     DrawScale=0.130000
     bAlwaysTick=True
}
