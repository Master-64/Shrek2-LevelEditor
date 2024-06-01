//================================================================================
// KWKillerMover.
//================================================================================

class KWKillerMover extends KWMover;

#exec TEXTURE IMPORT NAME=KWKillerMover FILE=Texture\KWKillerMover.tga FLAGS=2

function Touch(Actor Other)
{
}

defaultproperties
{
     bBlockActors=False
     bBlockPlayers=False
	 Texture=Texture'KWKillerMover'
}
