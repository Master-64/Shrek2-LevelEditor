//================================================================================
// PlatformJunk.
//================================================================================

class PlatformJunk extends ShPropsStatic
  Config(User);

var() float TriggerDistance;
var() float SinkSpeed;
var() float RaiseSpeed;
var() float TimeBeforeSink;
var() float TimeBeforeRaise;
var float fTimeBeforeSink;
var float fTimeBeforeRaise;
var Emitter SteamFX;

defaultproperties
{
     TriggerDistance=200.000000
     SinkSpeed=1.000000
     RaiseSpeed=1.000000
     TimeBeforeSink=20.000000
     TimeBeforeRaise=30.000000
     bCanBeBaseForPawns=True
     Mesh=SkeletalMesh'EnvAnims.platform_junk'
     CollisionRadius=60.000000
     CollisionHeight=32.000000
	 bAlignBottom=False
}
