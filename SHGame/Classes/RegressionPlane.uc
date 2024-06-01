//================================================================================
// RegressionPlane.
//================================================================================

class RegressionPlane extends ShProps
  Placeable
  Config(User);

var() Emitter FrontEmitter;
var() Emitter BackEmitter;
var() Emitter LeftEmitter;
var() Emitter RightEmitter;

defaultproperties
{
     Mesh=SkeletalMesh'ShrekCharacters.regression_plane'
     CollisionRadius=60.000000
     CollisionHeight=10.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
