//================================================================================
// KWCursor.
//================================================================================

class KWCursor extends KWPawn
  Config(User);

var() float fClickDistance;

function Vector GetTargetPosition(Vector ScreenPos, float canvSizeX, float canvSizeY, float mX, float mY)
{
}

function Actor GetFocusedActor(Vector Start, Vector End, out Vector HitLocation, out Vector HitNormal)
{
}

function Actor GetCursorEndLocation(float canvSizeX, float canvSizeY, float mX, float mY, float GUIScale, out Vector Loc, out Vector norm)
{
}

defaultproperties
{
     fClickDistance=10000.000000
     bHidden=True
}
