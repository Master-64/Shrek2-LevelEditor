//================================================================================
// Bug.
//================================================================================

class Bug extends TransientAmbientPawn
  Config(User);

function float MoveTimeTo(Vector Destination)
{
}

defaultproperties
{
    bFlyer=true
    AirSpeed=200
    AccelRate=900
    Physics=PHYS_Flying
    RotationRate=(Pitch=4096,Yaw=70000,Roll=0)
}