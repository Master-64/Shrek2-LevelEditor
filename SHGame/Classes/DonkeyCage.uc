//================================================================================
// DonkeyCage.
//================================================================================

class DonkeyCage extends ShProps
  Config(User);

var() Vector AttachOffset;
var() Rotator AttachRotation;
var Controller SavedController;
var Donkey dnk;
var DonkeyFake fakednk;

function AttachDonkey()
{
}

function DetachDonkey()
{
}

defaultproperties
{
     AttachOffset=(Y=-30.000000)
     AttachRotation=(Pitch=-16384,Roll=-16384)
     bCanBeBaseForPawns=True
     Mesh=SkeletalMesh'EnvAnims.DonkeyCage'
     CollisionRadius=1.000000
     CollisionHeight=1.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
