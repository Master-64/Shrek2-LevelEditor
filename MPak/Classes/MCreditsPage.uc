// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MCreditsPage extends MGUIPage
	Config(MPak);


struct CreditLinesStruct
{
	var string sLine;
	var Font fFont;
};

const iSettingsCount = 6;

var array<string> CustomCreditLines;
var array<CreditLinesStruct> CreditLines;
var string sCreditsFileName, sMapToOpenOnceFinished;
var float fInitialPauseDelay, fCreditsScrollRate, fGlobalOffsetX, fGlobalOffsetY, fHorizontalOffset, fEndingOffsetY;
var bool bCalculatedCreditsPageHeight, bSkippable;
var GUIController GUIC;


event InitComponent(GUIController MyController, GUIComponent MyOwner)
{
	local int i;
	local bool bProvidedSettings;
	local array<string> FileString;
	local string sTemp;
	
	super.InitComponent(MyController, MyOwner);
	
	__OnDraw__Delegate = InternalOnDraw;
	__OnKeyEvent__Delegate = InternalOnKeyEvent;
	
	if(CustomCreditLines.Length == 0)
	{
		if(sCreditsFileName != "")
		{
			U.LoadStringArray(FileString, "..\\System\\" $ sCreditsFileName);
		}
		else
		{
			U.LoadStringArray(FileString, "..\\System\\Credits.txt");
		}
	}
	else
	{
		FileString = CustomCreditLines;
	}
	
	if(FileString.Length == 0)
	{
		ClosePage();
		
		return;
	}
	
	if(InStr(FileString[0], "[Settings]") > -1)
	{
		bProvidedSettings = true;
		
		for(i = 1; i < iSettingsCount + 1; i++)
		{
			if(InStr(FileString[i], "fInitialPauseDelay=") > -1)
			{
				fInitialPauseDelay = float(Mid(FileString[i], 19));
			}
			else if(InStr(FileString[i], "bSkippable=") > -1)
			{
				bSkippable = bool(Mid(FileString[i], 11));
			}
			else if(InStr(FileString[i], "fCreditsScrollRate=") > -1)
			{
				fCreditsScrollRate = FMax(float(Mid(FileString[i], 19)), 0.000001);
			}
			else if(InStr(FileString[i], "fHorizontalOffset=") > -1)
			{
				fGlobalOffsetX = float(Mid(FileString[i], 18));
			}
			else if(InStr(FileString[i], "sMapToOpenOnceFinished=") > -1)
			{
				sMapToOpenOnceFinished = Mid(FileString[i], 23);
				
				U.ReplaceText(sMapToOpenOnceFinished, "\"", "");
			}
			else if(InStr(FileString[i], "BackgroundMaterial=") > -1)
			{
				sTemp = Mid(FileString[i], 19);
				U.ReplaceText(sTemp, "\"", "");
				
				Background = Material(DynamicLoadObject(sTemp, class'Material'));
			}
		}
	}
	
	for(i = 0; i < FileString.Length; i++)
	{
		CreditLines.Insert(CreditLines.Length, 1);
		
		CreditLines[i].sLine = FileString[i];
		
		// Tab characters usually never render right, so I'm converting them into 4 space characters instead
		if(InStr(CreditLines[i].sLine, "	") > -1)
		{
			U.ReplaceText(CreditLines[i].sLine, "	", "    ");
		}
		
		// If a line is truly empty, the spacing of the lines will end up being incorrect
		if(CreditLines[i].sLine == "")
		{
			CreditLines[i].sLine = " ";
		}
		
		if(InStr(Left(CreditLines[i].sLine, 2), "**") > -1)
		{
			CreditLines[i].fFont = U.GetFontFromEnum(F_HugeInkFont);
			
			CreditLines[i].sLine = Mid(CreditLines[i].sLine, 2);
		}
		else if(InStr(Left(CreditLines[i].sLine, 1), "*") > -1)
		{
			CreditLines[i].fFont = U.GetFontFromEnum(F_BigInkFont);
			
			CreditLines[i].sLine = Mid(CreditLines[i].sLine, 1);
		}
		else if(InStr(Left(CreditLines[i].sLine, 1), "#") > -1)
		{
			CreditLines[i].fFont = U.GetFontFromEnum(F_SmallInkFont);
			
			CreditLines[i].sLine = Mid(CreditLines[i].sLine, 1);
		}
		else
		{
			CreditLines[i].fFont = U.GetFontFromEnum(F_MedInkFont);
		}
	}
	
	if(bProvidedSettings)
	{
		CreditLines.Remove(0, iSettingsCount + 2);
	}
	
	GUIC = MyController;
	GUIC.bHideMouseCursor = true;
}

event bool InternalOnKeyEvent(out byte Key, out byte State, float Delta)
{
	if(!bSkippable)
	{
		return false;
	}
	
	return super.InternalOnKeyEvent(Key, State, Delta);
}

function bool InternalOnDraw(Canvas C)
{
	local int i;
	local float fOffsetX, fOffsetY, fTextW, fTextH, fTempOffsetY;
	
	if(fInitialPauseDelay > 0.0)
	{
		fInitialPauseDelay = FMax(fInitialPauseDelay - U.GetDeltaTime(), 0.0);
		
		return false;
	}
	
	fOffsetX = C.SizeX / 2;
	fOffsetY = C.SizeY;
	
	C.SetPos(fOffsetX, fOffsetY);
	
	fGlobalOffsetY -= (U.GetDeltaTime() * (C.SizeY / 8.0)) * fCreditsScrollRate;
	
	if(!bCalculatedCreditsPageHeight)
	{
		bCalculatedCreditsPageHeight = true;
		
		for(i = 0; i < CreditLines.Length; i++)
		{
			C.Font = CreditLines[i].fFont;
			C.TextSize(CreditLines[i].sLine, fTextW, fTextH);
			
			fTempOffsetY += fTextH * 2;
		}
		
		fEndingOffsetY -= fTempOffsetY + C.SizeY + (C.SizeY / 4);
	}
	
	for(i = 0; i < CreditLines.Length; i++)
	{
		C.Font = CreditLines[i].fFont;
		C.TextSize(CreditLines[i].sLine, fTextW, fTextH);
		
		U.DrawShadowText(C, CreditLines[i].sLine, U.MakeColor(255, 255, 255, 255), U.MakeColor(0, 0, 0, 255), fOffsetX - (fTextW / 2.0) + fGlobalOffsetX, fOffsetY - (fTextH / 2.0) + fGlobalOffsetY, 2.0);
		
		fOffsetY += fTextH * 2;
	}
	
	if(fEndingOffsetY > fGlobalOffsetY)
	{
		ClosePage();
	}
	
	return false;
}

function ClosePage()
{
	super.ClosePage();
	
	GUIC.bHideMouseCursor = false;
	
	if(sMapToOpenOnceFinished != "")
	{
		U.FadeScreen(U.MakeColor(0, 0, 0, 255));
		U.ChangeLevel(sMapToOpenOnceFinished);
	}
}


defaultproperties
{
	fCreditsScrollRate=1.0
	bSkippable=true
}