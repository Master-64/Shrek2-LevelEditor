// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MLifeDrainVolume extends MVolume
	Config(MPak);


var() float fDamageRate, fHurtAmount;
var() bool bHealInstead, bTakeKnockback, bDamageInCutscene;
var Actor Player;


event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
	}
}

event Touch(Actor Other)
{
	if(KWHeroController(Pawn(Other).Controller) == PC)
	{
		Player = Other;
		
		SetTimer(fDamageRate, true);
	}
}

event Untouch(Actor Other)
{
	if(KWHeroController(Pawn(Other).Controller) == PC)
	{
		Player = none;
		
		SetTimer(0.0, false);
	}
}

event Timer()
{
	if(Player == none || (PC.bInCutscene() && !bDamageInCutscene))
	{
		return;
	}
	
	if(!bHealInstead)
	{
		U.AddHealth(Pawn(Player), -fHurtAmount, !bTakeKnockback);
	}
	else
	{
		U.AddHealth(Pawn(Player), fHurtAmount, !bTakeKnockback);
	}
}


defaultproperties
{
	fDamageRate=0.1
	fHurtAmount=2.0
}