// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MTimer extends MInfo
	Config(MPak);


#exec TEXTURE IMPORT NAME=MTimer FILE=Textures\MTimer.dds FLAGS=2


var() float fTimerEndTime, fTimeElapsed;
var() name TimerEndEvent;
var() bool bUnlimitedTimer;


auto state StartTimer
{
	event Tick(float DeltaTime)
	{
		fTimeElapsed += DeltaTime;
		
		if(!bUnlimitedTimer && fTimeElapsed >= fTimerEndTime)
		{
			TriggerEvent(TimerEndEvent, self, none);
			
			Log("MTimer -- Executing event. Time elapsed:" @ string(fTimeElapsed));
			
			Destroy();
		}
	}
}


defaultproperties
{
	fTimerEndTime=30.0
	Texture=Texture'MTimer'
}