//================================================================================
// VendingWitch.
//================================================================================

class VendingWitch extends ShProps
  Config(User);

enum E_PrizeType {
  WON_PRIZE,
  LOST_PRIZE
};

var SlotMachine MySlotMachine;
var() string LoadString;
var() E_PrizeType PrizeType;

defaultproperties
{
     LoadString="EnvAnims.VendingWitch"
	 Physics=PHYS_Walking
     Mesh=SkeletalMesh'EnvAnims.VendingWitch'
     bUnlit=True
     CollisionRadius=15.000000
     CollisionHeight=10.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
}
