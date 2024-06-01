//================================================================================
// SaveTimer.
//================================================================================

class SaveTimer extends ShProps
  Config(User);

#exec TEXTURE IMPORT NAME=SaveTimer FILE=Texture\SaveTimer.tga FLAGS=2

var() float timetowait;

defaultproperties
{
     timetowait=1.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'SaveTimer'
}
