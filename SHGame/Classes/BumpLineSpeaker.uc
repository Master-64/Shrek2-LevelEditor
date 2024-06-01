//================================================================================
// BumpLineSpeaker.
//================================================================================

class BumpLineSpeaker extends KWPawn
  Placeable
  Config(User);

#exec TEXTURE IMPORT NAME=BumpLineSpeaker FILE=Texture\BumpLineSpeaker.tga FLAGS=2

var float fCurrentTime;
var() bool bIsActive;
var() array<name> BumpLines;
var bool bInCutScene;
var() float TimeDelay;

function PreCutPossess()
{
}

function PreCutUnPossess()
{
}

function Touch(Actor Other)
{
}

function UnTouch(Actor Other)
{
}

defaultproperties
{
     Physics=PHYS_None
	 DrawType=DT_Sprite
     bHidden=True
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 Texture=Texture'BumpLineSpeaker'
}
