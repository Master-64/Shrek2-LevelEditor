//================================================================================
// SHSavePoint.
//================================================================================

class SHSavePoint extends SavePoint;

var Vector vLoc;
var() float fWaitTime;
var() string SavePointName;
var() Class<Emitter> fxWandClass;
var() Vector fxWandOffset;
var SavePointFairy tinkerbell;

function Touch(Actor Other)
{
}

function OnSaveGame()
{
}

defaultproperties
{
     fWaitTime=10.000000
     SavePointName="menuitems_104"
     bActive=True
     Mesh=SkeletalMesh'ShrekCharacters.fairy'
}
