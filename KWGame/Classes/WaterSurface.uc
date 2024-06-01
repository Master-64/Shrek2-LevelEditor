//================================================================================
// WaterSurface.
//================================================================================

class WaterSurface extends Volume;

var(Actor) KWGame.ELumosType LumosType;
var(Advanced) KWGame.EMountAction MountAction;
var(Advanced) KWGame.EMaterialType MaterialType;
var(Lighting) bool bNoShadows;
var(Advanced) bool bHideOnDetailDrop;
var(Display) int AlphaSortLayer;
var(Display) float LODBiasSW;
var(Display) float CullDistanceSW;
var(Advanced) bool bDontBatch;
var(Sound) float TransientSoundPitch;
var(Collision) const float CollisionWidth;
var(Collision) KWGame.ECollideType CollideType;
var(Movement) bool bSmoothDesiredRot;
var(Movement) Rotator RotationalAcceleration;
var(Movement) float fRotationalTightness;
var(Collision) bool bAlignBottom;
var(Collision) bool bAlignBottomAlways;
var(Actor) string Label;
var(Editing) bool bPauseWithSpecial;
var(Collision) bool bBlocksCamera;
var(Display) bool bUseSkinColorMod;
var(Display) Color SkinColorModifier;
var(Animation) float fDefaultAnimRate;
var(Animation) float fDefaultTweenTime;
var(Animation) int DefaultAnimChannel;
var(Reaction) Class<Projectile> vulnerableToClass;
var(Targeting) float SizeModifier;
var(Targeting) Vector CentreOffset;
var(Targeting) float GestureDistance;
var(Targeting) bool bGestureFaceHorizOnly;
var(Targeting) bool bMustClickToTarget;
var(GameState) array<string> ExcludeFromGameStates;
var(Opacity) bool bChangeOpacityForCamera;
var(Opacity) float DesiredOpacityForCamera;
var(Opacity) float SpeedOpacityForCamera;
var(Opacity) float CurrentOpacityForCamera;

defaultproperties
{
     bLightingVisibility=True
     bUseDynamicLights=True
     bAcceptsProjectors=True
     bReplicateMovement=True
     Role=ROLE_Authority
     NetUpdateFrequency=100.00
     LODBias=1.00
     LODBiasSW=1.00
     DrawScale=1.00
     DrawScale3D=(X=1.00,Y=1.00,Z=1.00),
     MaxLights=4
     ScaleGlow=1.00
     Style=STY_Normal
     bMovable=True
     SoundRadius=64.00
     SoundVolume=128
     SoundPitch=64
     TransientSoundVolume=0.30
     TransientSoundRadius=300.00
     TransientSoundPitch=1.00
     bBlockZeroExtentTraces=True
     bBlockNonZeroExtentTraces=True
     bJustTeleported=True
     RotationalAcceleration=(Pitch=200000,Yaw=200000,Roll=200000),
     fRotationalTightness=5.00
     Mass=100.00
     MessageClass=Class'LocalMessage'
     bAlignBottom=True
     bPauseWithSpecial=True
     SkinColorModifier=(R=128,G=128,B=128,A=255),
     fDefaultAnimRate=1.00
     SizeModifier=1.00
     CentreOffset=(X=0.00,Y=0.00,Z=10.00),
     GestureDistance=1.00
     DesiredOpacityForCamera=0.50
     SpeedOpacityForCamera=1.00
     CurrentOpacityForCamera=1.00
}
