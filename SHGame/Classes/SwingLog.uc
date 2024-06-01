//================================================================================
// SwingLog.
//================================================================================

class SwingLog extends SwingObject
  Config(User);

defaultproperties
{
     AttachmentClass1=Class'SHGame.SwingLogAttachment'
     AttachBone1="r_knot_joint"
     AttachOffset1=(Y=95.000000)
     AttachRotation1=(Pitch=16384,Roll=-16384)
     AttachmentClass2=Class'SHGame.SwingLogAttachment'
     AttachBone2="l_knot_joint"
     AttachOffset2=(Y=-95.000000)
     AttachRotation2=(Pitch=-16384,Roll=16384)
     IdleAnimName="Static"
     SwingAnimName="swing"
     bInstantDeath=False
     DamageAmount=1
     FrameToSendEvent=10
     MiddleOfSwingSound=Sound'The_Hunt.log_swing'
     Mesh=SkeletalMesh'EnvAnims.swingrope'
     CollisionRadius=420.000000
}
