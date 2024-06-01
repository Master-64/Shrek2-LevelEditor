//================================================================================
// KWScriptedAction.
//================================================================================

class KWScriptedAction extends Object
	Abstract;

var localized string ActionString;
var bool bValidForTrigger;
var string DestTagString;
var KWCutController MyController;
var bool bFinished;
var bool bRequiresTick;
var int DebugLineNumber;

function Init(KWCutController C)
{
}

function ForceFinish(KWCutController C)
{
}

function OnTick(float DeltaTime)
{
}

function OnTimer()
{
}

function OnTrigger(Actor Other)
{
}

function OnCue(string cue)
{
}

function OnAnimEnd(int Channel)
{
}

function PostFinish()
{
}

function bool MoveToGoal()
{
}

function bool TurnToGoal()
{
}

function Actor GetMoveTargetFor(KWCutController C)
{
}

function ActionFinished(KWCutController C)
{
}

function CLog(string Str)
{
}

function bool InitActionFor(KWCutController C)
{
}

function bool EndsSection()
{
}

function bool StartsSection()
{
}

function KWScriptedSequence GetScript(KWScriptedSequence S)
{
}

function ProceedToNextAction(KWCutController C)
{
}

function ProceedToSectionEnd(KWCutController C)
{
}

function string GetActionString()
{
}

function SerializeFrom(string arg)
{
}

defaultproperties
{
     ActionString="unspecified action"
     bValidForTrigger=True
}
