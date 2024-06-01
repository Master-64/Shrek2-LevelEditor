//================================================================================
// BridgeDonkey.
//================================================================================

class BridgeDonkey extends ShPropsStatic
  Config(User);

var() float OpenAnimRate;

defaultproperties
{
     OpenAnimRate=1.000000
     bCanBeBaseForPawns=True
     Mesh=SkeletalMesh'EnvAnims.bridge_donkey'
     bMovable=False
     CollisionRadius=1.000000
     CollisionHeight=1.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
