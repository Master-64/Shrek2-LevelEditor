//================================================================================
// Despawner.
//================================================================================

class Despawner extends KWPawn
  Config(User);

var() name EventName;
var() bool bForceDespawn;

function Touch(Actor Other)
{
}

defaultproperties
{
     bHidden=True
	 DrawType=DT_Sprite
     Texture=Texture'Engine.S_Keypoint'
     CollisionRadius=30.000000
	 CollisionWidth=30.00
     CollisionHeight=30.000000
	 CollideType=CT_Box
     bBlockActors=False
     bBlockPlayers=False
     bProjTarget=False
}
