// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// The purpose of this actor is to globally save data across levels and game restarts
// This actor is used from within other actions, such as MACTION_SetGlobalData
// Do not make this placeable or force this actor to be physically in the map, as it's completely pointless
// 
// Important notice: always treat saved vectors and rotators as strings in other actions, as they're technically strings due to engine limitations
// 
// The expected format for all provided values (somewhat strict)
// Bool: "True", "False", "1", "0"
// Int: "64"
// Float: "64.0"
// String: "String"
// Vector: "(X=16.0,Y=32.0,Z=64.0)"
// Rotator: "(Roll=16,Pitch=32,Yaw=64)"


class MGlobalData extends MInfo
	Notplaceable
	Config(MGlobalData);


enum EManageType
{
	MT_SaveData,
	MT_LoadData
};

enum EDataType
{
	DT_Bool,
	DT_Int,
	DT_Float,
	DT_String,
	DT_Vector,
	DT_Rotator
};

var config array<int> bGlobal, iGlobal, iInvGlobal;
var config array<float> fGlobal;
var config array<string> sGlobal, vGlobal, rGlobal;
var config array< class<KWInventoryCollection> > InvClassesGlobal;


static function SaveGlobalData(EDataType DataType, int Slot, string Value, bool bGetCurrentGameSlot) // Saves all types of global data
{
	Slot = Clamp(Abs(Slot), 0, 9998);
	
	if(bGetCurrentGameSlot)
	{
		Slot = Clamp(class'ShFEGUIPage'.default.GameSlot, 0, 9998);
	}
	
	switch(DataType)
	{
		case DT_Bool:
			class'MGlobalData'.default.bGlobal[Slot] = int(bool(Value));
			
			break;
		case DT_Int:
			class'MGlobalData'.default.iGlobal[Slot] = int(Value);
			
			break;
		case DT_Float:
			class'MGlobalData'.default.fGlobal[Slot] = float(Value);
			
			break;
		case DT_String:
			class'MGlobalData'.default.sGlobal[Slot] = Value;
			
			break;
		case DT_Vector:
			class'MGlobalData'.default.vGlobal[Slot] = Value;
			
			break;
		case DT_Rotator:
			class'MGlobalData'.default.rGlobal[Slot] = Value;
			
			break;
	}
	
	class'MGlobalData'.static.StaticSaveConfig();
}

static function string LoadGlobalData(EDataType DataType, int Slot, bool bGetCurrentGameSlot) // Loads all types of global data
{
	Slot = Clamp(Abs(Slot), 0, 9998);
	
	if(bGetCurrentGameSlot)
	{
		Slot = Clamp(class'ShFEGUIPage'.default.GameSlot, 0, 9998);
	}
	
	switch(DataType)
	{
		case DT_Bool:
			return string(class'MGlobalData'.default.bGlobal[Slot]);
			
			break;
		case DT_Int:
			return string(class'MGlobalData'.default.iGlobal[Slot]);
			
			break;
		case DT_Float:
			return string(class'MGlobalData'.default.fGlobal[Slot]);
			
			break;
		case DT_String:
			return class'MGlobalData'.default.sGlobal[Slot];
			
			break;
		case DT_Vector:
			return class'MGlobalData'.default.vGlobal[Slot];
			
			break;
		case DT_Rotator:
			return class'MGlobalData'.default.rGlobal[Slot];
			
			break;
	}
}

static function SaveInvGlobalData(array< class<KWInventoryCollection> > Collections, array<int> Values) // Saves an inventory's data
{
	class'MGlobalData'.default.InvClassesGlobal = Collections;
	class'MGlobalData'.default.iInvGlobal = Values;
	
	class'MGlobalData'.static.StaticSaveConfig();
}

static function LoadInvGlobalData(out array< class<KWInventoryCollection> > Collections, out array<int> Values) // Loads an inventory's data
{
	Collections = class'MGlobalData'.default.InvClassesGlobal;
	Values = class'MGlobalData'.default.iInvGlobal;
}

static function ResetGlobalData() // Takes all saved data and completely erases all of it
{
	// Creates new empty arrays
	local array<int> iErase;
	local array<float> fErase;
	local array<string> sErase;
	local array< class<KWInventoryCollection> > InvErase;
	
	// Makes all arrays equal empty arrays (therefore resetting them)
	class'MGlobalData'.default.bGlobal = iErase;
	class'MGlobalData'.default.iGlobal = iErase;
	class'MGlobalData'.default.fGlobal = fErase;
	class'MGlobalData'.default.sGlobal = sErase;
	class'MGlobalData'.default.vGlobal = sErase;
	class'MGlobalData'.default.rGlobal = sErase;
	class'MGlobalData'.default.InvClassesGlobal = InvErase;
	class'MGlobalData'.default.iInvGlobal = iErase;
	
	// Applies the change
	class'MGlobalData'.static.StaticSaveConfig();
}