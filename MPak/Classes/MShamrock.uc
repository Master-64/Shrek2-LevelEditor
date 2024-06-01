// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MShamrock extends MPickup
	Config(MPak);


var() bool bBypassHealthCap, bPlayBumpline, bHealPawn;


function PostPickupLogic(Actor Other)
{
	local float fOldHealth;
	
	if(!bHealPawn)
	{
		fOldHealth = U.GetHealth(Pawn(Other));
	}
	
	U.AddShamrocks(iNumItems[0].Count, bBypassHealthCap);
	
	TryBumpline(Other);
	
	if(!bHealPawn)
	{
		U.SetHealth(Pawn(Other), fOldHealth);
	}
}

function TryBumpline(Actor Other)
{
	if(Other.IsA('SHHeroPawn') && bPlayBumpline)
	{
		if(iNumItems[0].Count > 0)
		{
			SHHeroPawn(Other).PlayPickupShamrockBumpLine();
		}
		else if(iNumItems[0].Count < 0)
		{
			SHHeroPawn(Other).SayHitBumpLine();
		}
	}
}


defaultproperties
{
	bPlayBumpline=true
	bHealPawn=true
	bPickupLogicHandlesInventory=true
	InventoryTypes(0)=class'ShamrockCollection'
	iNumItems(0)=(Min=1)
	PickupSounds(0)=Sound'Items.PickupShamrock'
	Event=ShamrockPickup
	StaticMesh=StaticMesh'Shrek2_Univ_SM.ShamrockShape'
	DrawScale=0.35
	CollisionRadius=20.0
	CollisionHeight=20.0
	CollisionWidth=4.0
	CollideType=CT_Box
}