//================================================================================
// BounceSheet.
//================================================================================

class BounceSheet extends BounceObject
  Config(User);

var() Sound BounceSound;
var() name IdleAnim;
var() name BounceAnim;

defaultproperties
{
     IdleAnim="Idle"
     BounceAnim="Bounce"
     bCanBeBaseForPawns=True
     ControllerClass=Class'KWGame.BounceController'
     CollisionRadius=170.000000
	 CollisionWidth=35.00
     CollisionHeight=50.000000
	 CollideType=CT_Box
}
