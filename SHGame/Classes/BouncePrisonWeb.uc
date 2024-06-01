//================================================================================
// BouncePrisonWeb.
//================================================================================

class BouncePrisonWeb extends SHBounceSheet
  Config(User);

defaultproperties
{
     BouncerEmitter=Class'SHGame.Bounce_C'
     BounceSound=Sound'items.boing_web'
     IdleAnim="Static"
     Mesh=SkeletalMesh'EnvAnims.prisonwebbounce'
     CollisionRadius=80.000000
     CollisionHeight=2.000000
	 CollideType=CT_Cylinder
}
