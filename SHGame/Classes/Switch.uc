//================================================================================
// Switch.
//================================================================================

class Switch extends ShPropsStatic
  Config(User);

var() Sound SwitchSound;
var() float TimeToReset;
var float CurrentTime;
var() name ThrowSwitchAnimName;
var() name ReturnSwitchAnimName;
var() name OffAnimName;
var() name OnAnimName;
var() name PlayerName;
var() string LoadString;
var() name PlayerThrowSwitchAnimName;
var() int StartSoundFrame;

function AddAnimNotifys()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function PlaySwitchSound()
{
}

function OnEvent(name EventName)
{
}

defaultproperties
{
     bCanBeBaseForPawns=True
}
