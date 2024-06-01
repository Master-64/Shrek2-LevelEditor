//================================================================================
// BounceFungus.
//================================================================================

class BounceFungus extends SHBounceSheet
  Config(User);

defaultproperties
{
     BouncerEmitter=Class'SHGame.Bounce_B'
     BounceSound=Sound'items.boing_fungus'
     IdleAnim="Static"
     Mesh=SkeletalMesh'EnvAnims.fungus'
     CollisionRadius=80.000000
     CollisionHeight=15.000000
}
