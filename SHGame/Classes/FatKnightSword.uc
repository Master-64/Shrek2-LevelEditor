//================================================================================
// FatKnightSword.
//================================================================================

class FatKnightSword extends ShWeapon;

var Sound swordFall;

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     swordFall=Sound'Knights.sword_hit11'
     WeaponAttachBone="body_sword_joint"
     WeaponAttachRotation=(Yaw=32768)
     StaticMesh=StaticMesh'Character_Props.fatk_sword'
     CollisionRadius=1.500000
     CollisionHeight=20.000000
}
