//================================================================================
// TelePit.
//================================================================================

class TelePit extends KWTrigger;

#exec TEXTURE IMPORT NAME=TelePit FILE=Texture\TelePit.tga FLAGS=2

var() string TelePitDest;
var() bool bUseTagForDest;
var() float TelePitFadeOut;
var() float TelePitFadeIn;
var() bool bIsActive;
var() bool bMoveInstantly;
var bool bFading;
var FadeViewDelegate FadeController;
var() bool bActivateJustSetsAsActiveTelepit;
var() float DamageToDoToHero;

function bool IsRelevant(Actor Other)
{
}

function bool IsTelepittingPlayer()
{
}

function Activate(Actor Other, Pawn Instigator)
{
}

function DoAction(Actor Other, Pawn Instigator)
{
}

defaultproperties
{
     TelePitFadeOut=1.000000
     TelePitFadeIn=0.500000
     bIsActive=True
     DamageToDoToHero=5.000000
     Texture=Texture'TelePit'
}
