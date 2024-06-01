//================================================================================
// JumpingMushroomForwardTarget.
//================================================================================

class JumpingMushroomForwardTarget extends BounceTarget
  Config(User);

var() name backTargetTag;
var array<MushroomBouncePad> Pads;
var array<JumpingMushroom> shrooms;
var BounceTarget oldTarget;
var bool bTouched;

function Touch(Actor Other)
{
}

function Bump(Actor Other)
{
}

defaultproperties
{
	DrawType=DT_Sprite
}
