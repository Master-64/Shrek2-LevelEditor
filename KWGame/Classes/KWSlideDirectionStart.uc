//================================================================================
// KWSlideDirectionStart.
//================================================================================

class KWSlideDirectionStart extends KWSlideDirection;

var() bool bTossMeIntoTrack;

function Touch(Actor Other)
{
}

defaultproperties
{
     CollisionRadius=15.000000
	 CollideType=CT_Box
}
