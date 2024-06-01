//================================================================================
// RibbonEmitter.
//================================================================================

class RibbonEmitter extends ParticleEmitter
    editinlinenew;

enum EGetPointAxis
{
    PAXIS_OwnerX,
    PAXIS_OwnerY,
    PAXIS_OwnerZ,
    PAXIS_BoneNormal,
    PAXIS_StartBoneDirection,
    PAXIS_AxisNormal
};

struct RibbonPoint
{
    var() Vector Location;
    var() Vector AxisNormal;
    var() float Width;
};

var(Ribbon) float SampleRate;
var(Ribbon) float DecayRate;
var(Ribbon) int NumPoints;
var(Ribbon) float RibbonWidth;
var(Ribbon) RibbonEmitter.EGetPointAxis GetPointAxisFrom;
var(Ribbon) Vector AxisNormal;
var(Ribbon) float MinSampleDist;
var(Ribbon) float MinSampleDot;
var(Ribbon) float PointOriginOffset;
var(RibbonTexture) float RibbonTextureUScale;
var(RibbonTexture) float RibbonTextureVScale;
var(RibbonSheets) int NumSheets;
var(RibbonSheets) array<float> SheetScale;
var(RibbonBones) Vector StartBoneOffset;
var(RibbonBones) Vector EndBoneOffset;
var(RibbonBones) name BoneNameStart;
var(RibbonBones) name BoneNameEnd;
var(Ribbon) array<RibbonPoint> RibbonPoints;
var(Ribbon) bool bSamplePoints;
var(Ribbon) bool bDecayPoints;
var(Ribbon) bool bDecayPointsWhenStopped;
var(Ribbon) bool bSyncDecayWhenKilled;
var(RibbonTexture) bool bLengthBasedTextureU;
var(RibbonSheets) bool bUseSheetScale;
var(RibbonBones) bool bUseBones;
var(RibbonBones) bool bUseBoneDistance;
var transient float SampleTimer;
var transient float DecayTimer;
var transient float RealSampleRate;
var transient float RealDecayRate;
var transient int SheetsUsed;
var transient RibbonPoint LastSampledPoint;
var transient bool bKilled;
var transient bool bDecaying;

defaultproperties
{
    SampleRate=0.05
    NumPoints=20
    RibbonWidth=20
    GetPointAxisFrom=5
    AxisNormal=(X=0,Y=0,Z=1)
    MinSampleDist=1
    MinSampleDot=0.995
    PointOriginOffset=0.5
    RibbonTextureUScale=1
    RibbonTextureVScale=1
    bSamplePoints=true
    bDecayPoints=true
    MaxParticles=1
    UseRegularSizeScale=false
    StartSizeRange=(X=(Min=1,Max=1),Y=(Min=1,Max=1),Z=(Min=1,Max=1))
    InitialParticlesPerSecond=10000
    AutomaticInitialSpawning=false
}