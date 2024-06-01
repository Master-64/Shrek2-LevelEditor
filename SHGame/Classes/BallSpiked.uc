//================================================================================
// BallSpiked.
//================================================================================

class BallSpiked extends SwingObject
  Config(User);

defaultproperties
{
     AttachmentClass1=Class'SHGame.BallSpikedAttachment'
     AttachBone1="joint2"
     AttachOffset1=(X=100.000000)
     AttachRotation1=(Pitch=16384)
     IdleAnimName="Static"
     SwingAnimName="swing"
     FrameToSendEvent=30
     Mesh=SkeletalMesh'EnvAnims.chain_for_ball_spiked'
     CollisionRadius=2000.000000
}
