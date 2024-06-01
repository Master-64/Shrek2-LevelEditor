//================================================================================
// Sword.
//================================================================================

class Sword extends ShWeapon;

var bool bIsOut;

defaultproperties
{
     WeaponAttachBone="body_sword_joint"
     WeaponAttachRotation=(Pitch=48346,Yaw=4860,Roll=42496)
     SecondaryWeaponAttachBone="body_object_joint"
     SecondaryWeaponAttachOffset=(Y=8.000000,Z=-2.000000)
     SecondaryWeaponAttachRotation=(Roll=20160)
     Mesh=SkeletalMesh'ShrekCharacters.Sword'
     CollisionHeight=20.000000
}
