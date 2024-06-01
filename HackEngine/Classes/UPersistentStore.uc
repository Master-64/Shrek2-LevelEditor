//================================================================================
// UPersistentStore.
//================================================================================

class UPersistentStore extends Inventory
    notplaceable;

function SaveInt(string VarName, int val);

function SaveBool(string VarName, bool val);

function SaveByte(string VarName, byte val);

function SaveFloat(string VarName, float val);

function SaveName(string VarName, name val);

function SaveString(string VarName, string val);

function bool RestoreValue(string VarName, out string val);

function bool RestoreInt(string VarName, out int val);

function bool RestoreBool(string VarName, out int val);

function bool RestoreByte(string VarName, out byte val);

function bool RestoreFloat(string VarName, out float val);

function bool RestoreName(string VarName, out name val);

function bool RestoreString(string VarName, out string val);