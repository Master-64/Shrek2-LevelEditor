//================================================================================
// ShCreature.
//================================================================================

class ShCreature extends SHCharacter
  Config(User);

var(sounds) array<Sound> sfxDie;
var(sounds) array<Sound> sfxAttack;
var(sounds) array<Sound> sfxDieFrozen;
var(Sound) float PitchMin;
var(Sound) float PitchMax;
var(Attack) int DamageAmount;
var(Attack) float AttackDistance;
var() float AttackCollisionRadius;
var() string LoadString;
var() Material SkinFreeze;

function PlaySfx(array<Sound> sfxArray)
{
}

function float GetRandomPitch(int Min, int Max)
{
}

defaultproperties
{
     sfxDieFrozen(0)=Sound'Potions.ice_potion_break'
     PitchMin=0.900000
     PitchMax=1.100000
     DamageAmount=1
     AttackDistance=20.000000
     AttackCollisionRadius=20.000000
     Health=1
}
