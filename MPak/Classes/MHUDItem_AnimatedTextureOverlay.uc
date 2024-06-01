// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A HUD item that can overlay animated textures onto the screen


class MHUDItem_AnimatedTextureOverlay extends MHUDItem_TextureOverlay
	HideCategories(MHUDItem_TextureOverlay)
	Config(MPak);


struct AnimateStruct
{
	var int iFrame;
	var float fTime, fFrameTime;
	var bool bEnabled;
	var() array<Texture> Frames;
	var() EOriginType OriginType;
	var() float fFrameRate;
	var() bool bDestroyOnEnd, bFillScreen;
};

var() array<AnimateStruct> Animations;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	Disable('Tick');
}

function BuildAnimations()
{
	local int i;
	
	for(i = 0; i < Animations.Length; i++)
	{
		Animations[i].bEnabled = true;
		Animations[i].fFrameTime = FMax((1000.0 / Animations[i].fFrameRate) / 1000.0, 0.001);
		
		Textures.Insert(Textures.Length, 1);
		Textures[i].Texture = Animations[i].Frames[0];
		Textures[i].OriginType = Animations[i].OriginType;
		Textures[i].bFillScreen = Animations[i].bFillScreen;
	}
}

function DeleteAnimations()
{
	Disable('Tick');
	
	Textures.Remove(0, Textures.Length);
	Animations.Remove(0, Animations.Length);
}

function StartAnimations(array<AnimateStruct> Anims)
{
	DeleteAnimations();
	
	Animations = Anims;
	
	BuildAnimations();
	
	Enable('Tick');
}

event Tick(float DeltaTime)
{
	local int i;
	local array<Texture> Ts;
	
	Ts = TickAnimationLogic(DeltaTime);
	
	if(Ts.Length == 0)
	{
		return;
	}
	
	for(i = 0; i < Textures.Length; i++)
	{
		Textures[i].Texture = Ts[i];
	}
}

function array<Texture> TickAnimationLogic(float DeltaTime)
{
	local array<Texture> Ts;
	local int i;
	
	for(i = 0; i < Animations.Length; i++)
	{
		if(Animations[i].fTime >= Animations[i].fFrameTime)
		{
			Animations[i].fTime = 0.0;
			Animations[i].iFrame++;
			
			if(Animations[i].iFrame >= Animations[i].Frames.Length)
			{
				if(Animations[i].bDestroyOnEnd)
				{
					Animations[i].bEnabled = false;
				}
				else
				{
					Animations[i].iFrame = 0;
				}
			}
		}
		
		if(!Animations[i].bEnabled)
		{
			Textures.Remove(i, 1);
			Animations.Remove(i, 1);
			
			i--;
			
			continue;
		}
		
		Ts[i] = Animations[i].Frames[Animations[i].iFrame];
		
		Animations[i].fTime += DeltaTime;
	}
	
	return Ts;
}