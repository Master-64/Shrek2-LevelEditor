//================================================================================
// House.
//================================================================================

class House extends ShPropsStatic
  NotPlaceable
  Config(User);

var() Class<Emitter> classEmitter;
var() Sound HouseBlowSound;

defaultproperties
{
     CollisionRadius=1.000000
     CollisionHeight=1.000000
}
