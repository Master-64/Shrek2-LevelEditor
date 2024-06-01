//================================================================================
// PushButton.
//================================================================================

class PushButton extends ShPropsStatic
  NotPlaceable
  Config(User);

var() Sound ButtonSound;
var() float TimeToReset;
var float CurrentTime;
var() name ButtonDownAnimName;
var() name ButtonUpAnimName;
var() name ButtonStaticAnimName;
var() name PlayerName;

function OnEvent(name EventName)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

defaultproperties
{
     bCanBeBaseForPawns=True
}
