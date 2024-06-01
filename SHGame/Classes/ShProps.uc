//================================================================================
// ShProps.
//================================================================================

class ShProps extends shpawn
  Config(User);

var(Sound) float PitchMin;
var(Sound) float PitchMax;
var shpawn DamagePawn;
var() bool bGiveNoDamage;
var() bool bTakeNoDamage;
var(AI) bool bTriggerStart;
var(AI) int HitsToKill;
var name savedState;

function PreCutPossess()
{
}

function PreCutUnPossess()
{
}

function DamagePlayer(Vector HitLocation, class<DamageType> DamageType)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function float GetRandomPitch(int Min, int Max)
{
}

function float GetRandomRadius(int Min, int Max)
{
}

function PlaySfx(array<Sound> sfxArray, optional bool FullVolume)
{
}

function Play3DSfx(array<Sound> sfxArray, float sndRadius)
{
}

function PlaySingleSfx(Sound sfx)
{
}

defaultproperties
{
     PitchMin=1.000000
     PitchMax=1.000000
     TAKEHITBONE="'"
     bStasis=True
	 Physics=PHYS_None
}
