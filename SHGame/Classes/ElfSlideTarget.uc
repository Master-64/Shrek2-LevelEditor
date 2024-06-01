//================================================================================
// ElfSlideTarget.
//================================================================================

class ElfSlideTarget extends ShPropsStatic
  Config(User);

#exec TEXTURE IMPORT NAME=SpongifyTargetTexture FILE=Texture\SpongifyTargetTexture.tga FLAGS=2

defaultproperties
{
     ControllerClass=None
     bHidden=True
     bShouldBaseAtStartup=False
     CollisionRadius=35.000000
     CollisionHeight=35.000000
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'SpongifyTargetTexture'
}
