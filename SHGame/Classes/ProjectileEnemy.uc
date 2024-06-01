//================================================================================
// ProjectileEnemy.
//================================================================================

class ProjectileEnemy extends ShEnemy
  Config(User);

var EnemyPickup throwingItem;
var name attachBone;

defaultproperties
{
     ControllerClass=Class'SHGame.ProjectileController'
}
