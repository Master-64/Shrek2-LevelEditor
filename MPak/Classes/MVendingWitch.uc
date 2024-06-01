// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MVendingWitch extends SHProps
	Config(MPak);


var byte bActive;
var bool bDisabled;
var MSlotMachine S;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	local Actor A;
	local AIScript AIS;
	local class<AIController> AIC;
	local int i;
	
	U = GetUtils();
	
	if(bool(GetPropertyText("bIsMainPlayer")))
	{
		bDontPossess = true;
	}
	
	SplashTime = 0.0;
	SpawnTime = Level.TimeSeconds;
	EyeHeight = BaseEyeHeight;
	OldRotYaw = float(Rotation.Yaw);
	
	if(Level.bStartup && U.GetHealth(self) > 0.0 && !bDontPossess)
	{
		if(AIScriptTag != 'None')
		{
			foreach AllActors(class'AIScript', AIS, AIScriptTag)
			{
				break;
			}
			
			if(AIS != none)
			{
				AIS.SpawnControllerFor(self);
				
				if(Controller != none)
				{
					return;
				}
			}
		}
		
		SetPropertyText("AIC", GetPropertyText("ControllerClass"));
		
		if(AIC != none && Controller == none)
		{
			Controller = Spawn(AIC);
		}
		
		if(Controller != none)
		{
			Controller.Possess(self);
			
			AIController(Controller).Skill += SkillModifier;
		}
	}
	
	if(!bNoDefaultInventory)
	{
		AddDefaultInventory();
	}
	
	SetJumpVars();
	KWAddShadow();
	MaxHealth = U.GetHealth(self);
	GroundSpeed = GroundRunSpeed;
	WalkingPct = GroundWalkSpeed / GroundRunSpeed;
	CreationTime = Level.TimeSeconds;
	
	for(i = 0; i < AttachTypeArray.Length; i++)
	{
		A = Spawn(AttachTypeArray[i], self);
		
		if(A != none)
		{
			A.SetPhysics(PHYS_Trailer);
			A.SetCollision(false, false, false);
			A.bCollideWorld = false;
			AttachedActorArray.Insert(AttachedActorArray.Length, 1);
			AttachedActorArray[AttachedActorArray.Length - 1] = A;
		}
	}
	
	AnimBlendParams(ATTACKCHANNEL_LOWER, 0, 0, 0, LOWER_BODY_BONE);
	AnimBlendParams(ATTACKCHANNEL_UPPER, 0, 0, 0, UPPER_BODY_BONE);
	AnimBlendParams(ARMCHANNEL_RIGHT, 0, 0, 0, RIGHT_ARM_BONE);
	AnimBlendParams(ARMCHANNEL_LEFT, 0, 0, 0, LEFT_ARM_BONE);
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

event Tick(float DeltaTime)
{
	if(S == none || bDisabled)
	{
		return;
	}
	
	HP = U.GetHP();
	
	if(U.VSize2D(HP.Location - Location) <= S.WitchSettings.fAppearDistance && bActive == 0)
	{
		GotoState('Appear');
	}
	else if(U.VSize2D(HP.Location - Location) > S.WitchSettings.fAppearDistance && bActive == 2)
	{
		GotoState('Inactive');
	}
	
	if(S.WitchSettings.bTurnToPlayer)
	{
		U.FancySetRotation(self, rotator(HP.Location - Location),, true);
	}
}

auto state StateIdle{}

state Inactive
{
	Begin:
	
	bActive = 1;
	
	PlayAnim(S.WitchSettings.nDisappearAnim,, 0.1);
	
	Sleep(0.24);
	
	if(S.WitchSettings.WitchDisappearSound.Length != 0)
	{
		U.PlayASound3D(self,, S.WitchSettings.WitchDisappearSound[Rand(S.WitchSettings.WitchDisappearSound.Length)]);
	}
	
	FinishAnim();
	
	bActive = 0;
	
	bHidden = true;
}

state Appear
{
	Begin:
	
	bHidden = false;
	
	bActive = 3;
	
	if(S.WitchSettings.WitchAppearSound.Length != 0)
	{
		U.PlayASound3D(self,, S.WitchSettings.WitchAppearSound[Rand(S.WitchSettings.WitchAppearSound.Length)]);
	}
	
	PlayAnim(S.WitchSettings.nAppearAnim);
	
	FinishAnim();
	
	GotoState('Active');
}

state Active
{
	Begin:
	
	bActive = 2;
	
	LoopAnim(S.WitchSettings.nIdleAnim,, 0.1);
}

state Spinning
{
	Begin:
	
	bActive = 3;
	
	LoopAnim(S.WitchSettings.nSpinIdleAnim,, 0.1);
}

state Payout
{
	Begin:
	
	PlayAnim(S.WitchSettings.nPayoutAnim,, 0.1);
	
	FinishAnim();
	
	GotoState('Active');
}


defaultproperties
{
	IdleAnimName=casualidle
	bUnlit=false
	AmbientGlow=32
	bHidden=true
	bCollideActors=false
	bCollideWorld=false
	bBlockActors=false
	bStasis=false
}