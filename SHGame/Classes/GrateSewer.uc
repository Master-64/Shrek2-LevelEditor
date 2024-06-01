//================================================================================
// GrateSewer.
//================================================================================

class GrateSewer extends ShProps
  Config(User);

var Vector handLocation;
var Rotator handRotation;
var(sounds) array<Sound> sfxPunchOne;
var(sounds) array<Sound> sfxPunchTwo;
var() Material OnePunchSkin;
var() Material TwoPunchSkin;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

defaultproperties
{
     sfxPunchOne(0)=Sound'PussInBoots.grate_slash_01'
     sfxPunchOne(1)=Sound'PussInBoots.grate_slash_02'
     sfxPunchTwo(0)=Sound'PussInBoots.grate_slash_03'
	 OnePunchSkin=Texture'7_Prison_Donkey_Tex.grate_sewer2'
     TwoPunchSkin=Texture'7_Prison_Donkey_Tex.grate_sewer3'
     bCouldBeAttacked=True
     ControllerClass=Class'SHGame.GrateSewerController'
     StaticMesh=StaticMesh'7_Prison_Donkey_SM.grate_sewer'
     CollisionRadius=36.000000
	 CollisionWidth=5.00
     CollisionHeight=33.000000
	 CollideType=CT_Box
     bUseCylinderCollision=False
	 DrawType=DT_StaticMesh
}
