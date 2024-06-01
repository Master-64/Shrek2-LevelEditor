//================================================================================
// SHSmartStart.
//================================================================================

class SHSmartStart extends SmartStart;

var(PlayerStart) string SavePointName;
var(PlayerStart) array<string> PreviousLevelNames;

function OnSaveGame()
{
}

defaultproperties
{
     bDoLevelSave=True
     bStatic=False
     bNoDelete=False
}
