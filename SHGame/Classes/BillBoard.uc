//================================================================================
// BillBoard.
//================================================================================

class BillBoard extends ShPropsStatic
  Config(User);

var() Sound SqueekSound;

defaultproperties
{
     SqueekSound=Sound'Enviroment.sign_squeek'
     Mesh=SkeletalMesh'EnvAnims.Hero_Billboard'
     CollisionRadius=225.000000
	 CollisionWidth=20.00
     CollisionHeight=225.000000
	 CollideType=CT_Box
}
