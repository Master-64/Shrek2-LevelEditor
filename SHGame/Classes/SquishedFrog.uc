//================================================================================
// SquishedFrog.
//================================================================================

class SquishedFrog extends ShPropsStatic
  Config(User);

var() Material FrogSkin;
var() float fTimeTillFadeOutBegins;
var() float fFadeOutTime;

defaultproperties
{
     FrogSkin=Texture'ShCharacters.frog_squashed'
     fTimeTillFadeOutBegins=3.000000
     fFadeOutTime=1.000000
     Mesh=SkeletalMesh'ShrekCharacters.knight_hubcap'
     PrePivot=(Y=-20.000000)
     bShouldBaseAtStartup=False
     CollisionRadius=15.000000
     CollisionHeight=2.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
}
