//================================================================================
// FrogGrouping.
//================================================================================

class FrogGrouping extends SHCharacter
  Config(User);

const ABSOLUTE_MAXIMUM_FROGS= 20;
var() int MaxFrogs;
var() bool RandomizeFrogNumbers;
var() float SpawnRadius;

function Vector FindRandomSpot()
{
}

function Rotator FindRandomRotation()
{
}

defaultproperties
{
     MaxFrogs=4
     RandomizeFrogNumbers=True
     SpawnRadius=100.000000
	 Physics=PHYS_None
     bHidden=True
	 DrawType=DT_Mesh
     Mesh=SkeletalMesh'ShrekCharacters.frog'
     DrawScale=7.000000
     bCollideActors=False
     bBlockPlayers=False
}
