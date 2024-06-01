// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MFionaOgre extends MHeroPawn
	Config(MPak);


var int TotalGameStateTokens, GameStateTokenLen;
var(GameState) const editconst string GameStateMasterList;
var(GameState) travel string CurrentGameState;


event PostBeginPlay()
{
	local MeshAnimation MeshAnim;
	
	super.PostBeginPlay();
	
	MeshAnim = MeshAnimation(DynamicLoadObject(string(Mesh), class'MeshAnimation'));
	LinkSkelAnim(MeshAnim);
	AddFootStepsNotify(MeshAnim);
}


defaultproperties
{
	NewTag=Fiona
	RunAnimName=run
	WalkAnimName=Walk
	GroundRunSpeed=300.0
	GroundWalkSpeed=150.0
	NeckRotElement=RE_RollNeg
	HeadRotElement=RE_YawNeg
	BaseMovementRate=300.0
	_BaseMovementRate=300.0
	Mesh=SkeletalMesh'ShrekCharacters.fiona_o'
	CollisionRadius=20.0
	CollisionHeight=38.0
}