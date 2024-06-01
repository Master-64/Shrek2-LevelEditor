//================================================================================
// FGM_TableFood.
//================================================================================

class FGM_TableFood extends ShPropsStatic
  NotPlaceable
  Config(User);

defaultproperties
{
     ControllerClass=None
     StaticMesh=StaticMesh'11_FGM_Battle_SM.table_food'
     CollisionRadius=1.000000
     CollisionHeight=1.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockPlayers=False
     bUseCylinderCollision=True
	 bAlignBottom=False
	 DrawType=DT_StaticMesh
}
