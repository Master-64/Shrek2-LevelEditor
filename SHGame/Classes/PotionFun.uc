//================================================================================
// PotionFun.
//================================================================================

class PotionFun extends ShProps
  NotPlaceable
  Config(User);

var Class<Emitter> fxImpactClass;
var Emitter fxImpact;
var() Sound sfxImpact;

defaultproperties
{
     sfxImpact=Sound'items.pickup_coin03'
     CollisionRadius=20.000000
     CollisionHeight=20.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
