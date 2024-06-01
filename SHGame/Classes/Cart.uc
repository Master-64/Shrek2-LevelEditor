//================================================================================
// Cart.
//================================================================================

class Cart extends ShProps
  Config(User);

var Vector handLocation;
var Rotator handRotation;
var(sounds) array<Sound> sfxPickup;
var(sounds) array<Sound> sfxRoll;
var(sounds) array<Sound> sfxPutDown;
var() Material cartSkin;

function bool GiveDamageToBase(Actor Base)
{
}

function LoopIdleAnim()
{
}

function PlayPickupCartAnim()
{
}

function PlayPutdownCartAnim()
{
}

function loopCartWalkAnim()
{
}

defaultproperties
{
     sfxPickup(0)=Sound'Items.pickup_coin03'
     sfxPickup(1)=Sound'Items.pickup_coin03'
     sfxRoll(0)=None
     sfxRoll(1)=None
     sfxPutDown(0)=None
     sfxPutDown(1)=None
     Mesh=SkeletalMesh'EnvAnims.Cart'
     CollisionRadius=35.000000
     CollisionHeight=35.000000
}
