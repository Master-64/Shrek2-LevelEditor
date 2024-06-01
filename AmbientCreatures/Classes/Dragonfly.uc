//================================================================================
// Dragonfly.
//================================================================================

class Dragonfly extends Bug
  Config(User);

var() array<Material> RandSkins;

defaultproperties
{
    RandSkins(0)=Shader'AmbCreaturesTX.dragonfly_S'
    RandSkins(1)=Shader'AmbCreaturesTX.dragonfly2_S'
    RandSkins(2)=Shader'AmbCreaturesTX.dragonfly3_S'
    AirSpeed=150
    AccelRate=500
    LandMovementState=PlayerFlying
    AmbientSound=Sound'Items.Dragonfly'
    Mesh=SkeletalMesh'AmbCreatureAnims.Dragonfly'
    SoundRadius=12
    SoundVolume=64
}