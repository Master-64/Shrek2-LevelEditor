//================================================================================
// SiegeFountain.
//================================================================================

class SiegeFountain extends ShProps
  Config(User);

var(sounds) Sound sfxWater;
var(sounds) Sound sfxPickup;
var(sounds) Sound sfxPutDown;
var() Class<Emitter> fxPlumeClass;
var() Vector fxPlumeOffset;
var() Class<Emitter> fxBaseClass;
var() Vector fxBaseOffset;
var() name PickupEvent;
var Emitter particle1;
var Emitter particle2;
var Emitter WaterSpout;
var() Class<Emitter> fxWaterSpoutClass;
var() Vector fxWaterSpoutOffset;
var Vector StartLocation;

function SpawnParticles()
{
}

function SpawnPickup()
{
}

function Trigger(Actor Other, Pawn EventInstigator)
{
}

defaultproperties
{
     fxPlumeClass=Class'SHGame.WaterSpout'
     fxPlumeOffset=(Z=180.000000)
     fxBaseClass=Class'SHGame.WaterSpout'
     fxBaseOffset=(Z=120.000000)
     fxWaterSpoutClass=Class'SHGame.WaterSpout'
     fxWaterSpoutOffset=(Z=80.000000)
     bCanBePickedUp=True
     ControllerClass=Class'SHGame.SiegeFountainController'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.fountain_main'
     AmbientSound=Sound'The_Seige.fountain_loop'
     CollisionRadius=23.000000
     CollisionHeight=33.000000
	 DrawType=DT_StaticMesh
}
