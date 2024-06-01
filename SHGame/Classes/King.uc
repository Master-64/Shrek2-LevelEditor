//================================================================================
// King.
//================================================================================

class King extends ShHeroPawn
  Config(User);

defaultproperties
{
     DefaultPlayerControllerClass=Class'SHGame.ShrekController'
     RunAnimName="run"
     WalkAnimName="Walk"
     GroundRunSpeed=300.000000
     GroundWalkSpeed=150.000000
     LeftUpperLidBone="body_l_toplid_joint"
     LeftLowerLidBone="body_l_bottomlid_joint"
     RightUpperLidBone="body_r_toplid_joint"
     RightLowerLidBone="body_r_bottomlid_joint"
     NeckRotElement=RE_RollNeg
     HeadRotElement=RE_YawNeg
	 IdleAnims(0)="Idle"
	 IdleAnims(1)="Idle"
	 IdleAnims(2)="Idle"
	 IdleAnims(3)="Idle"
	 IdleAnims(4)="Idle"
	 IdleAnims(5)="Idle"
	 IdleAnims(6)="Idle"
	 IdleAnims(7)="Idle"
     BaseMovementRate=300.000000
     Mesh=SkeletalMesh'ShrekCharacters.King'
     CollisionRadius=15.000000
     CollisionHeight=38.000000
}
