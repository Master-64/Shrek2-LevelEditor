//================================================================================
// SiegeFountainPlume.
//================================================================================

class SiegeFountainPlume extends ShProps
  Config(User);

var() Class<Emitter> fxParticle1Class;
var() Vector fxParticle1Offset;
var() Rotator fxParticle1Rotation;
var() Class<Emitter> fxParticle2Class;
var() Vector fxParticle2Offset;
var() Rotator fxParticle2Rotation;
var() name AttachementBone;
var Emitter particle1;
var Emitter particle2;

function SpawnParticles()
{
}

defaultproperties
{
     fxParticle1Class=Class'SHGame.WaterSpout'
     fxParticle1Offset=(Z=-60.000000)
     fxParticle2Class=Class'SHGame.WaterSpout'
     fxParticle2Offset=(Z=-10.000000)
     AttachementBone="root_joint"
     StaticMesh=StaticMesh'10_Castle_Siege_SM.tower_flat_lg'
     AmbientSound=Sound'The_Seige.fountain_loop'
     CollisionRadius=40.000000
     CollisionHeight=100.000000
	 DrawType=DT_StaticMesh
}
