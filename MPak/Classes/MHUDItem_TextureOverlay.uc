// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A HUD item that can overlay textures onto the screen


class MHUDItem_TextureOverlay extends MHUDItem
	Config(MPak);


enum EOriginType
{
	OT_Top_Left,
	OT_Top,
	OT_Top_Right,
	OT_Middle_Left,
	OT_Middle,
	OT_Middle_Right,
	OT_Bottom_Left,
	OT_Bottom,
	OT_Bottom_Right
};

struct TextureStruct
{
	var() Texture Texture;
	var() EOriginType OriginType;
	var() bool bFillScreen;
};

var() array<TextureStruct> Textures;


event PostBeginPlay()
{
	super.PostBeginPlay();
}

function AddTexture(TextureStruct T) // Adds a new texture
{
	Textures.Insert(Textures.Length, 1);
	Textures[Textures.Length - 1] = T;
}

function RemoveTexture(Texture T) // Removes the texture <T> from the overlaid textures
{
	local int i;
	
	for(i = 0; i < Textures.Length; i++)
	{
		if(T == Textures[i].Texture)
		{
			Textures.Remove(i, 1);
			
			i--;
		}
	}
}

function RemoveAllTextures() // Removes every overlaid texture
{
	Textures.Remove(0, Textures.Length);
}

function DrawHudItem(Canvas C)
{
	local int i;
	
	for(i = 0; i < Textures.Length; i++)
	{
		if(!Textures[i].bFillScreen)
		{
			C.SetPos(GetPosByOriginType(C, Textures[i].Texture, Textures[i].OriginType, 0), GetPosByOriginType(C, Textures[i].Texture, Textures[i].OriginType, 1));
			parentHUD.RenderToScale(C, Textures[i].Texture);
		}
		else
		{
			C.SetPos(0, 0);
			C.DrawTile(Textures[i].Texture, (C.SizeX / Textures[i].Texture.USize) * Textures[i].Texture.USize, (C.SizeY / Textures[i].Texture.VSize) * Textures[i].Texture.VSize, 0, 0, Textures[i].Texture.USize, Textures[i].Texture.VSize);
		}
	}
}

function float GetPosByOriginType(Canvas C, Texture T, EOriginType OriginType, int I) // Returns a position that corresponds with an origin type
{
	I = Clamp(I, 0, 1);
	
	switch(OriginType)
	{
		case OT_Top_Left:
			if(I == 0)
			{
				return 0.0;
			}
			else
			{
				return 0.0;
			}
			
			break;
		case OT_Top:
			if(I == 0)
			{
				return (C.SizeX / 2) - (T.USize / 2);
			}
			else
			{
				return 0.0;
			}
			
			break;
		case OT_Top_Right:
			if(I == 0)
			{
				return C.SizeX - T.USize;
			}
			else
			{
				return 0.0;
			}
			
			break;
		case OT_Middle_Left:
			if(I == 0)
			{
				return 0.0;
			}
			else
			{
				return (C.SizeY / 2) - (T.VSize / 2);
			}
			
			break;
		case OT_Middle:
			if(I == 0)
			{
				return (C.SizeX / 2) - (T.USize / 2);
			}
			else
			{
				return (C.SizeY / 2) - (T.VSize / 2);
			}
			
			break;
		case OT_Middle_Right:
			if(I == 0)
			{
				return C.SizeX - T.USize;
			}
			else
			{
				return (C.SizeY / 2) - (T.VSize / 2);
			}
			
			break;
		case OT_Bottom_Left:
			if(I == 0)
			{
				return 0.0;
			}
			else
			{
				return C.SizeY - T.VSize;
			}
			
			break;
		case OT_Bottom:
			if(I == 0)
			{
				return (C.SizeX / 2) - (T.USize / 2);
			}
			else
			{
				return C.SizeY - T.VSize;
			}
			
			break;
		case OT_Bottom_Right:
			if(I == 0)
			{
				return C.SizeX - T.USize;
			}
			else
			{
				return C.SizeY - T.VSize;
			}
			
			break;
	}
}