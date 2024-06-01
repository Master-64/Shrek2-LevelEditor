//================================================================================
// AmbientLeaf.
//================================================================================

class AmbientLeaf extends AmbientPlant
  Placeable;

defaultproperties
{
     MaterialType=MTYPE_Leaf
     Mesh=SkeletalMesh'EnvAnims.AmbientLeaf'
     DrawScale=1.500000
     CollisionRadius=170.000000
	 CollisionWidth=100.000000
     CollisionHeight=15.000000
	 CollideType=CT_Box
}
