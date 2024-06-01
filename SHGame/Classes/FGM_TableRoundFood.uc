//================================================================================
// FGM_TableRoundFood.
//================================================================================

class FGM_TableRoundFood extends ShPropsStatic
  NotPlaceable
  Config(User);

defaultproperties
{
     ControllerClass=None
     StaticMesh=StaticMesh'11_FGM_Battle_SM.table_round_food'
     CollisionRadius=1.000000
     CollisionHeight=1.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockPlayers=False
     bUseCylinderCollision=True
	 DrawType=DT_StaticMesh
}
