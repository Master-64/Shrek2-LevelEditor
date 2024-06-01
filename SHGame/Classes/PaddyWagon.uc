//================================================================================
// PaddyWagon.
//================================================================================

class PaddyWagon extends PickableCart
  Placeable
  Config(User);

defaultproperties
{
     DestroyCartEmitter=Class'SHGame.Dust_Cloud'
     HoldingLocOffset=(Z=100.000000)
     StaticMesh=StaticMesh'10_Castle_Siege_SM.paddy_wagon'
     CollisionRadius=180.000000
	 CollisionWidth=100.00
     CollisionHeight=116.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
}
