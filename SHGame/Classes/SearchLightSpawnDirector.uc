//================================================================================
// SearchLightSpawnDirector.
//================================================================================

class SearchLightSpawnDirector extends EnemySpawnDirector;

var SearchLightSpawnPoint SpawnPoint;
var SearchLight Light;
var int currentlyActive;

function EnemyKilled()
{
}

function enemySpawned()
{
}

defaultproperties
{
	DrawType=DT_Sprite
}
