//================================================================================
// FlyingBug.
//================================================================================

class FlyingBug extends Bug
  Config(User);

defaultproperties
{
    LandMovementState=PlayerFlying
    AmbientSound=Sound'Flies.flybuzz'
    Mesh=SkeletalMesh'WaspMesh'
    SoundRadius=2
    SoundVolume=64
}