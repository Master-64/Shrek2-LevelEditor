// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MDriveThrough extends DriveThrough
	Config(MPak);


var(DriveThrough) int iPotionCost_Strength, iPotionCost_Frog, iPotionCost_Invisibility, iPotionCost_Sleep, iPotionCost_Stinky, iPotionCost_Shrink, iPotionCost_ShrinkEnemies, iPotionCost_Freeze, iPotionCost_Love;
var(DriveThrough) Sound AcceptSound, CancelSound, BuySound1, BuySound2, JingleSound;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	U = GetUtils();
	
	SpawnTrailingParticles();
}

function MUtils GetUtils()
{
	local MUtils Ut;
	
	foreach DynamicActors(class'MUtils', Ut)
	{
		return Ut;
	}
	
	return Spawn(class'MUtils');
}

function ActivateVendor()
{
	class'DriveThroughMenu'.default.PotionCost[0] = iPotionCost_Strength;
	class'DriveThroughMenu'.default.PotionCost[1] = iPotionCost_Frog;
	class'DriveThroughMenu'.default.PotionCost[2] = iPotionCost_Invisibility;
	class'DriveThroughMenu'.default.PotionCost[3] = iPotionCost_Sleep;
	class'DriveThroughMenu'.default.PotionCost[4] = iPotionCost_Stinky;
	class'DriveThroughMenu'.default.PotionCost[5] = iPotionCost_Shrink;
	class'DriveThroughMenu'.default.PotionCost[6] = iPotionCost_ShrinkEnemies;
	class'DriveThroughMenu'.default.PotionCost[7] = iPotionCost_Freeze;
	class'DriveThroughMenu'.default.PotionCost[8] = iPotionCost_Love;
	class'DriveThroughMenu'.default.sfxAccept = AcceptSound;
	class'DriveThroughMenu'.default.sfxCancel = CancelSound;
	class'DriveThroughMenu'.default.sfxBuy = BuySound1;
	class'DriveThroughMenu'.default.sfxCoin = BuySound2;
	
	super.ActivateVendor();
	
	RevertChanges();
}

function RevertChanges()
{
	class'DriveThroughMenu'.default.PotionCost[0] = 30;
	class'DriveThroughMenu'.default.PotionCost[1] = 45;
	class'DriveThroughMenu'.default.PotionCost[2] = 40;
	class'DriveThroughMenu'.default.PotionCost[3] = 45;
	class'DriveThroughMenu'.default.PotionCost[4] = 45;
	class'DriveThroughMenu'.default.PotionCost[5] = 35;
	class'DriveThroughMenu'.default.PotionCost[6] = 45;
	class'DriveThroughMenu'.default.PotionCost[7] = 45;
	class'DriveThroughMenu'.default.PotionCost[8] = 45;
	class'DriveThroughMenu'.default.sfxAccept = Sound'UI.PotionUI_checkout';
	class'DriveThroughMenu'.default.sfxCancel = Sound'UI.PotionUI_cancel';
	class'DriveThroughMenu'.default.sfxBuy = Sound'UI.PotionUI_get_item';
	class'DriveThroughMenu'.default.sfxCoin = Sound'UI.PotionUI_coin_countdown';
}

function ChooseIdleBehavior()
{
	local float HeroDistance;
	
	HeroDistance = Abs(VSize(Location - U.GetHP().Location));
	
	if(HeroDistance > TauntDistance)
	{
		GotoState('DriveThroughIdle');        
	}
	else if(HeroDistance < TalkingDistance && IntroPlayed == false)
	{
		IntroPlayed = true;
		
		U.PlayASound3D(self,, JingleSound, 0.8);
	}
}


defaultproperties
{
	iPotionCost_Strength=30
	iPotionCost_Frog=45
	iPotionCost_Invisibility=40
	iPotionCost_Sleep=45
	iPotionCost_Stinky=45
	iPotionCost_Shrink=35
	iPotionCost_ShrinkEnemies=45
	iPotionCost_Freeze=45
	iPotionCost_Love=45
	AcceptSound=Sound'UI.PotionUI_checkout'
	CancelSound=Sound'UI.PotionUI_cancel'
	BuySound1=Sound'UI.PotionUI_get_item'
	BuySound2=Sound'UI.PotionUI_coin_countdown'
	JingleSound=Sound'Items.DT_FGMJingleSong'
	bAlignBottom=false
	PrePivot=(Z=-80.0)
}