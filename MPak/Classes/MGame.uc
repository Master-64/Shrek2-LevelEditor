// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MGame extends SHGame
	Config(MPak);


var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	SetPropertyText("bPauseWithSpecial", "False");
	
	U = GetUtils();
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

event PlayerController Login(string Portal, string Options, out string Error)
{
	local PlayerController NewPlayer;
	local KWPawn TestPawn;
	local class<Security> MySecurityClass;
	
	foreach AllActors(class'KWPawn', TestPawn)
	{
		if(bool(TestPawn.GetPropertyText("bIsMainPlayer")) && TestPawn.Controller != none)
		{
			if(TestPawn.Controller.Pawn != TestPawn)
			{
				TestPawn.Controller.Possess(TestPawn);
			}
			
			return PlayerController(TestPawn.Controller);
		}
		
		if(bool(TestPawn.GetPropertyText("bIsMainPlayer")) && TestPawn.Controller == none)
		{
			NewPlayer = Spawn(class<PlayerController>(DynamicLoadObject(PlayerControllerClassName, class'Class')));
			
			if(NewPlayer != none)
			{
				NewPlayer.GameReplicationInfo = GameReplicationInfo;
				NewPlayer.GotoState('Spectating');
				MySecurityClass = class<Security>(DynamicLoadObject(SecurityClass, class'Class'));
				NewPlayer.PlayerSecurity = Spawn(MySecurityClass, self);
				
				if(bDelayedStart)
				{
					NewPlayer.GotoState('PlayerWaiting');
				}
				
				NewPlayer.Possess(TestPawn);
				
				return NewPlayer;
			}
		}
	}
}


defaultproperties
{
	HUDType="SHGame.SHHud"
	GameName="Master Pack Game"
	DefaultPlayerClassName="SHGame.Shrek"
	PlayerControllerClassName="SHGame.ShrekController"
	bAllowBehindView=true
	bRestartLevel=false
	bDelayedStart=false
	AutoAim=1.0
	ScoreBoardType="XInterface.ScoreBoardDeathMatch"
	MapListType="XInterface.MapListDeathMatch"
	MapPrefix="M"
	BeaconName="M"
	MaxPlayers=64
	bPauseable=true
	bCanChangeSkin=true
	bCanViewOthers=true
	bChangeLevels=true
	bAllowWeaponThrowing=true
	bAdminCanPause=true
	GameDifficulty=1.0
	GameSpeed=1.0
	MaxSpectators=2
	DefaultPlayerName="Shrek"
	FearCostFallOff=0.95
	DeathMessageClass=class'LocalMessage'
	GameMessageClass=class'GameMessage'
	MutatorClass="Engine.Mutator"
	AccessControlClass="Engine.AccessControl"
	BroadcastHandlerClass="Engine.BroadcastHandler"
	GameReplicationInfoClass=class'GameReplicationInfo'
	GameStatsClass="Engine.GameStats"
	SecurityClass="Engine.Security"
	Acronym="MPak"
}