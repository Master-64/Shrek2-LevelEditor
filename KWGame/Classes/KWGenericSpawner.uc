//================================================================================
// KWGenericSpawner.
//================================================================================

class KWGenericSpawner extends KWPawn
  Config(User);

const MAX_SPAWNED_GOODIES = 8;

struct Animations
{
    var() name Opening;
    var() float OpeningAnimRate;
    var() name Closing;
    var() float ClosingAnimRate;
    var() name Start;
    var() float StartAnimRate;
    var() name End;
    var() float EndAnimRate;
};

struct Particles
{
    var() class<Emitter> Spawning;
    var() class<Emitter> Opening;
    var() class<Emitter> Closing;
    var() class<Emitter> Start;
    var() class<Emitter> End;
    var() Vector StartPos;
    var() name StartBone;
};

struct MaxMin
{
    var() int Max;
    var() int Min;
};

var() array<Sound> ClosingSound;
var() array<Sound> SpawningSound;
var() class<Actor> GoodieToSpawn[8];
var() int GoodiesNumber[8];
var() name SpawningAnim;
var() float SpawningAnimRate;
var() Particles Emitts;
var() name NoMoreLivesEvent;
var() name HitBySpellEvent;
var() Animations Anims;
var() array<Sound> OpeningSnds;
var() MaxMin Limits;
var() name StartBone;
var() Vector StartPos;
var() Vector StartVel;
var() Vector StartVelVariance;
var() float StartVelMultiplier;
var() float BaseParticlesZOffset;
var() class<Emitter> BaseParticles;
var() class<Emitter> SingleParticle[3];
var() Sound SingleSound[3];
var() array<Sound> EndSound;
var() float BaseDelay;
var() float GoodieDelay;
var() int Lives;
var() bool bDestroable;
var() float fTimeToFadeAtEnd;
var FadeActorDelegate fader;
var() bool bMakeSpawnPersistent;
var() bool bLivesPersistent;
var bool bInitialized;
var Vector BaseParticlePos;
var Vector BaseEmitterPos;
var Emitter SpawningEmitter;
var Emitter StartEmitter;
var bool bSpawnExactNumbers;
var int HowManyObjectsToSpawn;
var int RandomNums;
var int CurrentNum;
var int CurrentNum1;
var class<Projectile> vulnerableToClassSaved;
var() bool bActivateOnTrigger;
var() bool bNoIgnoreEncroachers;

function FindBaseParticlePos()
{
}

function FindEmitterPos()
{
}

function SpawnObject(int Index)
{
}

defaultproperties
{
     SpawningAnimRate=1.000000
	 Anims=(Opening=Open,OpeningAnimRate=1,Closing=Close,ClosingAnimRate=1,Start=Start,StartAnimRate=1,End=End,EndAnimRate=1)
     Limits=(Max=6,Min=2)
     StartPos=(Z=-10.000000)
     StartVelVariance=(X=100.000000,Y=100.000000,Z=100.000000)
     StartVelMultiplier=75.000000
     GoodieDelay=0.500000
     Lives=1
     bMakeSpawnPersistent=True
     bLivesPersistent=True
     SoundRadius=200.000000
     SoundVolume=200
}
