//================================================================================
// BriarPatch.
//================================================================================

class BriarPatch extends ShPropsStatic
  Config(User);

var() float DamageRadius;
var() int DamageAmount;
var() Class<Emitter> fxPoisonCloudClass;
var Emitter fxPoisonCloud;
var(sounds) array<Sound> sfxPoisonCloud;
var name bumpHitHero;

function Bump(Actor Other)
{
}

function GetBumpSets()
{
}

defaultproperties
{
     DamageRadius=150.000000
     DamageAmount=5
     fxPoisonCloudClass=Class'SHGame.Briar_Break'
     sfxPoisonCloud(0)=Sound'Items.Briar_damage01'
     sfxPoisonCloud(1)=Sound'Items.Briar_damage02'
     sfxPoisonCloud(2)=Sound'Items.Briar_damage03'
     sfxPoisonCloud(3)=Sound'Items.Briar_damage04'
     sfxPoisonCloud(4)=Sound'Items.Briar_damage05'
     ControllerClass=Class'SHGame.BriarPatchController'
     StaticMesh=StaticMesh'1_Shreks_Swamp_SM.briar_patch'
     bShouldBaseAtStartup=False
     CollisionRadius=35.000000
	 CollisionWidth=95.00
     CollisionHeight=50.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
	 bAlignBottom=False
}
