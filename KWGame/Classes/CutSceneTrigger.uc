//================================================================================
// CutSceneTrigger.
//================================================================================

class CutSceneTrigger extends KWTrigger;

#exec TEXTURE IMPORT NAME=cutscenetriggericon FILE=Texture\cutscenetriggericon.tga FLAGS=2

var() name AlternateEvent;
var() bool bDoAlternateEvent;

function Activate(Actor Other, Pawn Instigator)
{
}

defaultproperties
{
     bTriggerOnceOnly=True
	 Texture=Texture'cutscenetriggericon'
}
