//================================================================================
// PigBelow.
//================================================================================

class PigBelow extends LandingObject
  Placeable
  Config(User);

var() Class<Emitter> classEmitter;
var() Emitter AirEmitter;
var() Sound BelowSound;
var() Sound BelowAirSound;
var() bool bSendEventOnce;
var bool bEventWasSend;

defaultproperties
{
     classEmitter=Class'SHGame.Bellow_Blow'
     BelowSound=Sound'Hamlet.bellows'
     BelowAirSound=Sound'Hamlet.bellows_air'
     bCanBeBaseForPawns=True
     Mesh=SkeletalMesh'EnvAnims.pig_belows'
     CollisionRadius=55.000000
	 CollisionWidth=140.00
     CollisionHeight=15.000000
	 CollideType=CT_Box
	 bAlignBottom=False
}
