//================================================================================
// Hazard.
//================================================================================

class Hazard extends ShPropsStatic
  NotPlaceable
  Config(User);

var Class<Actor> AttachmentClass;
var name attachBone;
var Vector AttachOffset;
var Rotator AttachRotation;
var() name IdleAnimName;
var() name SwingAnimName;
var bool bWasUnTriggered;
var bool bAlreadySendEvent;
var() bool bSwingJustOnce;
var() bool bTriggerByEvent;
var() float TriggerRadius;
var() float SwingAnimRate;
var() bool bInstantDeath;
var() int DamageAmount;
var() float AttachmentHeight;
var() float AttachmentRadius;

function AttachAttachment()
{
}

defaultproperties
{
     TriggerRadius=500.000000
     SwingAnimRate=1.000000
     bInstantDeath=True
     AttachmentHeight=155.000000
     AttachmentRadius=50.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 bAlignBottom=False
}
