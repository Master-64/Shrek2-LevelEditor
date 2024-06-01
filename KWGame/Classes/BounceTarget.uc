//================================================================================
// BounceTarget.
//================================================================================

class BounceTarget extends BounceObject
  Config(User);

#exec TEXTURE IMPORT NAME=SpongifyTargetTexture FILE=Texture\SpongifyTargetTexture.tga FLAGS=2

defaultproperties
{
     bStatic=True
     bHidden=True
     CollisionRadius=16.000000
     CollisionHeight=16.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'SpongifyTargetTexture'
}
