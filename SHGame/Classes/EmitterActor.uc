//================================================================================
// EmitterActor.
//================================================================================

class EmitterActor extends ShPropsStatic
  Placeable
  Config(User);

var() Class<Emitter> EmitterToSpawn;
var Emitter myEmitter;
var() bool AlwaysActive;
var() float TimeOn;
var() float TimeOff;
var float fTime;

function EnableEmission()
{
}

function DisableEmission()
{
}

defaultproperties
{
     AlwaysActive=True
     TimeOn=10.000000
     TimeOff=5.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'Engine.S_Emitter'
}
