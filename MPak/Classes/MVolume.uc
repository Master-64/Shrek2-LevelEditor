// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// Categorizes all of the Volumes


class MVolume extends Volume
	Config(MPak);


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


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	U = GetUtils();
	
	HackVariables();
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


defaultproperties
{
	bStatic=false
	bSkipActorPropertyReplication=true
	bCollideActors=true
	bLightingVisibility=true
	bUseDynamicLights=true
	bAcceptsProjectors=true
	bReplicateMovement=true
	RemoteRole=ROLE_DumbProxy
	Role=ROLE_Authority
	NetUpdateFrequency=100.0
	NetPriority=1.0
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