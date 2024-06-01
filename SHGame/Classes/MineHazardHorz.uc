//================================================================================
// MineHazardHorz.
//================================================================================

class MineHazardHorz extends Hazard
  Placeable
  Config(User);

defaultproperties
{
     AttachmentClass=Class'SHGame.HazardAttachment'
     attachBone="rotater"
     AttachRotation=(Roll=16384)
     IdleAnimName="Static"
     SwingAnimName="On"
     bInstantDeath=False
     DamageAmount=10
     Mesh=SkeletalMesh'EnvAnims.minehaz_hz'
     CollisionRadius=1.000000
     CollisionHeight=155.000000
}
