//================================================================================
// FionaOgre.
//================================================================================

class FionaOgre extends ShHeroPawn
  Config(User);

var int TotalGameStateTokens;
var int GameStateTokenLen;
var(GameState) const editconst string GameStateMasterList;
var(GameState) travel string CurrentGameState;

defaultproperties
{
     NewTag="Fiona"
     DefaultPlayerControllerClass=Class'SHGame.ShrekController'
     RunAnimName="run"
     WalkAnimName="Walk"
     GroundRunSpeed=300.000000
     GroundWalkSpeed=150.000000
     NeckRotElement=RE_RollNeg
     HeadRotElement=RE_YawNeg
     BaseMovementRate=300.000000
     Mesh=SkeletalMesh'ShrekCharacters.fiona_o'
     CollisionRadius=20.000000
     CollisionHeight=38.000000
}
