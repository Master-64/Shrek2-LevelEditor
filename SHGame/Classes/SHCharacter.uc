//================================================================================
// SHCharacter.
//================================================================================

class SHCharacter extends shpawn
  Config(User);

var(KWPawn) array<name> FidgetAnimName;
var(Skeletal) name HandBone;

function name GetWeaponBoneFor(Inventory i)
{
}

defaultproperties
{
     HandBone="body_rhand"
     WalkAnims(1)="runbackward"
     WalkAnims(2)="StrafeLeft"
     WalkAnims(3)="StrafeRight"
     AirAnims(0)="Jump"
     AirAnims(1)="Jump"
     AirAnims(2)="Jump"
     AirAnims(3)="Jump"
     TakeoffAnims(0)="runjump"
     TakeoffAnims(1)="runjump"
     TakeoffAnims(2)="runjump"
     TakeoffAnims(3)="Jump"
     LandAnims(0)="JumpLandToStand"
     LandAnims(1)="jumplandtorun"
     DoubleJumpAnims(0)="doublejump"
     DoubleJumpAnims(1)="doublejump"
     DoubleJumpAnims(2)="doublejump"
     DoubleJumpAnims(3)="doublejump"
     AirStillAnim="jumploop"
     TakeoffStillAnim="Jump"
     GroundRunSpeed=550.000000
     GroundWalkSpeed=200.000000
     GroundCarrySpeed=450.000000
     fLandingTweenInTime=0.010000
     fLandingTweenOutTime=0.300000
     fLandingAnimRate=1.200000
     fJumpTweenTime=0.070000
     fJumpAnimRate=0.800000
     fAirStillAnimTweenTime=0.150000
     fDoubleJumpAnimRate=0.800000
     fDoubleJumpTweenTime=0.070000
     RootBone="body_root_joint"
     HeadBone="body_head_joint"
     NeckBone="body_neck_joint"
     LandedFX=Class'SHGame.Grnd_Impact'
     WetLandedFX=Class'SHGame.splash'
     GroundSpeed=550.000000
     AirSpeed=1000.000000
     AccelRate=1548.000000
     JumpZ=520.000000
     AirControl=0.250000
     ControllerClass=Class'SHGame.Sh_NPCController'
     bPhysicsAnimUpdate=True
     BaseMovementRate=450.000000
     MovementAnims(1)="runbackward"
     MovementAnims(2)="StrafeLeft"
     MovementAnims(3)="StrafeRight"
     TurnLeftAnim="Idle"
     TurnRightAnim="Idle"
     MovementBlendStartTime=0.200000
     ForwardStrafeBias=0.500000
     BackwardStrafeBias=0.500000
     CollisionRadius=24.000000
     CollisionHeight=42.000000
     RotationRate=(Yaw=40000)
}
