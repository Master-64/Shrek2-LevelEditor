// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Categorizes all of the Pickups


class MPickup extends TimedCue
	Placeable
	HideCategories(TimedCue)
	Config(MPak);


struct MinMaxStruct
{
	var() int Min, Max;
	var int Count;
};

var() array< class<KWInventoryCollection> > InventoryTypes;
var() array<MinMaxStruct> iNumItems;
var() array<Sound> PickupSounds, BounceSounds;
var() float fPickupSoundVolume, fTimeTillFadeOutBegins, fFadeOutTime, fVisibilityRadius, fSpawnChance, fRespawnTime, fBounceDropoffMultiplier, fBounceSoundRadius, fBounceIntoPlaceTimeout, fDespawnDelay;
var() bool bRotating, bScalePickupSizeWithDistance, bFadeWithDistance, bDestroyAfterFadeOut, bInvalidTouchIfDead, bInvalidTouchIfTraceFail, bPickupOnUnTouchInstead, bCanBePickedUpWhileBouncing, bAnyPawnCanPickup, bOtherPawnsCanStealPickup, bUseLivesSystem, bBounceIntoPlace, bSpawnWithRandomRotation, bRunPickupLogic, bForceNoFade;
var() class<Pawn> PawnClassForPickup;
var() array<Material> RandSkins;
var() int iRespawnLives;
var() class<Emitter> AmbientEmitterClass, PickupEmitterClass, RespawnEmitterClass;
var() vector vAmbientEmitterOffset, vPickupEmitterOffset, vRespawnEmitterOffset;
var Emitter AmbientEmitter, PickupEmitter, RespawnEmitter;
var bool bPickupLogicHandlesInventory;
var float fOrigTimeTillFadeOutBegins, fOrigFadeOutTime;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;

// Actor
var(Actor) KWGame.ELumosType _LumosType;
var(Advanced) KWGame.EMountAction _MountAction;
var(Advanced) KWGame.EMaterialType _MaterialType;
var(Lighting) bool _bNoShadows;
var(Advanced) bool _bHideOnDetailDrop;
var(Display) int _AlphaSortLayer;
var(Display) float _LODBiasSW;
var(Display) float _CullDistanceSW;
var(Advanced) bool _bDontBatch;
var(Sound) float _TransientSoundPitch;
var(Movement) bool _bSmoothDesiredRot;
var(Movement) rotator _RotationalAcceleration;
var(Movement) float _fRotationalTightness;
var(Collision) bool _bAlignBottom;
var(Collision) bool _bAlignBottomAlways;
var(Actor) string _Label;
var(Editing) bool _bPauseWithSpecial;
var(Collision) bool _bBlocksCamera;
var(Display) bool _bUseSkinColorMod;
var(Display) Color _SkinColorModifier;
var(Animation) float _fDefaultAnimRate;
var(Animation) float _fDefaultTweenTime;
var(Animation) int _DefaultAnimChannel;
var(Reaction) class<Projectile> _vulnerableToClass;
var(Targeting) float _SizeModifier;
var(Targeting) vector _CentreOffset;
var(Targeting) float _GestureDistance;
var(Targeting) bool _bGestureFaceHorizOnly;
var(Targeting) bool _bMustClickToTarget;
var(GameState) string _ExcludeFromGameStates;
var(Opacity) bool _bChangeOpacityForCamera;
var(Opacity) float _DesiredOpacityForCamera;
var(Opacity) float _SpeedOpacityForCamera;
var(Opacity) float _CurrentOpacityForCamera;


event PreBeginPlay()
{
	fOrigTimeTillFadeOutBegins = fTimeTillFadeOutBegins;
	fOrigFadeOutTime = fFadeOutTime;
	
	if(bPickupLogicHandlesInventory)
	{
		InventoryTypes.Remove(0, InventoryTypes.Length);
	}
}

event PostBeginPlay()
{
	super.PostBeginPlay();
	
	U = GetUtils();
	
	HackVariables();
	
	if(!U.PercentChance(fSpawnChance))
	{
		Destroy();
		
		return;
	}
	
	if(bSpawnWithRandomRotation)
	{
		SetRotation(U.Rota(Rotation.Pitch, U.Rand16(), Rotation.Roll));
	}
	
	if(RandSkins.Length > 0)
	{
		Skins[0] = RandSkins[Rand(RandSkins.Length)];
	}
	
	if(bRotating)
	{
		SetPhysics(PHYS_Rotating);
	}
	
	InitEmitterType(true, 'Ambient');
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

function HackVariables()
{
	SetPropertyText("LumosType", string(_LumosType));
	SetPropertyText("MountAction", string(_MountAction));
	SetPropertyText("MaterialType", string(_MaterialType));
	SetPropertyText("bNoShadows", U.BoolToString(_bNoShadows));
	SetPropertyText("bHideOnDetailDrop", U.BoolToString(_bHideOnDetailDrop));
	SetPropertyText("AlphaSortLayer", string(_AlphaSortLayer));
	SetPropertyText("LODBiasSW", string(_LODBiasSW));
	SetPropertyText("CullDistanceSW", string(_CullDistanceSW));
	SetPropertyText("bDontBatch", U.BoolToString(_bDontBatch));
	SetPropertyText("TransientSoundPitch", string(_TransientSoundPitch));
	SetPropertyText("bSmoothDesiredRot", U.BoolToString(_bSmoothDesiredRot));
	SetPropertyText("RotationalAcceleration", string(_RotationalAcceleration));
	SetPropertyText("fRotationalTightness", string(_fRotationalTightness));
	SetPropertyText("bAlignBottom", U.BoolToString(_bAlignBottom));
	SetPropertyText("bAlignBottomAlways", U.BoolToString(_bAlignBottomAlways));
	SetPropertyText("Label", _Label);
	SetPropertyText("bPauseWithSpecial", U.BoolToString(_bPauseWithSpecial));
	SetPropertyText("bBlocksCamera", U.BoolToString(_bBlocksCamera));
	SetPropertyText("bUseSkinColorMod", U.BoolToString(_bUseSkinColorMod));
	SetPropertyText("SkinColorModifier", "(R=" $ string(_SkinColorModifier.R) $ ",G=" $ string(_SkinColorModifier.G) $ ",B=" $ string(_SkinColorModifier.B) $ ",A=" $ string(_SkinColorModifier.A) $ ")");
	SetPropertyText("fDefaultAnimRate", string(_fDefaultAnimRate));
	SetPropertyText("fDefaultTweenTime", string(_fDefaultTweenTime));
	SetPropertyText("DefaultAnimChannel", string(_DefaultAnimChannel));
	SetPropertyText("vulnerableToClass", string(_vulnerableToClass));
	SetPropertyText("SizeModifier", string(_SizeModifier));
	SetPropertyText("CentreOffset", string(_CentreOffset));
	SetPropertyText("GestureDistance", string(_GestureDistance));
	SetPropertyText("bGestureFaceHorizOnly", U.BoolToString(_bGestureFaceHorizOnly));
	SetPropertyText("bMustClickToTarget", U.BoolToString(_bMustClickToTarget));
	SetPropertyText("ExcludeFromGameStates", "(" $ _ExcludeFromGameStates $ ")");
	SetPropertyText("bChangeOpacityForCamera", U.BoolToString(_bChangeOpacityForCamera));
	SetPropertyText("DesiredOpacityForCamera", string(_DesiredOpacityForCamera));
	SetPropertyText("SpeedOpacityForCamera", string(_SpeedOpacityForCamera));
	SetPropertyText("CurrentOpacityForCamera", string(_CurrentOpacityForCamera));
}

function SetupTimer(float Delay, string cue)
{
	return;
}

event Timer()
{
	return;
}

static function StaticPrecache(LevelInfo L)
{
    return;
}

function InitEmitterType(bool B, name N) // Initializes an emitter type, or despawns it
{
	local Actor A;
	
	switch(N)
	{
		case 'Ambient':
			if(AmbientEmitter != none)
			{
				AmbientEmitter.Destroy();
			}
			
			if(B)
			{
				if(AmbientEmitterClass != none)
				{
					U.MFancySpawn(AmbientEmitterClass, (Location + PrePivot) + vAmbientEmitterOffset,, A);
					AmbientEmitter = Emitter(A);
					AmbientEmitter.SetOwner(self);
					AmbientEmitter.SetPhysics(PHYS_Trailer);
				}
			}
			
			break;
		case 'Pickup':
			if(PickupEmitter != none)
			{
				PickupEmitter.Destroy();
			}
			
			if(B)
			{
				if(PickupEmitterClass != none)
				{
					U.MFancySpawn(PickupEmitterClass, (Location + PrePivot) + vPickupEmitterOffset,, A);
					PickupEmitter = Emitter(A);
					PickupEmitter.SetOwner(self);
					PickupEmitter.SetPhysics(PHYS_Trailer);
				}
			}
			
			break;
		case 'Respawn':
			if(RespawnEmitter != none)
			{
				RespawnEmitter.Destroy();
			}
			
			if(B)
			{
				if(RespawnEmitterClass != none)
				{
					U.MFancySpawn(RespawnEmitterClass, (Location + PrePivot) + vRespawnEmitterOffset,, A);
					RespawnEmitter = Emitter(A);
					RespawnEmitter.SetOwner(self);
					RespawnEmitter.SetPhysics(PHYS_Trailer);
				}
			}
			
			break;
		default:
			break;
	}
}

event SetInitialState()
{
	if(bBounceIntoPlace)
	{
		GotoState('BounceIntoPlace');
	}
	else
	{
		super.SetInitialState();
	}
}

event Destroyed()
{
	InitEmitterType(false, 'Ambient');
	InitEmitterType(false, 'Pickup');
	InitEmitterType(false, 'Respawn');
}

function PrePickupLogic(Actor Other) // Fired to before inventory is managed
{
	return;
}

function PostPickupLogic(Actor Other) // Fired to after inventory is managed
{
	return;
}

function PickupItem(Actor Other) // Core logic for pickup being picked up. Do not modify unless you know what you're doing
{
	local int i;
	
	if(!ValidTouch(Other))
	{
		return;
	}
	
	bAcceptsProjectors = false;
	
	if(Other.IsA('KWPawn'))
	{
		KWPawn(Other).OnEvent('OnTouchPickup');
	}
	
	InitEmitterType(false, 'Ambient');
	InitEmitterType(true, 'Pickup');
	
	for(i = 0; i < iNumItems.Length; i++)
	{
		if(iNumItems[i].Max == 0)
		{
			iNumItems[i].Count = iNumItems[i].Min;
		}
		else
		{
			iNumItems[i].Count = U.RandRangeInt(iNumItems[i].Min, iNumItems[i].Max);
		}
	}
	
	if(Event != 'None')
	{
		TriggerEvent(Event, Other, Pawn(Other));
	}
	
	if(bRunPickupLogic)
	{
		PrePickupLogic(Other);
	}
	
	if(bOtherPawnsCanStealPickup)
	{
		HP = U.GetHP();
		
		if(Other == HP)
		{
			for(i = 0; i < InventoryTypes.Length; i++)
			{
				U.AddInventory(InventoryTypes[i], iNumItems[i].Count);
			}
		}
	}
	else
	{
		for(i = 0; i < InventoryTypes.Length; i++)
		{
			U.AddInventory(InventoryTypes[i], iNumItems[i].Count);
		}
	}
	
	U.PlayASound3D(self,, PickupSounds[Rand(PickupSounds.Length)], fPickupSoundVolume);
	
	if(bRunPickupLogic)
	{
		PostPickupLogic(Other);
	}
	
	if(fFadeOutTime <= 0.0 && fRespawnTime <= 0.0)
	{
		GotoState('WaitToDespawn');
	}
	else if(fFadeOutTime <= 0.0 && fRespawnTime > 0.0 && ((iRespawnLives > 0 && bUseLivesSystem) || !bUseLivesSystem))
	{
		GotoState('WaitToRespawn');
	}
	else
	{
		GotoState('WaitToFadeOut');
	}
}

function bool CanPickup() // Abstract function for determining whether this pickup can be picked up
{
	return false;
}

function bool ValidTouch(Actor Other) // Checks if the touching actor is valid for picking up the pickup
{
	if(Pawn(Other) == none || (!bAnyPawnCanPickup && !Pawn(Other).bCanPickupInventory) || (U.GetHealth(Pawn(Other)) <= 0.0 && bInvalidTouchIfDead) || (!FastTrace(Other.Location, Location) && bInvalidTouchIfTraceFail) || (!bAnyPawnCanPickup && U.GetHP() != Pawn(Other)) || (!ClassIsChildOf(Other.Class, PawnClassForPickup)))
	{
		return false;
	}
	
	return true;
}

function CheckTouching() // Checks to see if any pawns are currently touching the pickup (self) and updates that interaction
{
	local Pawn P;
	
	foreach TouchingActors(class'Pawn', P)
	{
		Touch(P);
	}
}

function ScalePickupWithDistance() // Scales the pickup based on the current player's camera distance
{
	local float fDistanceFromCamera;
	local int i, iNewVisibilityRadius;
	
	fDistanceFromCamera = VSize(U.GetCam().Location - Location);
	
	if(fDistanceFromCamera > fVisibilityRadius)
	{
		iNewVisibilityRadius = 0;
	}
	else
	{
		iNewVisibilityRadius = U.Ceiling(FClamp((fVisibilityRadius / fDistanceFromCamera) * 2.0, 0.0, 5.0));
	}
	
	bHidden = iNewVisibilityRadius <= 0;
	
	if(AmbientEmitter != none)
	{
		for(i = 0; i < AmbientEmitter.Emitters.Length; i++)
		{
			if(AmbientEmitter.Emitters[i] != none)
			{
				AmbientEmitter.Emitters[i].Disabled = bHidden;
			}
		}
	}
	
	SetDrawScale(default.DrawScale * float(iNewVisibilityRadius) * 0.2);
	
	if(bFadeWithDistance)
	{
		SetOpacity(float(iNewVisibilityRadius) * 0.2);
	}
}


auto state AwaitingPickup // The default state that handles base pickup logic
{
	event Tick(float DeltaTime)
	{
		super.Tick(DeltaTime);
		
		if(bScalePickupSizeWithDistance)
		{
			ScalePickupWithDistance();
		}
	}
	
	function bool CanPickup()
	{
		return true;
	}
	
	event Touch(Actor Other)
	{
		if(!bPickupOnUnTouchInstead && CanPickup())
		{
			PickupItem(Other);
		}
	}
	
	event UnTouch(Actor Other)
	{
		if(bPickupOnUnTouchInstead && CanPickup())
		{
			PickupItem(Other);
		}
	}
	
	Begin:
	
	CheckTouching();
}

state BounceIntoPlace extends AwaitingPickup // A state that makes the pickup temporarily bounce
{
	event BeginState()
	{
		bBounce = true;
		
		SetPhysics(PHYS_Falling);
	}
	
	event EndState()
	{
		bBounce = false;
		
		if(bRotating)
		{
			SetPhysics(PHYS_Rotating);
		}
	}
	
	function bool CanPickup()
	{
		return bCanBePickedUpWhileBouncing;
	}
	
	event Tick(float DeltaTime)
	{
		super.Tick(DeltaTime);
		
		if(fBounceIntoPlaceTimeout >= 0.0)
		{
			if(Velocity.Z == 0.0)
			{
				fBounceIntoPlaceTimeout -= DeltaTime;
			}
		}
		else
		{
			GotoState('AwaitingPickup');
		}
	}
	
	event HitWall(vector HitNormal, Actor Wall)
	{
		Velocity *= FClamp(fBounceDropoffMultiplier, -0.999999, 0.999999);
		Velocity = MirrorVectorByNormal(Velocity, HitNormal);
		
		if(fBounceIntoPlaceTimeout >= 0.0)
		{
			if(Abs(Velocity.Z) > 50.0)
			{
				if(BounceSounds.Length != 0)
				{
					U.PlayASound3D(self,, BounceSounds[Rand(BounceSounds.Length)], Abs(Velocity.Z) / 100.0, fBounceSoundRadius);
				}
			}
			else
			{
				Velocity.Z = 0.0;
			}
		}
	}
}

state WaitToFadeOut extends AwaitingPickup // A state that waits for the pickup to fade out, then checks to see if it needs to do anything else
{
	function bool CanPickup()
	{
		return false;
	}
	
	event Tick(float DeltaTime)
	{
		super.Tick(DeltaTime);
		
		if(fTimeTillFadeOutBegins > 0.0)
		{
			fTimeTillFadeOutBegins -= DeltaTime;
		}
		else if(fFadeOutTime > 0.0)
		{
			fFadeOutTime -= DeltaTime;
			
			SetOpacity(fFadeOutTime / fOrigFadeOutTime);
		}
		else if(fRespawnTime > 0.0 && ((iRespawnLives > 0 && bUseLivesSystem) || !bUseLivesSystem))
		{
			GotoState('WaitToRespawn');
		}
		else
		{
			GotoState('WaitToDespawn');
		}
	}
}

state WaitToFadeIn extends AwaitingPickup // The opposite of state WaitToFadeOut
{
	event BeginState()
	{
		SetOpacity(0.0);
		SetCollision(false, false, false);
		bAcceptsProjectors = true;
		
		if(fRespawnTime <= 0.0)
		{
			fTimeTillFadeOutBegins = fOrigTimeTillFadeOutBegins;
			fFadeOutTime = fOrigFadeOutTime;
		}
	}
	
	function bool CanPickup()
	{
		return false;
	}
	
	event Tick(float DeltaTime)
	{
		super.Tick(DeltaTime);
		
		if(fFadeOutTime < fOrigFadeOutTime)
		{
			fFadeOutTime += DeltaTime;
			
			SetOpacity(fFadeOutTime / fOrigFadeOutTime);
		}
		else
		{
			SetOpacity(1.0);
			SetCollision(true, false, false);
			
			InitEmitterType(true, 'Respawn');
			InitEmitterType(true, 'Ambient');
			
			GotoState('AwaitingPickup');
		}
	}
}

state WaitToRespawn extends AwaitingPickup // A state that causes the item to begin respawning. The pickup is not visible during this phase. Consider this phase a lull period
{
	event BeginState()
	{
		SetOpacity(0.0);
		SetCollision(false, false, false);
		
		if(bUseLivesSystem)
		{
			iRespawnLives--;
		}
	}
	
	event Tick(float DeltaTime)
	{
		return;
	}
	
	function bool CanPickup()
	{
		return false;
	}
	
	event Timer()
	{
		GotoState('WaitToFadeIn');
	}
	
	Begin:
	
	SetTimer(fRespawnTime, false);
}

state WaitToDespawn extends AwaitingPickup // The opposite of state WaitToRespawn
{
	event BeginState()
	{
		if(bForceNoFade)
		{
			bHidden = true;
		}
		
		SetOpacity(0.0);
		SetCollision(false, false, false);
	}
	
	event EndState()
	{
		if(bForceNoFade)
		{
			bHidden = false;
		}
	}
	
	event Tick(float DeltaTime)
	{
		return;
	}
	
	function bool CanPickup()
	{
		return false;
	}
	
	event Timer()
	{
		if(bDestroyAfterFadeOut)
		{
			Destroy();
		}
	}
	
	Begin:
	
	SetTimer(fDespawnDelay, false);
}


defaultproperties
{
	iNumItems(0)=(Min=1)
	fPickupSoundVolume=0.4
	fBounceIntoPlaceTimeout=2.0
	bRotating=true
	bInvalidTouchIfTraceFail=true
	bInvalidTouchIfDead=true
	fSpawnChance=1.0
	bScalePickupSizeWithDistance=true
	bDestroyAfterFadeOut=true
	fVisibilityRadius=2048.0
	bCanBePickedUpWhileBouncing=true
	PawnClassForPickup=class'Pawn'
	iRespawnLives=1
	fBounceDropoffMultiplier=0.5
	fDespawnDelay=3.0
	fBounceSoundRadius=64.0
	bSpawnWithRandomRotation=true
	bRunPickupLogic=true
	DrawType=DT_StaticMesh
	AmbientGlow=254
	bOrientOnSlope=true
	bAlwaysRelevant=true
	bOnlyDirtyReplication=true
	NetUpdateFrequency=8.0
	NetPriority=1.4
	Texture=Texture'S_Inventory'
	bShouldBaseAtStartup=true
	bCollideActors=true
	bCollideWorld=true
	bUseCylinderCollision=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=15000,Roll=0)
	DesiredRotation=(Pitch=0,Yaw=30000,Roll=0)
	bHidden=false
	bLightingVisibility=true
	bUseDynamicLights=true
	bAcceptsProjectors=true
	bReplicateMovement=true
	RemoteRole=ROLE_DumbProxy
	Role=ROLE_Authority
	LODBias=1.0
	_LODBiasSW=1.0
	DrawScale=1.0
	DrawScale3D=(X=1.0,Y=1.0,Z=1.0)
	MaxLights=4
	ScaleGlow=1.0
	Style=STY_Normal
	bMovable=true
	SoundRadius=64.0
	SoundVolume=128
	SoundPitch=64
	TransientSoundVolume=0.30
	TransientSoundRadius=300.0
	_TransientSoundPitch=1.0
	bBlockZeroExtentTraces=true
	bBlockNonZeroExtentTraces=true
	bJustTeleported=true
	_RotationalAcceleration=(Pitch=200000,Yaw=200000,Roll=200000)
	_fRotationalTightness=5.0
	Mass=100.0
	MessageClass=class'LocalMessage'
	_bAlignBottom=true
	_bPauseWithSpecial=true
	_SkinColorModifier=(R=128,G=128,B=128,A=255)
	_fDefaultAnimRate=1.0
	_SizeModifier=1.0
	_CentreOffset=(X=0.0,Y=0.0,Z=10.0)
	_GestureDistance=1.0
	_DesiredOpacityForCamera=0.50
	_SpeedOpacityForCamera=1.0
	_CurrentOpacityForCamera=1.0
}