//================================================================================
// PickupPilePotion.
//================================================================================

class PickupPilePotion extends EnemyPickupPile
  Config(User);

function DoExtraStuff()
{
}

defaultproperties
{
     sfxExplode(0)=Sound'Items.potion_throw'
     sfxExplode(1)=Sound'Items.potion_throw'
     StaticMesh=StaticMesh'4_FGM_PIB_SM.wheelbarrel_potions'
     DrawScale=0.400000
     PrePivot=(Z=47.000000)
     CollisionRadius=30.000000
     CollisionHeight=18.000000
     bUseCylinderCollision=True
	 DrawType=DT_StaticMesh
}
