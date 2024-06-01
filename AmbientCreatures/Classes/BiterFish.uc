//================================================================================
// BiterFish.
//================================================================================

class BiterFish extends TransientAmbientPawn
  Config(User);

var() float AirTime;

function float GetSleepTime()
{
}

function Landed(Vector HitNormal)
{
}

function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
}

defaultproperties
{
    bCanSwim=true
    WaterSpeed=180
    AccelRate=1700
    UnderWaterTime=-1
    Physics=PHYS_Swimming
    Mesh=VertMesh'AmbientFish'
    Mass=5
    Buoyancy=5
    RotationRate=(Pitch=8192,Yaw=128000,Roll=16384)
}