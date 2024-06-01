//================================================================================
// PeasantCombatController.
//================================================================================

class PeasantCombatController extends CombatController;

var bool bSlide;
var Class<Emitter> fxSplatClass;
var Emitter eSplat;

defaultproperties
{
     fxSplatClass=Class'SHGame.Ground_Splat'
}
