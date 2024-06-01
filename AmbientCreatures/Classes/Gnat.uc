//================================================================================
// Gnat.
//================================================================================

class Gnat extends Bug
  Config(User);

defaultproperties
{
    AirSpeed=150
    AccelRate=500
    LandMovementState=PlayerFlying
    AmbientSound=Sound'Items.Gnats'
    Mesh=SkeletalMesh'AmbCreatureAnims.Gnat'
    DrawScale=2
    SoundRadius=12
    SoundVolume=64
}