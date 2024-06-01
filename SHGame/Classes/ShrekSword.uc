//================================================================================
// ShrekSword.
//================================================================================

class ShrekSword extends ShWeapon;

var bool bIsOut;

defaultproperties
{
     WeaponAttachBone="body_swordhand_joint"
     SecondaryWeaponAttachBone="body_sword_joint"
     SecondaryWeaponAttachRotation=(Pitch=16384,Yaw=52000)
     StaticMesh=StaticMesh'Character_Props.handsome_sword'
     CollisionRadius=1.000000
     CollisionHeight=1.000000
	 DrawType=DT_StaticMesh
}
