// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MACTION_ManageCameraEffects extends MScriptedAction
	Config(MPak);


var(Action) export editinline array<export editinline CameraEffect> CameraEffects;
var(Action) byte MotionBlur_BlurAlpha;
var(Action) bool bPersistCameraEffects, bAddEffectsInstead, bClearSpecificEffects;
var(Action) array< class<CameraEffect> > ClearCameraEffects;
var MCameraEffectPersister CEP;


function bool InitActionFor(ScriptedController C)
{
	local MCameraEffectPersister tCEP;
	
	if(CEP == none)
	{
		foreach C.DynamicActors(class'MCameraEffectPersister', tCEP)
		{
			CEP = tCEP;
			
			break;
		}
		
		if(CEP == none)
		{
			CEP = C.Spawn(class'MCameraEffectPersister');
			
			if(CEP == none)
			{
				Warn(ActionString @ "-- Failed to create camera effect persister; aborting process");
				
				return false;
			}
		}
	}
	
	if(!bClearSpecificEffects)
	{
		if(CameraEffects.Length != 0)
		{
			if(!bAddEffectsInstead)
			{
				CEP.ClearCameraEffects();
			}
			
			if(UsingMotionBlur() != -1)
			{
				CEP.SetMotionBlurAlpha(MotionBlur_BlurAlpha);
			}
			
			CEP.AddCameraEffects(CameraEffects, bPersistCameraEffects);
		}
		else
		{
			CEP.ClearCameraEffects();
		}
	}
	else
	{
		CEP.ClearSpecificCameraEffects(ClearCameraEffects);
	}

	
	return false;
}

function int UsingMotionBlur() // Returns the index of which camera effect being added is a MotionBlur CameraEffect, if a MotionBlur CameraEffect is going to be added
{
	local int i;
	
	for(i = 0; i < CameraEffects.Length; i++)
	{
		if(CameraEffects[i].IsA('MotionBlur'))
		{
			return i;
		}
	}
	
	return -1;
}

function string GetActionString()
{
	if(bClearSpecificEffects)
	{
		return ActionString @ "-- Clearing specific camera effects";
	}
	else if(CameraEffects.Length != 0)
	{
		return ActionString @ "-- Applying camera effects";
	}
	else
	{
		return ActionString @ "-- Removing all camera effects";
	}
}


defaultproperties
{
	MotionBlur_BlurAlpha=127
	bPersistCameraEffects=true
	ActionString="Manage Camera Effects"
}