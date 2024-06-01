//================================================================================
// WheelStealer.
//================================================================================

class WheelStealer extends SHCharacter
  Config(User);

var() string LoadString;
var() array<Material> RandSkins;
var Vector vHome;
var name GroupName;
var float HeroEscapeDistance;
var Vector standingSpot;
var bool bHasWheel;
var Actor speakingDonkey;
var float DialogLength;
var float TimeElapsed;
var(sounds) array<Sound> sfxWheelToss;
var(sounds) array<Sound> sfxWheelCatch;
var(sounds) array<Sound> sfxOuch;
var(sounds) array<Sound> sfxFaint;

function AddAnimNotifys()
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function stepback(float Amount, float Time)
{
}

function CatchWheel()
{
}

function ThrowWheel()
{
}

function PlayIdleAnim()
{
}

function PlayRunWithWheel()
{
}

function PlayHopAnim()
{
}

function PlayCasualHopAnim()
{
}

function PlayTossAnim()
{
}

function PlayCatchAnim()
{
}

function PlayKnockBackOne()
{
}

function PlayKnockBackTwo()
{
}

function PlayBlockOne()
{
}

function PlayBlockTwo()
{
}

function PlayFaintAnim()
{
}

function PlayJumpBackAnim()
{
}

function BlendInAnimation(optional float tween)
{
}

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function BlendOutAnimation(optional float tween)
{
}

defaultproperties
{
     LoadString="ShrekCharacters.WheelBandit"
     RandSkins(0)=Texture'ShCharacters.wheelbandit'
     RandSkins(1)=Texture'ShCharacters.wheelbandit2'
     RandSkins(2)=Texture'ShCharacters.wheelbandit3'
     RandSkins(3)=Texture'ShCharacters.wheelbandit4'
     RandSkins(4)=Texture'ShCharacters.wheelbandit5'
     bCouldBeAttacked=True
     bRequireFightIdle=True
     bUseBlobShadow=True
     WalkAnims(0)="run"
     WalkAnims(1)="run"
     WalkAnims(2)="run"
     WalkAnims(3)="run"
     GroundRunSpeed=450.000000
     GroundWalkSpeed=450.000000
     FootstepsStone(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsStone(1)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsStone(2)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsStone(3)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWood(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWood(1)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWood(2)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWood(3)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWet(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWet(1)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWet(2)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsWet(3)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsGrass(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsGrass(1)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsGrass(2)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsGrass(3)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsDirt(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsDirt(1)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsDirt(2)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsDirt(3)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsMud(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsMud(1)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsMud(2)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsMud(3)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsNone(0)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsNone(1)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsNone(2)=Sound'Footsteps.f_bandit_dirt01'
     FootstepsNone(3)=Sound'Footsteps.f_bandit_dirt01'
     GroundSpeed=450.000000
     Health=1
     ControllerClass=Class'SHGame.WheelStealerController'
     BaseMovementRate=440.000000
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     bActorShadows=True
     Mesh=SkeletalMesh'ShrekCharacters.wheelbandit'
     DrawScale=1.300000
     CollisionRadius=20.000000
     CollisionHeight=40.000000
     RotationRate=(Yaw=52768)
}
