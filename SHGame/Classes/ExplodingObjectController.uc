//================================================================================
// ExplodingObjectController.
//================================================================================

class ExplodingObjectController extends Sh_NPCController;

enum eState {
  E_IDLE,
  E_REACT_ONE,
  E_REACT_TWO,
  E_REACT_THREE,
  E_EXPLODE
};

var float RemainingTime;
var float Counter;
var float saveRemainingTime;
var bool startColorChange;
var eState objState;

function HaveLanded()
{
}

function DoUnTrigger()
{
}

function DoTrigger()
{
}

defaultproperties
{
}
