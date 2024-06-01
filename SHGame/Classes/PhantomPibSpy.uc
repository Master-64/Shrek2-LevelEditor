//================================================================================
// PhantomPibSpy.
//================================================================================

class PhantomPibSpy extends Phantom
  Placeable
  Config(User);

defaultproperties
{
     InActiveTexture=Texture'PIB_2DAnims.blank_tx'
     ActiveTexture=Texture'PIB_2DAnims.huntspy_A01'
     StaticMesh=StaticMesh'3_The_Hunt_SM.huntplane'
     CollisionRadius=30.000000
	 CollisionWidth=1.00
     CollisionHeight=30.000000
	 CollideType=CT_Box
	 DrawType=DT_StaticMesh
}
