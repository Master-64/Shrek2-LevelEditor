//================================================================================
// MongoPickup.
//================================================================================

class MongoPickup extends ShProps
  NotPlaceable
  Config(User);

var() float DamageRadius;
var() int DamageAmount;
var() Class<DamageType> MyDamageType;

function DestroyPawn()
{
}

defaultproperties
{
     DamageRadius=200.000000
     DamageAmount=1
}
