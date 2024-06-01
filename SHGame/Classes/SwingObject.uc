//================================================================================
// SwingObject.
//================================================================================

class SwingObject extends ShPropsStatic
  Config(User);

var() Class<SwingAttachment> AttachmentClass1;
var() name AttachBone1;
var() Vector AttachOffset1;
var() Rotator AttachRotation1;
var() Class<SwingAttachment> AttachmentClass2;
var() name AttachBone2;
var() Vector AttachOffset2;
var() Rotator AttachRotation2;
var() name IdleAnimName;
var() name SwingAnimName;
var bool bWasUnTriggered;
var bool bAlreadySendEvent;
var bool bAlreadyPlayedMiddleSound;
var() bool bSwingJustOnce;
var() bool bTriggerByEvent;
var() float TriggerRadius;
var() float SwingAnimRate;
var() bool bInstantDeath;
var() int DamageAmount;
var() int FrameToSendEvent;
var() Sound MiddleOfSwingSound;

function PlaySoundInTheMiddleOfSwing()
{
}

function DealWithShadow(SwingAttachment sa)
{
}

function AttachAttachments()
{
}

defaultproperties
{
     TriggerRadius=500.000000
     SwingAnimRate=1.000000
     bInstantDeath=True
     bCanBeBaseForPawns=True
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
