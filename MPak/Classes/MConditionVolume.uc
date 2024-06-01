// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MConditionVolume extends MVolume
	Config(MPak);


var() bool bTouching, bOnlyTriggerIfHasTag;
var() name nTriggerOnlyTag;


event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		PC = U.GetPC();
	}
}

event Touch(Actor Other)
{
	if((KWHeroController(Pawn(Other).Controller) == PC && !bOnlyTriggerIfHasTag) || bOnlyTriggerIfHasTag && Other.Tag == nTriggerOnlyTag)
	{
		bTouching = true;
	}
}

event Untouch(Actor Other)
{
	if((KWHeroController(Pawn(Other).Controller) == PC && !bOnlyTriggerIfHasTag) || bOnlyTriggerIfHasTag && Other.Tag == nTriggerOnlyTag)
	{
		bTouching = false;
	}
}