//================================================================================
// Squirrel.
//================================================================================

class Squirrel extends TreeThrowObject;

var() name ThrowAnimName;
var() name landForwardAnimName;
var() name landBackwardAnimName;
var() name RunAnimName;
var Rotator randOwnerRot;
var float randYaw;
var Vector vDir;
var() array<Sound> squeekSfx;
var() float randSqueekTime;
var float randSqueekCounter;
var Vector squirrelRunDir;
var Vector squirrelLeft;

function Landed(Vector HitNormal)
{
}

function KWGame.EMaterialType TraceMaterial(Vector Start, float deltaZ, optional out Vector HitLoc, optional out Vector HitNorm)
{
}

function bool NoGround()
{
}

function GetBumpSets()
{
}

function Bump(Actor Other)
{
}

function Touch(Actor Other)
{
}

function PlayRandomSqueek()
{
}

function SetRandTime()
{
}

defaultproperties
{
     ThrowAnimName="flail"
     landForwardAnimName="tumble_front"
     landBackwardAnimName="tumble_back"
     RunAnimName="run"
     squeekSfx(0)=Sound'Enviroment.squirrel_01'
     squeekSfx(1)=Sound'Enviroment.squirrel_02'
     DamageRadius=0.000000
     DamageAmount=2
     Mesh=SkeletalMesh'EnvAnims.Squirrel'
     bCollideActors=True
     RotationRate=(Yaw=49152)
}
