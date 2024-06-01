//================================================================================
// PotionDestroyer.
//================================================================================

class PotionDestroyer extends ShPropsStatic
  Config(User);

#exec TEXTURE IMPORT NAME=PotionDestroyer FILE=Texture\PotionDestroyer.tga FLAGS=2

defaultproperties
{
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'PotionDestroyer'
	 CollideType=CT_Box
}
