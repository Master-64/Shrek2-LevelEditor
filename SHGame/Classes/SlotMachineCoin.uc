//================================================================================
// SlotMachineCoin.
//================================================================================

class SlotMachineCoin extends ShProps
  NotPlaceable
  Config(User);

var Class<Emitter> fxClass;
var Vector fxOffset;

function SpawnParticles()
{
}

defaultproperties
{
     Physics=PHYS_Falling
	 DrawType=DT_StaticMesh
     StaticMesh=StaticMesh'Shrek2_Univ_SM.CoinShape'
     DrawScale=0.130000
     CollisionRadius=28.000000
     CollisionHeight=18.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
     RotationRate=(Pitch=0,Yaw=15000,Roll=0)
}
