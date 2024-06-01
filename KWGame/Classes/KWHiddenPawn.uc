//================================================================================
// KWHiddenPawn.
//================================================================================

class KWHiddenPawn extends KWPawn
  Placeable
  Config(User);

#exec TEXTURE IMPORT NAME=HidPawn FILE=Texture\HidPawn.tga FLAGS=2

defaultproperties
{
     bHidden=True
     Texture=Texture'HidPawn'
	 DrawType=DT_Sprite
     CollisionRadius=10.000000
     CollisionHeight=10.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
	 Physics=PHYS_None
}
