//================================================================================
// HardwareShader.
//================================================================================

class HardwareShader extends RenderedMaterial
    collapsecategories
    hidecategories(Object);

enum SConstant
{
    EVC_Unused,
    EVC_MaterialDefined,
    EVC_ViewProjMatrix,
    EVC_WorldViewProjMatrix,
    EVC_WorldMatrix,
    EVC_InvViewMatrix,
    EVC_ViewMatrix,
    EVC_InvWorldMatrix,
    EVC_Time,
    EVC_CosTime,
    EVC_SinTime,
    EVC_TanTime,
    EVC_Eye,
    EVC_XYCircle,
    EVC_NearestLightPos1,
    EVC_InvLightRadius1,
    EVC_NearestLightPos2,
    EVC_InvLightRadius2,
    EVC_LightColor1,
    EVC_LightColor2,
    EVC_Max
};

struct SConstantsInfo
{
    var() HardwareShader.SConstant type;
    var() Plane Value;
};

var() SConstantsInfo VSConstants[200];
var() string VertexShaderText[4];
var() array<int> StreamMapping;
var() SConstantsInfo PSConstants[32];
var() string PixelShaderText[4];
var() Texture Textures[32];
var const transient int PixelShader[4];
var const transient int VertexShader[4];
var() int NumPasses;
var() int AlphaBlending[4];
var() int AlphaTest[4];
var() byte AlphaRef[4];
var() int ZTest[4];
var() int ZWrite[4];
var() byte SrcBlend[16];
var() byte DestBlend[16];

defaultproperties
{
    NumPasses=1
}