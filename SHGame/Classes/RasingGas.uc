//================================================================================
// RasingGas.
//================================================================================

class RasingGas extends ShProps
  Config(User);

var() int DamageToPlayer;
var() float RasingSpeed;
var() bool bGasInCutScene;

function PreCutPossess()
{
}

function PostCutUnPossess()
{
}

defaultproperties
{
     DamageToPlayer=1
     RasingSpeed=20.000000
     StaticMesh=StaticMesh'4_FGM_PIB_SM.Gas_Raise'
     bStasis=False
     CollisionRadius=400.000000
	 CollisionWidth=470.00
     CollisionHeight=7.000000
	 CollideType=CT_Box
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_StaticMesh
}
