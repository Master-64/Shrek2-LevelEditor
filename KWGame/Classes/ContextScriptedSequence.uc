//================================================================================
// ContextScriptedSequence.
//================================================================================

class ContextScriptedSequence extends KWScriptedSequence
  HideCategories(Actor,Animation,Animations,Editing,Force,Karma,LightColor,Lighting,Movement,Opacity,Targeting);

var(AIScript) export editinlineuse array<KWScriptedAction> Actions;
var(AIScript) Class<KWScriptController> ControllerClass;
var(AIScript) bool bStartInitialized;
var Pawn LastInstigator;
var Vector OffsetWhenPathing;

function Pawn GetPawnForControl()
{
}

function TakeOver(Pawn P)
{
}

function bool ValidAction(int N)
{
}

function SetActions(KWScriptController C)
{
}

function NotifyTrigger(Actor Other, Pawn EventInstigator)
{
}

defaultproperties
{
     ControllerClass=Class'KWGame.KWScriptController'
     bStartInitialized=True
     bNavigate=True
     bCollideWhenPlacing=True
     CollisionRadius=50.000000
     CollisionHeight=100.000000
     bDirectional=True
}
