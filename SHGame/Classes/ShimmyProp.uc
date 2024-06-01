//================================================================================
// ShimmyProp.
//================================================================================

class ShimmyProp extends ShProps
  NotPlaceable
  Config(User);

var() name ShimmyIdleAnimation;
var() name ShimmyShimmyAnimation;
var() name ShimmyBounceAnimation;

function GoToIdleState()
{
}

defaultproperties
{
     CollisionRadius=0.000000
     CollisionHeight=0.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
