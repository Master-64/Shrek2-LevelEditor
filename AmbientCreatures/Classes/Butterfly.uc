//================================================================================
// Butterfly.
//================================================================================

class Butterfly extends Bug
  Config(User);

var() array<Material> RandSkins;

defaultproperties
{
    RandSkins(0)=Shader'AmbCreaturesTX.butterfly1_S'
    RandSkins(1)=Shader'AmbCreaturesTX.butterfly2_S'
    RandSkins(2)=Shader'AmbCreaturesTX.butterfly3_S'
    RandSkins(3)=Shader'AmbCreaturesTX.butterfly4_S'
    AirSpeed=50
    AccelRate=200
    LandMovementState=PlayerFlying
    AmbientSound=Sound'Items.Butterfly'
    Mesh=SkeletalMesh'AmbCreatureAnims.Butterfly'
    SoundRadius=8
    SoundVolume=64
}