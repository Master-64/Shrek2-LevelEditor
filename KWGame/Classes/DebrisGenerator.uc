//================================================================================
// DebrisGenerator.
//================================================================================

class DebrisGenerator extends KWPawn
  Config(User);

const NUM_ENTRIES = 8;
const DEFAULT_VELOCITY = 250;

struct DebrisParams
{
    var() StaticMesh aStaticMesh;
    var() class<Emitter> bParticles;
    var() Sound cSound;
    var() float DrawScale;
    var() bool hasParticles;
    var() Range LifetimeRange;
    var() int Velocity;
};

var() DebrisParams HitDebris;
var() DebrisParams BaseDebris[8];
var() bool JustOnce;
var() int NumDebris;
var() float LowScale;
var() float WaitingTime;
var float ScaleDown;
var int NumMeshs;
var() bool bDirectionalBreak;

function StaticMesh GetRandomStaticMesh(int Index)
{
}

function GenerateDebris()
{
}

function Disintegrate(Vector start_locn, Rotator dirn)
{
}

defaultproperties
{
     NumDebris=20
     LowScale=1.000000
     WaitingTime=1.000000
     bHidden=True
     InitialState="TriggerOpenTimed"
	 DrawType=DT_StaticMesh
}
