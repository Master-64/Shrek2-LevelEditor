//================================================================================
// SHBounceSheet.
//================================================================================

class SHBounceSheet extends BounceSheet
  Config(User);

var() bool bHiddenAtBeginning;
var Emitter BounceEmitter;
var() Class<Emitter> BouncerEmitter;

function Trigger(Actor Other, Pawn EventInstigator)
{
}

defaultproperties
{
}
