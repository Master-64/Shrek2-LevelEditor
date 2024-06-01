//================================================================================
// TransientAmbientCreature.
//================================================================================

class TransientAmbientCreature extends TransientAmbientPawn;

var AmbientCreatureManager MyManager;
var TransientAmbientCreature NextCreature;
var() Class<Pawn> PawnTypes[8];
var() Class<TransientAmbientCreature> PredatorType;
var() Class<TransientAmbientCreature> AltPredatorType;
var() Class<TransientAmbientCreature> UnderWaterType;
var() float MinSpawnDist;
var() float MaxSpawnDist;
var() bool bOffCameraSpawns;
var() bool bUnderWaterCreatures;
var() Class<Pawn> PickedClass;
var() TransientAmbientCreature Prey;
var() float FlockRadius;
var() int NumSlaves;
var TransientAmbientCreature Replacement;

function AddSlaves(TransientAmbientPawn Last, int SpawnNum)
{
}

function TransientAmbientPawn SpawnSlave()
{
}

function Vector InitialLocation(Vector CurrentLocation)
{
}

function AddPawn()
{
}

function Rotator SpawnRotation()
{
}

function Destroyed()
{
}

function NotVisible()
{
}

function float MaxHiddenTime()
{
}

function SlavePawnDied(Pawn P)
{
}

function PawnDied(Pawn P)
{
}

static function Vector FindSpawnLocation(float dist, Vector SpawnDir, PlayerController Viewer)
{
}

static function Vector FindGround(PlayerController Viewer, Vector StartLoc)
{
}

function Vector PickDestination(TransientAmbientPawn P)
{
}

function PickSlaveDestination(TransientAmbientPawn P)
{
}

defaultproperties
{
    UnderWaterType=Class'FishSchool'
    MinSpawnDist=500
    MaxSpawnDist=3000
    bOffCameraSpawns=true
    FlockRadius=200
    RemoteRole=ROLE_None
}