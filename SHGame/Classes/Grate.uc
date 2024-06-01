//================================================================================
// Grate.
//================================================================================

class Grate extends ShProps
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
     sfxPunchOne(0)=None
     sfxPunchOne(1)=None
     sfxPunchTwo(0)=None
     sfxPunchTwo(1)=None
     OnePunchSkin=Texture'4_FGM_PIB_Tex.vent_2'
     TwoPunchSkin=Texture'4_FGM_PIB_Tex.vent_3'
     bCouldBeAttacked=True
     ControllerClass=Class'SHGame.GrateController'
     StaticMesh=StaticMesh'4_FGM_PIB_SM.vent_1'
     PrePivot=(X=-40.000000,Y=8.000000,Z=40.000000)
     CollisionRadius=41.000000
	 CollisionWidth=8.00
     CollisionHeight=41.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
}
