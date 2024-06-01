//================================================================================
// ThornLog.
//================================================================================

class ThornLog extends SwingObject
  Config(User);

defaultproperties
{
     AttachmentClass1=Class'SHGame.ThornLogAttachment'
     AttachBone1="log_joint"
     AttachOffset1=(Y=100.000000)
     AttachRotation1=(Pitch=16384,Roll=-16384)
     IdleAnimName="Static"
     SwingAnimName="swing"
     FrameToSendEvent=10
     MiddleOfSwingSound=Sound'The_Hunt.log_swing_small'
     Mesh=SkeletalMesh'EnvAnims.thornrope'
     CollisionRadius=350.000000
}
