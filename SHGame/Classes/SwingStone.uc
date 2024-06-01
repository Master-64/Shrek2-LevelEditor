//================================================================================
// SwingStone.
//================================================================================

class SwingStone extends SwingObject
  Config(User);

defaultproperties
{
     AttachmentClass1=Class'SHGame.SwingStoneAttachment'
     AttachBone1="joint2"
     AttachOffset1=(X=110.000000)
     AttachRotation1=(Pitch=16384)
     IdleAnimName="Static"
     SwingAnimName="swing"
     FrameToSendEvent=30
     Mesh=SkeletalMesh'EnvAnims.rope_for_stone'
     CollisionRadius=2000.000000
}
