//================================================================================
// ShrekAmbientCreatures.
//================================================================================

class ShrekAmbientCreatures extends AmbientCreatureManager;

var() int BugEscort;
var() Class<EscortBugs> EscortClass;
var EscortBugs Escort;

function RemoveCreature(TransientAmbientCreature Remove)
{
}

defaultproperties
{
    BugEscort=6
    EscortClass=Class'EscortButterflies'
    SpawnRadius=10000
    TriggerRadius=12000
}