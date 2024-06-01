//================================================================================
// EnemyPickupPile.
//================================================================================

class EnemyPickupPile extends BreakableObject
  Placeable
  Config(User);

enum eDifficulty {
  E_EASY,
  E_MEDIUM,
  E_HARD
};

enum E_PickupType {
  Type_Pumpkin,
  Type_Rock,
  Type_AppleRotten,
  Type_AppleExplode,
  Type_Potion
};

var Emitter fxExplosion;
var() Class<Emitter> fxExplosionClass;
var() float DamageRadius;
var() int DamageAmount;
var(sounds) array<Sound> sfxExplode;
var() E_PickupType type;
var() eDifficulty throwDifficulty;

function DoExtraStuff()
{
}

defaultproperties
{
     fxExplosionClass=Class'SHGame.Pumk_Bang'
     DamageRadius=200.000000
     sfxExplode(0)=Sound'Items.pumpkin_explode1'
     sfxExplode(1)=Sound'Items.pumpkin_explode1'
     HitFXClass=Class'SHGame.Crate_Burst'
     HitSound=Sound'items.crate_break'
     PitchMin=0.800000
     PitchMax=1.200000
     ControllerClass=None
     StaticMesh=StaticMesh'Shrek2_Univ_SM.box_pumkins'
     CollisionRadius=40.000000
     CollisionHeight=15.000000
	 DrawType=DT_StaticMesh
}
