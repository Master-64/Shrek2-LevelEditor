// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_SaveLoadInventory extends MScriptedAction
	Config(MGlobalData);


enum EActionType
{
	AT_SaveInventory,
	AT_LoadInventory
};

var(Action) MACTION_SaveLoadInventory.EActionType ActionType;
var(Action) array< class<KWInventoryCollection> > InventoryTypesToSave;


function bool InitActionFor(ScriptedController C)
{
	local int i;
	local array<int> CurrInv;
	local array< class<KWInventoryCollection> > TempCollections;
	
	GetUtils(C);
	
	switch(ActionType)
	{
		case AT_SaveInventory:
			for(i = 0; i < InventoryTypesToSave.Length; i++)
			{
				CurrInv[i] = U.GetInventoryCount(InventoryTypesToSave[i]);
			}
			
			class'MGlobalData'.static.SaveInvGlobalData(InventoryTypesToSave, CurrInv);
			
			break;
		case AT_LoadInventory:
			class'MGlobalData'.static.LoadInvGlobalData(TempCollections, CurrInv);
			
			for(i = 0; i < TempCollections.Length; i++)
			{
				U.SetInventory(TempCollections[i], CurrInv[i]);
			}
			
			break;
	}
	
	return false;
}

function string GetActionString()
{
	switch(ActionType)
	{
		case AT_SaveInventory:
			return ActionString @ "-- Saving inventory";
			
			break;
		case AT_LoadInventory:
			return ActionString @ "-- Loading inventory";
			
			break;
	}
}


defaultproperties
{
	InventoryTypesToSave(0)=class'BoxOfEnergyBarsCollection'
	InventoryTypesToSave(1)=class'CoinCollection'
	InventoryTypesToSave(2)=class'CoinStackCollection'
	InventoryTypesToSave(3)=class'EnergyBarCollection'
	InventoryTypesToSave(4)=class'EnergyKegCollection'
	InventoryTypesToSave(5)=class'MicePotionStrongCollection'
	InventoryTypesToSave(6)=class'MicePotionWeakCollection'
	InventoryTypesToSave(7)=class'MoneyBagCollection'
	InventoryTypesToSave(8)=class'MousePotionCollection'
	InventoryTypesToSave(9)=class'PixiePotionCollection'
	InventoryTypesToSave(10)=class'PixiePotionStrongCollection'
	InventoryTypesToSave(11)=class'PixiePotionWeakCollection'
	InventoryTypesToSave(12)=class'Potion1Collection'
	InventoryTypesToSave(13)=class'Potion2Collection'
	InventoryTypesToSave(14)=class'Potion3Collection'
	InventoryTypesToSave(15)=class'Potion4Collection'
	InventoryTypesToSave(16)=class'Potion5Collection'
	InventoryTypesToSave(17)=class'Potion6Collection'
	InventoryTypesToSave(18)=class'Potion7Collection'
	InventoryTypesToSave(19)=class'Potion8Collection'
	InventoryTypesToSave(20)=class'Potion9Collection'
	InventoryTypesToSave(21)=class'PotionBottleCollection'
	InventoryTypesToSave(22)=class'PotionHEACollection'
	InventoryTypesToSave(23)=class'ShamrockCollection'
	InventoryTypesToSave(24)=class'ShrekPosterCollection'
	InventoryTypesToSave(25)=class'ShrekPosterCollection2sh'
	InventoryTypesToSave(26)=class'ShrekPosterCollection3sh'
	InventoryTypesToSave(27)=class'ShrekPosterCollection4sh'
	InventoryTypesToSave(28)=class'ShrekPosterCollection5sh'
	InventoryTypesToSave(29)=class'ShrekPosterCollection6sh'
	InventoryTypesToSave(30)=class'ShrekPosterCollection7sh'
	InventoryTypesToSave(31)=class'ShrekPosterCollection8sh'
	InventoryTypesToSave(32)=class'ShrekPosterCollection9sh'
	InventoryTypesToSave(33)=class'ShrekPosterCollection10sh'
	InventoryTypesToSave(34)=class'ShrekPosterCollection11sh'
	InventoryTypesToSave(35)=class'ShrekPosterCollection12sh'
	InventoryTypesToSave(36)=class'SpecialAttackCollection'
	InventoryTypesToSave(37)=class'StrengthPotionCollection'
	ActionString="Save/Load Inventory"
}