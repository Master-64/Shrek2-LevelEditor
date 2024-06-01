//================================================================================
// EmitterSupport.
//================================================================================

class EmitterSupport extends Actor;

var() Emitter SupportingEmitter;

function Emitter SpawnSupportingEmitter(class<Emitter> Effect)
{
}

function Landed(Vector N)
{
}

defaultproperties
{
     Physics=PHYS_Falling
	 bHidden=True
     CollisionRadius=1.000000
     CollisionHeight=1.000000
     bCollideWorld=True
}
