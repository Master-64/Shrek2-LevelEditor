// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MBearTrap extends SHPropsStatic
	Config(MPak);


var() float fDamageAmount, fCurrentOpacityForFadeOut, fDesiredOpacityForFadeOut, fSpeedOpacityForFadeOut;
var() Sound TrapSound;
var() class<Emitter> TrapLeavesEmitter;
var() class<TrapLeaves> TrapLeavesClass;
var() name TrapStaticAnimName, TrapSnapAnimName;
var() bool bChangeOpacityForFadeOut, bAffectAllPawns, bTakeKnockback;
var TrapLeaves TrapLeaves;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	local Actor A;
	
	super.PostBeginPlay();
	
	U = GetUtils();
	
	if(TrapLeavesClass != none)
	{
		U.MFancySpawn(TrapLeavesClass, Location, Rotation, A);
		
		TrapLeaves = TrapLeaves(A);
		TrapLeaves.SetDrawScale(DrawScale);
	}
}

event AddAnimNotifys()
{
	local MeshAnimation MeshAnim;
	
	MeshAnim = MeshAnimation(DynamicLoadObject("EnvAnims.BearTrap", class'MeshAnimation'));
	LinkSkelAnim(MeshAnim);
	
	AddNotify(MeshAnim, TrapSnapAnimName, 4.0, 'AnimNotifyDestroyLeaves');
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

event AnimNotifyDestroyLeaves()
{
	if(TrapLeavesEmitter != none)
	{
		U.MFancySpawn(TrapLeavesEmitter, Location);
	}
	
	if(TrapLeaves != none)
	{
		U.FancyDestroy(TrapLeaves);
	}
}

event Destroyed()
{
	if(TrapLeaves != none)
	{
		TrapLeaves.Destroy();
	}
}

function TakeDamage(int Damage, Pawn instigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType)
{
	return;
}

auto state stateTrapOff
{
	function TakeDamage(int Damage, Pawn instigatedBy, vector HitLocation, vector Momentum, class<DamageType> DamageType)
	{
		if(DamageType != class'ExplodingObjectDamage')
		{
			return;
		}
		
		GotoState('stateTrapSnap');
	}

	event Bump(Actor Other)
	{
		super.Bump(Other);
		
		if(!Other.IsA('Pawn'))
		{
			return;
		}
		
		HP = U.GetHP();
		
		if(bAffectAllPawns || Other == HP)
		{
			U.AddHealth(Pawn(Other), -fDamageAmount, !bTakeKnockback);
			
			GotoState('stateTrapSnap');
		}
	}
	
	Begin:

	LoopAnim(TrapStaticAnimName);
}

state stateTrapSnap
{
	event BeginState()
	{
		U.PlayASound3D(self,, TrapSound);
		PlayAnim(TrapSnapAnimName);
		
		if(Event != 'None')
		{
			TriggerEvent(Event, self, none);
		}
		
		SetCollision(false, false, false);
	}
	
	Begin:

	FinishAnim();
	
	GotoState('stateTrapFadeOut');
}

state stateTrapFadeOut
{
	event Tick(float DeltaTime)
	{
		if(!bChangeOpacityForFadeOut)
		{
			return;
		}
		
		fCurrentOpacityForFadeOut -= fSpeedOpacityForFadeOut * DeltaTime;
		
		if(fCurrentOpacityForFadeOut < fDesiredOpacityForFadeOut)
		{
			fCurrentOpacityForFadeOut = fDesiredOpacityForFadeOut;
			bChangeOpacityForFadeOut = false;
			
			U.FancyDestroy(self);
		}
		
		SetOpacity(fCurrentOpacityForFadeOut);
	}
}


defaultproperties
{
	fDamageAmount=15.0
	TrapSound=Sound'Items.Shrek_switch'
	TrapLeavesEmitter=class'Cookie_Bits'
	TrapLeavesClass=class'BearTrapLeaves'
	TrapStaticAnimName=Static
	TrapSnapAnimName=snap
	bChangeOpacityForFadeOut=true
	fCurrentOpacityForFadeOut=1.0
	fSpeedOpacityForFadeOut=1.0
	ControllerClass=none
	Mesh=SkeletalMesh'EnvAnims.BearTrap'
	DrawScale=4.0
	CollisionRadius=12.0
	CollisionHeight=4.0
	bAlignBottom=false
	bTakeKnockback=true
	bAffectAllPawns=true
	bCanBeBaseForPawns=true
	bSHPropsStaticGetDamageByExplode=true
}