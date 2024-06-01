// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPCrate extends MPhysicsPawn
	Config(MPak);


defaultproperties
{
	BounceSounds(0)=Sound'Elves.HazMat_bodyfall01'
	BounceSounds(1)=Sound'Elves.HazMat_bodyfall02'
	BounceSounds(2)=Sound'Elves.HazMat_bodyfall03'
	BounceSounds(3)=Sound'Elves.HazMat_bodyfall04'
	DestroyEmitterClass=class'Crate_Burst'
	DestroySounds(0)=Sound'Items.crate_break'
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Crate_BurstShape'
	CollideType=CT_Box
	CollisionWidth=40.0
}