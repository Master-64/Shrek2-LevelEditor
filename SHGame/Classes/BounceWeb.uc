//================================================================================
// BounceWeb.
//================================================================================

class BounceWeb extends SHBounceSheet
  Config(User);

defaultproperties
{
     BouncerEmitter=Class'SHGame.Bounce_C'
     BounceSound=Sound'items.boing_web'
     IdleAnim="Static"
     Mesh=SkeletalMesh'EnvAnims.webbounce'
     CollisionRadius=80.000000
     CollisionHeight=20.000000
	 CollideType=CT_Cylinder
}
