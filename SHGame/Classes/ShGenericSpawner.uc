//================================================================================
// ShGenericSpawner.
//================================================================================

class ShGenericSpawner extends KWGenericSpawner
  Config(User);

#exec TEXTURE IMPORT NAME=SHGenericSpawner FILE=Texture\SHGenericSpawner.tga FLAGS=2

defaultproperties
{
     Physics=PHYS_None
     bActivateOnTrigger=True
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'SHGenericSpawner'
}
