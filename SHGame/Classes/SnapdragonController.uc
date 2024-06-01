//================================================================================
// SnapdragonController.
//================================================================================

class SnapdragonController extends Sh_NPCController;

var bool bCollisionOn;
var Coin spawnedCoin;
var bool vEmitterOn;
var FrogEnemy myFrog;
var Sound sfxIceBreak;
var int randSnarl;

function DoUnTrigger()
{
}

function DoTrigger()
{
}

function startTimer()
{
}

function DestroyEmitters()
{
}

defaultproperties
{
     sfxIceBreak=Sound'Potions.ice_potion_break'
}
