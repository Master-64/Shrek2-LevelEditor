// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MEnergyBar extends MPickup
	Config(MPak);


var() float fHealAmount;
var() bool bHealAmountIsHealPercent, bScaleHealAmountWithShamrocks, bDontTakeKnockback, bBypassHealthCap, bPlayBumpline;


function PostPickupLogic(Actor Other)
{
	local float fOrigHealAmount;
	
	PC = U.GetPC();
	
	fOrigHealAmount = fHealAmount;
	
	if(bHealAmountIsHealPercent)
	{
		if(!bScaleHealAmountWithShamrocks)
		{
			fHealAmount *= U.GetMaxHealth(Pawn(Other));
		}
		else
		{
			fHealAmount *= U.GetMaxHealth(Pawn(Other)) * (float(U.GetInventoryCount(class'ShamrockCollection') + 1) / 6.0);
		}
	}
	
	if(bScaleHealAmountWithShamrocks)
	{
		fHealAmount *= float(U.GetInventoryCount(class'ShamrockCollection') + 1);
	}
	
	if(U.IsInBonusLevel())
	{
		if(PC.IsA('SHHeroController') && U.GetHP() == Other)
		{
			SHHeroController(PC).bonusHealth = U.GetHealth(HP);
			SHHeroController(PC).SaveConfig();
		}
	}
	
	TryBumpline(Other);
	
	U.AddHealth(Pawn(Other), fHealAmount, bDontTakeKnockback, bBypassHealthCap);
	
	fHealAmount = fOrigHealAmount;
}

function TryBumpline(Actor Other)
{
	if(Other.IsA('SHHeroPawn') && bPlayBumpline)
	{
		if(fHealAmount > 0.0)
		{
			SHHeroPawn(Other).PlayPickupEnergyBarBumpLine();
		}
		else if(fHealAmount < 0.0)
		{
			SHHeroPawn(Other).SayHitBumpLine();
		}
	}
}

defaultproperties
{
	fHealAmount=25.0
	bPlayBumpline=true
	InventoryTypes(0)=class'EnergyBarCollection'
	PickupSounds(0)=Sound'Items.pickup_HeroBar'
	Event=EnergyBarPickup
	AmbientEmitterClass=class'Health_Twirl'
	PickupEmitterClass=class'Health_Explod'
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Energy_BarShape'
	DrawScale=1.25
	CollisionRadius=10.0
	CollisionHeight=18.0
	CollisionWidth=25.0
	CollideType=CT_Box
}