// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A HUD item that renders a speedrunning timer


class MHUDItem_SpeedrunTimer extends MHUDItem
	Config(MPak);


var() float fOffsetX, fOffsetY, fTimeSeconds;
var() MUtils.EFont fTimerFont;
var() bool bResetTimerOnLoadGame;
var protected float fOldTimeSeconds, fTimeSecondsDelta;


event PostLoadGame(bool bLoadFromSaveGame)
{
	super.PostLoadGame(bLoadFromSaveGame);
	
	if(!bLoadFromSaveGame)
	{
		return;
	}
	
	if(bResetTimerOnLoadGame)
	{
		fTimeSeconds = 0.0;
		fOldTimeSeconds = 0.0;
	}
}

event Tick(float DeltaTime)
{
	fTimeSecondsDelta = Level.TimeSeconds - fOldTimeSeconds;
	fOldTimeSeconds = Level.TimeSeconds;
	
	if(U.GetLevelLoadTime() != 0.0)
	{
		fTimeSeconds = FMax(fTimeSeconds - U.GetLevelLoadTime(), 0.0);
	}
	else
	{
		fTimeSeconds += fTimeSecondsDelta;
	}
}

function DrawHudItem(Canvas C)
{
	local float fTempOffsetX, fTempOffsetY, fTextW, fTextH;
	
	fTempOffsetX = fOffsetX * C.SizeX;
	fTempOffsetY = fOffsetY * C.SizeY;
	
	C.Font = U.GetFontFromEnum(fTimerFont);
	
	C.TextSize("TEXT", fTextW, fTextH);
	
	U.DrawShadowText(C, U.GetStopwatch(fTimeSeconds, true, 3, fTimeSeconds >= 3600.0, fTimeSeconds < 60.0), U.MakeColor(255, 255, 255, 255), U.MakeColor(0, 0, 0, 255), fTempOffsetX, fTempOffsetY - (fTextH / 2.0), 2.0);
}


defaultproperties
{
	fOffsetX=0.01
	fOffsetY=0.5
	fTimerFont=F_BigArielFont
	bAlwaysTick=true
}