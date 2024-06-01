//================================================================================
// SwampAmbientCreatures.
//================================================================================

class SwampAmbientCreatures extends AmbientCreatureManager;

var() int BugEscort;
var EscortBugs Escort;

function RemoveCreature(TransientAmbientCreature Remove)
{
}

defaultproperties
{
    BugEscort=6
    TransientCreatures[0]=Class'FlyingBugs'
    TransientCreatures[1]=Class'WanderingBirds'
    TransientCreatures[2]=Class'FlyingBugs'
    SpawnRadius=10000
    TriggerRadius=12000
}