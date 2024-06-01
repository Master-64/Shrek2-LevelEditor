//================================================================================
// JumpingMushroom.
//================================================================================

class JumpingMushroom extends SHBounceSheet
  Config(User);

var() float shaketime;
var() float GreenColorTime;
var() array<name> nextMushroomTag;
var array<JumpingMushroom> nextMushroom;
var() bool bFirstMushroom;
var() float HeroReactDistance;
var() float HeroEscapeDistance;
var() Vector DoneJumpingDrawScale;
var() float DoneJumpingCollisionHeight;
var() float DoneJumpingCollisionRadius;
var() bool bHasPrize;
var() KWPickup jumpingPickup;
var() name IdleOne;
var() name IdleTwo;
var() name IdleThree;
var() name ShakeAnimName;
var() Material NormalSkin;
var() Material ColorRedSkin;
var() Material ColorGreenSkin;
var int mushroomCounter;
var Actor savedOther;
var JumpingMushroomLanding landingSpot;
var JumpingMushroomTopCollision topCollision;
var(sounds) array<Sound> sfxPop;

function RespondToTouch(Actor Other)
{
}

function PlayWithPickup()
{
}

function RestoreSkin()
{
}

function SetGreenColorSkin()
{
}

function SetRedColorSkin()
{
}

defaultproperties
{
     shaketime=1.000000
     GreenColorTime=4.000000
     HeroReactDistance=1600.000000
     HeroEscapeDistance=3000.000000
     DoneJumpingDrawScale=(X=8.380000,Y=5.380000,Z=8.380000)
     DoneJumpingCollisionHeight=35.000000
     DoneJumpingCollisionRadius=150.000000
     IdleOne="Idle1"
     IdleTwo="Idle2"
     IdleThree="Idle3"
     ShakeAnimName="anticipation"
     NormalSkin=Texture'EnvAnimsTx.Mushroom_new_purple'
     ColorRedSkin=Texture'EnvAnimsTx.Mushroom_new_red'
     ColorGreenSkin=Texture'EnvAnimsTx.Mushroom_new_green'
     BounceSound=Sound'items.boing_lily'
     IdleAnim="Idle1"
     BounceAnim="burst"
     ControllerClass=Class'SHGame.JumpingMushroomController'
     MovementAnims(0)="Static"
     MovementAnims(1)="Static"
     MovementAnims(2)="Static"
     MovementAnims(3)="Static"
     TurnLeftAnim="Static"
     TurnRightAnim="Static"
     Mesh=SkeletalMesh'EnvAnims.mushroom_new'
     DrawScale3D=(X=5.380000,Y=9.380000,Z=5.380000)
     CollisionRadius=20.000000
     CollisionHeight=65.000000
	 CollideType=CT_Cylinder
}
