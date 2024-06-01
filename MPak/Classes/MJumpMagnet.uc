// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MJumpMagnet extends JumpMagnet
	HideCategories(JumpMagnet)
	Config(MPak);


var() float fJumpTime, fHeightCheckAmount;
var() bool bTakeAwayControl, bAutoJump, bAllowMultipleInputs, bDisableIfFalling, bDisableIfNoGroundBelow;
var float fOldJumpTime;
var byte bJustJumped;
var SHHeroPawn Player;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PreBeginPlay()
{
	super.PreBeginPlay();
	
	JumpTime = fJumpTime;
	fOldJumpTime = fJumpTime;
	
	if(bAutoJump)
	{
		bTakeAwayControl = false;
	}
}

event PostBeginPlay()
{
	super.PostBeginPlay();
	
	U = GetUtils();
	
	HP = U.GetHP();
	
	if(!HP.IsA('SHHeroPawn'))
	{
		return;
	}
	
	Player = SHHeroPawn(HP);
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

event Touch(Actor Other)
{
	if(bAutoJump && !Player.bUseJumpMagnet)
	{
		Player.bUseJumpMagnet = true;
		Player.NewJumpMagnet = self;
	}
}

event Tick(float DeltaTime)
{
	HP = U.GetHP();
	
	if(!HP.IsA('SHHeroPawn'))
	{
		return;
	}
	
	Player = SHHeroPawn(HP);
	
	if(Player.Controller.IsInState('StateNoPawnMoveCanTurn'))
	{
		bJustJumped++;
		
		bJustJumped = Clamp(bJustJumped, 0, 2);
	}
	else
	{
		bJustJumped = 0;
	}
	
	if(!bTakeAwayControl && bJustJumped == 1)
	{
		Player.Controller.GotoState('PlayerWalking');
	}
	
	if(bAllowMultipleInputs && bJustJumped > 0)
	{
		Player.bUseJumpMagnet = false;
	}
	
	if((bDisableIfNoGroundBelow && FastTrace(U.Vec(Location.X, Location.Y, Location.Z + fHeightCheckAmount))) || (bDisableIfFalling && Player.Physics == PHYS_Falling))
	{
		SetCollision(false, false, false);
	}
	else if(!bCollideActors)
	{
		SetCollision(default.bCollideActors, false, false);
	}
	
	if(fOldJumpTime != fJumpTime)
	{
		JumpTime = fJumpTime;
	}
	
	fOldJumpTime = fJumpTime;
}


defaultproperties
{
	JumpTime=1.25
	fJumpTime=1.25
	fHeightCheckAmount=-256.0
	bTakeAwayControl=true
	bEdShouldSnap=true
}