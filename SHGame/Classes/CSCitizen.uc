//================================================================================
// CSCitizen.
//================================================================================

class CSCitizen extends SHCharacter
  Config(User);

enum E_CitizenType {
  MaleOne,
  MaleTwo,
  FemaleOne,
  FemaleTwo
};
var() E_CitizenType citizenType;

defaultproperties
{
     ControllerClass=None
     Mesh=SkeletalMesh'ShrekCharacters.citmale_hat1'
     DrawScale=1.200000
     CollisionRadius=28.000000
     CollisionHeight=40.000000
}
