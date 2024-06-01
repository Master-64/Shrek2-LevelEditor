//================================================================================
// OpenTerrainAmbientCreatures.
//================================================================================

class OpenTerrainAmbientCreatures extends AmbientCreatureManager;

defaultproperties
{
    TransientCreatures[0]=Class'MigratingBirds'
    TransientCreatures[1]=Class'WanderingBirds'
    TransientCreatures[2]=Class'FlyingBugs'
    TransientCreatures[3]=Class'CirclingBirds'
    TransientCreatures[4]=Class'FlyingBugs'
    SpawnRadius=18000
    TriggerRadius=20000
}