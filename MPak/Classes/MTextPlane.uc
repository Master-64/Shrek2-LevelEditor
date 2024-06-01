// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MTextPlane extends MPawn
	Config(MPak);


struct TextStruct
{
	var() string sText;
	var() MUtils.EFont FontType;
	var() Color cTextColor;
	var() int iPositionOffset[2];
	var() bool bDropShadow;
	var() float fDropShadowDistance;
};

struct LayerStruct
{
	var() Texture Texture;
	var() Color cTextureColor;
};

var() array<TextStruct> TextLayers;
var() array<LayerStruct> TextureLayers;
var() bool bInitiallyDrawText, bTriggerOnceOnly, bShowTextLayersInOrderByTrigger, bCycleThroughTextLayers, bPickRandomTextLayer;
var() float fCycleRate;
var bool bTriggered;
var Material SavingTexture;
var int iCurrentTextLayer, iUVResolution[2], iRandomTextLayer;
var ScriptedTexture TextPlane;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	if(TextureLayers.Length != 0)
	{
		if(Skins[0] != default.Skins[0])
		{
			if(TextureLayers[0].Texture == none && Skins[0].IsA('Texture'))
			{
				TextureLayers[0].Texture = Texture(Skins[0]);
			}
		}
		
		if(TextureLayers[0].Texture != none)
		{
			SavingTexture = TextureLayers[0].Texture;
		}
	}
	
	fCycleRate = FMax(fCycleRate, 0.01);
	
	if(bPickRandomTextLayer)
	{
		iRandomTextLayer = -1;
	}
	
	if(bCycleThroughTextLayers)
	{
		SetTimer(fCycleRate, true);
	}
	
	SetText();
}

event PreSaveGame()
{
	DestroyText();
}

event PostSaveGame()
{
	SetText();
}

event PostLoadGame(bool bLoadFromSaveGame)
{
	if(bLoadFromSaveGame)
	{
		SetText();
	}
}

event Destroyed()
{
	DestroyText();
	
	super.Destroyed();
}

event Timer()
{
	CycleTextLayer();
	
	UpdateText();
}

function SetText()
{
	TextPlane = ScriptedTexture(Level.ObjectPool.AllocateObject(class'ScriptedTexture'));
	TextPlane.SetSize(iUVResolution[0], iUVResolution[1]);
	TextPlane.Client = self;
	
	Skins[0] = TextPlane;
}

function DestroyText()
{
	Skins[0] = SavingTexture;
	
	if(TextPlane != none)
	{
		Level.ObjectPool.FreeObject(TextPlane);
		
		TextPlane = none;
	}
}

function UpdateText()
{
	TextPlane.Revision = int(!bool(TextPlane.Revision));
}

event RenderTexture(ScriptedTexture Tex)
{
	local int i, iTextWidth, iTextHeight;
	local Font fTextFont;
	
	if(TextPlane == none || Tex == none)
	{
		return;
	}
	
	for(i = 0; i < TextureLayers.Length; i++)
	{
		if(TextureLayers[i].Texture != none)
		{
			Tex.DrawTile(0, 0, (Tex.USize / TextureLayers[i].Texture.USize) * TextureLayers[i].Texture.USize, (Tex.VSize / TextureLayers[i].Texture.VSize) * TextureLayers[i].Texture.VSize, 0, 0, TextureLayers[i].Texture.USize, TextureLayers[i].Texture.VSize, TextureLayers[i].Texture, TextureLayers[i].cTextureColor);
		}
	}
	
	if(bInitiallyDrawText)
	{
		for(i = 0; i < TextLayers.Length; i++)
		{
			if(bPickRandomTextLayer)
			{
				if(iRandomTextLayer == -1)
				{
					iRandomTextLayer = Rand(TextLayers.Length);
				}
				
				i = iRandomTextLayer;
			}
			else if(bShowTextLayersInOrderByTrigger || bCycleThroughTextLayers)
			{
				i = iCurrentTextLayer;
			}
			
			if(TextLayers[i].sText != "")
			{
				fTextFont = U.GetFontFromEnum(TextLayers[i].FontType);
				
				Tex.TextSize(TextLayers[i].sText, fTextFont, iTextWidth, iTextHeight);
				
				if(TextLayers[i].bDropShadow)
				{
					Tex.DrawText(((Tex.USize / 2) - (iTextWidth / 2) - TextLayers[i].fDropShadowDistance) + TextLayers[i].iPositionOffset[0], ((Tex.VSize / 2) - (iTextHeight / 2) + TextLayers[i].fDropShadowDistance) + TextLayers[i].iPositionOffset[1], TextLayers[i].sText, fTextFont, U.MakeColor(0, 0, 0, 255));
				}
				
				Tex.DrawText(((Tex.USize / 2) - (iTextWidth / 2)) + TextLayers[i].iPositionOffset[0], ((Tex.VSize / 2) - (iTextHeight / 2)) + TextLayers[i].iPositionOffset[1], TextLayers[i].sText, fTextFont, TextLayers[i].cTextColor);
			}
			
			if(bShowTextLayersInOrderByTrigger || bCycleThroughTextLayers || bPickRandomTextLayer)
			{
				break;
			}
		}
	}
}

function int CycleTextLayer()
{
	if(iCurrentTextLayer == TextLayers.Length - 1)
	{
		iCurrentTextLayer = 0;
	}
	else
	{
		iCurrentTextLayer++;
	}
	
	return iCurrentTextLayer;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
	if((bTriggerOnceOnly && bTriggered) || bPickRandomTextLayer)
	{
		return;
	}
	
	bTriggered = true;
	
	if(bShowTextLayersInOrderByTrigger)
	{
		CycleTextLayer();
	}
	
	if(!bShowTextLayersInOrderByTrigger)
	{
		bInitiallyDrawText = !bInitiallyDrawText;
	}
	
	UpdateText();
}


defaultproperties
{
	TextLayers(0)=(cTextColor=(R=127,G=127,B=255,A=255),bDropShadow=true,fDropShadowDistance=2.0)
	TextureLayers(0)=(cTextureColor=(R=255,G=255,B=255,A=255))
	bInitiallyDrawText=true
	fCycleRate=3.0
	iUVResolution(0)=512
	iUVResolution(1)=512
	Skins(0)=Texture'KWGame.t'
	DrawType=DT_StaticMesh
	SavingTexture=Texture'Storybook_TX.Interior_2'
	StaticMesh=StaticMesh'4_FGM_PIB_SM.Map_FloorShape'
	bDirectional=true
	bShadowCast=true
	bStaticLighting=true
	Physics=PHYS_None
	bStasis=true
	bCanBeBaseForPawns=true
	bUseCylinderCollision=false
	bEdShouldSnap=true
}