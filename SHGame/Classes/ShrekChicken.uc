//================================================================================
// ShrekChicken.
//================================================================================

class ShrekChicken extends ShrekCreature
  Placeable
  Config(User);

defaultproperties
{
     MeshNameString="ShrekCharacters.Chicken"
     BlendOutLandingFrame=20
     SHHeroName="Chicken"
     CameraSetStandard=(vLookAtOffset=(X=-30,Y=0,Z=45),fLookAtDistance=100,fLookAtHeight=30,fRotTightness=8,fRotSpeed=8,fMoveTightness=(X=25,Y=40,Z=40),fMoveSpeed=0,fMaxMouseDeltaX=190,fMaxMouseDeltaY=65,fMinPitch=-10000,fMaxPitch=10000)
     CameraSnapRotationPitch=-2500.000000
     GroundRunSpeed=300.000000
     GroundWalkSpeed=300.000000
     BaseMovementRate=300.000000
     Mesh=SkeletalMesh'ShrekCharacters.Chicken'
     CollisionRadius=15.000000
     CollisionHeight=13.000000
}
