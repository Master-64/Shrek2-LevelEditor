//================================================================================
// AppleTreeController.
//================================================================================

class AppleTreeController extends Sh_NPCController;

var Vector vLookDir;
var Rotator vTurnRot;
var bool bLookAtHero;
var float maxTurnAmount;
var float nNextThrowCounter;
var float nNextThrowTime;
var bool bWait;
var int coinCounter;
var float nTimeStunnedCounter;
var name currentAnim;
var float currentFrame;
var Emitter fxStunned;
var Class<Emitter> fxStunnedClass;
var bool bTurn;
var Rotator turnRotationEnd;
var float turnRotationCurrent;
var float easyTurn;
var int easyCounter;
var Rotator easyRotator;
var Coin C;
var Vector coinDest;
var name lastAttackAnim;
var name nextState;
var bool vEmitterOn;
var FrogEnemy myFrog;
var Sound sfxIceBreak;

function Rotator GetTurnRotation()
{
}

function bool TurnedToFar()
{
}

function SpawnCoins()
{
}

function SpawnAPrize(class<Actor> aClass, Vector vDir)
{
}

function DoUnTrigger()
{
}

function DoTrigger()
{
}

function DestroyEmitters()
{
}

function name GetAttackAnimName()
{
}

defaultproperties
{
     maxTurnAmount=24576.000000
     fxStunnedClass=Class'SHGame.Tree_Daze'
     sfxIceBreak=Sound'Potions.ice_potion_break'
}
