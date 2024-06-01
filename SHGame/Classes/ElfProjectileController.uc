//================================================================================
// ElfProjectileController.
//================================================================================

class ElfProjectileController extends ElfCombatController;

enum eDifficulty {
  E_EASY,
  E_MEDIUM,
  E_HARD
};

var float newdist;
var float distCheck;
var Vector velChange;
var() eDifficulty throwDifficulty;

function ThrowObject()
{
}

function Vector GetThrowLocation(int diff)
{
}

function Vector FindStandLocation()
{
}

defaultproperties
{
}
