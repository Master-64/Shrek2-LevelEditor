// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Persists camera effects provided to this info across loads
// Do not, under any circumstances, delete this info. Doing so will cause a game crash
// Do not make this placeable or force this actor to be physically in the map, as it's completely pointless


class MCameraEffectPersister extends MInfo
	Notplaceable
	Config(MPak);


var array<CameraEffect> SavedCameraEffects;
var byte MotionBlur_BlurAlpha;
var KWHeroController PC;


event PostBeginPlay()
{
	local int i;
	local MCameraEffectPersister CEP;
	
	super.PostBeginPlay();
	
	foreach DynamicActors(class'MCameraEffectPersister', CEP)
	{
		i++;
	}
	
	if(i > 1)
	{
		Destroy();
	}
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(!bLoadFromSaveGame)
	{
		return;
	}
	
	AddCameraEffects(SavedCameraEffects);
}

function AddCameraEffects(array<CameraEffect> CameraEffects, optional bool bSaveEffects) // Adds camera effects, and can make them persist
{
	local array<CameraEffect> CEs;
	local int i;
	local bool B;
	
	if(PC == none)
	{
		PC = U.GetPC();
	}
	
	if(bSaveEffects)
	{
		if(SavedCameraEffects.Length == 0 || CameraEffects.Length == 0)
		{
			SavedCameraEffects = CameraEffects;
		}
		else
		{
			for(i = 0; i < CameraEffects.Length; i++)
			{
				SavedCameraEffects.Insert(SavedCameraEffects.Length, 1);
				SavedCameraEffects[SavedCameraEffects.Length - 1] = CameraEffects[i];
			}
		}
	}
	
	CEs = CameraEffects;
	
	for(i = 0; i < PC.CameraEffects.Length; i++)
	{
		if(PC.CameraEffects[i].IsA('MotionBlur'))
		{
			B = true;
			
			break;
		}
	}
	
	for(i = 0; i < CEs.Length; i++)
	{
		if(CEs[i].IsA('MotionBlur'))
		{
			if(!B)
			{
				PC.CreateCameraEffect(class'MotionBlur');
			}
			
			SetMotionBlurAlpha(MotionBlur_BlurAlpha);
			
			CEs.Remove(i, 1);
		}
	}
	
	if(CEs.Length != 0)
	{
		for(i = 0; i < CEs.Length; i++)
		{
			PC.CameraEffects.Insert(PC.CameraEffects.Length, 1);
			PC.CameraEffects[PC.CameraEffects.Length - 1] = CEs[i];
		}
	}
}

function ClearCameraEffects() // Clears all current camera effects
{
	local array<CameraEffect> CEs;
	local int i;
	
	SavedCameraEffects = CEs;
	
	if(PC == none)
	{
		PC = U.GetPC();
	}
	
	for(i = 0; i < PC.CameraEffects.Length; i++)
	{
		if(!PC.CameraEffects[i].IsA('MotionBlur'))
		{
			Level.ObjectPool.FreeObject(PC.CameraEffects[i]);
			
			PC.CameraEffects.Remove(i, 1);
			
			i--;
		}
		else
		{
			SetMotionBlurAlpha(255);
		}
	}
}

function ClearSpecificCameraEffects(array< class<CameraEffect> > EffectsToClear) // Clears specific camera effects
{
	local int i1, i2, i3;
	
	if(PC == none)
	{
		PC = U.GetPC();
	}
	
	for(i1 = 0; i1 < PC.CameraEffects.Length; i1++)
	{
		for(i2 = 0; i2 < EffectsToClear.Length; i2++)
		{
			if(PC.CameraEffects[i1].Class == EffectsToClear[i2])
			{
				if(!ClassIsChildOf(EffectsToClear[i2], class'MotionBlur'))
				{
					Level.ObjectPool.FreeObject(PC.CameraEffects[i1]);
					
					PC.CameraEffects.Remove(i1, 1);
					
					i1--;
					
					for(i3 = 0; i3 < SavedCameraEffects.Length; i3++)
					{
						if(SavedCameraEffects[i3].Class == EffectsToClear[i2])
						{
							SavedCameraEffects.Remove(i3, 1);
							
							break;
						}
					}
				}
				else
				{
					SetMotionBlurAlpha(255);
				}
			}
		}
	}
}

function SetMotionBlurAlpha(byte B) // Changes the value of <MotionBlur_BlurAlpha> to <B>
{
	MotionBlur_BlurAlpha = B;
	U.CC("Set MotionBlur BlurAlpha" @ string(B));
}


defaultproperties
{
	MotionBlur_BlurAlpha=255
}