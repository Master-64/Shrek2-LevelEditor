//================================================================================
// MineHazardVert.
//================================================================================

class MineHazardVert extends Hazard
  Placeable
  Config(User);

defaultproperties
{
     AttachmentClass=Class'SHGame.HazardAttachment'
     attachBone="Rotator"
     AttachRotation=(Pitch=16384)
     IdleAnimName="Static"
     SwingAnimName="On"
     bInstantDeath=False
     DamageAmount=10
     Mesh=SkeletalMesh'EnvAnims.minehaz_vt'
     CollisionRadius=1.000000
     CollisionHeight=275.000000
}
