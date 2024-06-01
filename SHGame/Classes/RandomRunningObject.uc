//================================================================================
// RandomRunningObject.
//================================================================================

class RandomRunningObject extends ShProps
  Config(User);

var Vector savedNormal;
var() array<Sound> sfxRunning;
var name SpawnAnim;

function Bump(Actor Other)
{
}

function HitWall(Vector HitNormal, Actor Wall)
{
}

defaultproperties
{
     WalkAnims(0)="run"
     WalkAnims(1)="run"
     WalkAnims(2)="run"
     WalkAnims(3)="run"
     GroundRunSpeed=100.000000
     GroundWalkSpeed=100.000000
     bCanJump=False
     GroundSpeed=100.000000
     BaseMovementRate=100.000000
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
	 StepHeight=10.00
	 Physics=PHYS_Walking
}
