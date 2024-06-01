//================================================================================
// PickupPotion.
//================================================================================

class PickupPotion extends EnemyPickup;

var() array<Material> RandSkins;
var Class<Emitter> impactOneClass;
var Class<Emitter> impactTwoClass;
var Emitter impactOne;
var Emitter impactTwo;
var Class<PotionFun> impactEffectClass;
var PotionFun ImpactEffect;

function PlayRandomImpact()
{
}

function PlayRandomEffect()
{
}

function BlowUp()
{
}

defaultproperties
{
     RandSkins(0)=Texture'4_FGM_PIB_Tex.bottle_1'
     RandSkins(1)=Texture'4_FGM_PIB_Tex.bottle_2'
     RandSkins(2)=Texture'4_FGM_PIB_Tex.bottle_3'
     fxImpactClass=Class'SHGame.Apple_Explo'
     sfxImpact=Sound'items.potion_throw'
     StaticMesh=StaticMesh'4_FGM_PIB_SM.bottle_1'
     bUnlit=True
}
