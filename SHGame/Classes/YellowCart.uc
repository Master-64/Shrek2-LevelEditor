//================================================================================
// YellowCart.
//================================================================================

class YellowCart extends PickableCart
  Placeable
  Config(User);

defaultproperties
{
     DestroyCartEmitter=Class'SHGame.Dust_Cloud'
     StaticMesh=StaticMesh'10_Castle_Siege_SM.YellowCart'
     CollisionRadius=165.000000
	 CollisionWidth=80.00
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
}
