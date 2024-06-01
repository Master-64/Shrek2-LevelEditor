//================================================================================
// PeasantBoy.
//================================================================================

class PeasantBoy extends PeasantChild
  Placeable
  Config(User);

defaultproperties
{
     ChildSkins(0)=Texture'ShCharacters.kid_tx'
     ChildSkins(1)=Texture'ShCharacters.kid2_tx'
     ChildSkins(2)=Texture'ShCharacters.kid3_tx'
     LoadString="ShrekCharacters.Boy"
     Mesh=SkeletalMesh'ShrekCharacters.boy'
}
