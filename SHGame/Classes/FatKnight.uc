//================================================================================
// FatKnight.
//================================================================================

class FatKnight extends EnemyBoss
  Config(User);

var() array<Sound> sfxFootsteps;
var() array<Sound> sfxBlock;
var() array<Sound> sfxSkirtFall;

function AddAnimNotifys()
{
}

function NotifyAttackSwoosh()
{
}

function NotifySwordHitGround()
{
}

function NotifyFootsteps()
{
}

function AttachSkirt()
{
}

function DetachSkirt()
{
}

function DestroySkirt()
{
}

function int GetKnightType()
{
}

function bool CanBeDamaged()
{
}

defaultproperties
{
     PatrolAnimName="patrol"
     RecoverAnimName="recover"
     KnockoutAnimName="knockout"
     DefeatAnimName="finaldeath"
     DefeatRunAnimName="finaldeathrun"
     BlockCenterAnimName="blockcenter"
     BlockCenterBumpAnimName="BlockCenterBump"
     BlockLeftAnimName="blockleft"
     BlockLeftBumpAnimName="BlockLeftBump"
     BlockRightAnimName="blockright"
     BlockRightBumpAnimName="BlockRightBump"
     BlockTopAnimName="blocktop"
     BlockTopBumpAnimName="BlockTopBump"
     HUDType=2
     DamageInfo(0)=(AnimName="attack1",StartFrame=6,EndFrame=23)
     DamageInfo(1)=(AnimName="attack2",StartFrame=6,EndFrame=37)
     DamageAmount=30.000000
     PitchMin=1.000000
     PitchMax=1.000000
     sfxWeaponSwoosh(0)=Sound'Knights.fatknight_swipe01'
     sfxWeaponSwoosh(1)=Sound'Knights.fatknight_swipe02'
     sfxWeaponSwoosh(2)=Sound'Peasants.action_swoosh03'
     sfxWeaponSwoosh(3)=Sound'Peasants.action_swoosh04'
     sfxWeaponSwoosh(4)=Sound'Peasants.action_swoosh05'
     sfxWeaponSwoosh(5)=Sound'Peasants.action_swoosh06'
     sfxWeaponSwoosh(6)=Sound'Peasants.action_swoosh07'
     sfxWeaponSwoosh(7)=Sound'Peasants.action_swoosh08'
     sfxWeaponSwoosh(8)=Sound'Peasants.action_swoosh09'
     sfxWeaponSwoosh(9)=Sound'Peasants.action_swoosh10'
     sfxWeaponSwoosh(10)=Sound'Peasants.action_swoosh11'
     sfxWeaponSwoosh(11)=Sound'Peasants.action_swoosh12'
     sfxWeaponSwoosh(12)=Sound'Peasants.action_swoosh13'
     sfxAttackConnect(0)=Sound'Knights.fatknight_swordhit'
     sfxAttackConnect(1)=Sound'Peasants.Peasant_punch02'
     sfxAttackConnect(2)=Sound'Peasants.Peasant_punch03'
     sfxAttackConnect(3)=Sound'Peasants.Peasant_punch04'
     sfxAttackConnect(4)=Sound'Peasants.Peasant_punch05'
     sfxAttackConnect(5)=Sound'Peasants.Peasant_punch06'
     sfxAttackConnect(6)=Sound'Peasants.Peasant_punch07'
     CombatIdleAnimName="fightidle"
     CombatWalkAnimName="Walk"
     AttackAnimName(0)="attack1"
     AttackAnimName(1)="attack2"
     CasualIdleAnimName="fightidle"
     NoticeAnimName="alert"
     AttackInfo(0)=(AnimName="attack1",StartBoneName="body_sword_joint",EndBoneName="body_swordtip_joint",StartFrame=27.5,EndFrame=30)
     AttackInfo(1)=(AnimName="attack2",StartBoneName="body_sword_joint",EndBoneName="body_swordtip_joint",StartFrame=38.8,EndFrame=40.11)
     WalkAnims(0)="patrol"
     WalkAnims(1)="patrol"
     WalkAnims(2)="patrol"
     WalkAnims(3)="patrol"
     TakeoffAnims(0)="fightidle"
     TakeoffAnims(1)="fightidle"
     TakeoffAnims(2)="fightidle"
     TakeoffAnims(3)="fightidle"
     LandAnims(0)="fightidle"
     LandAnims(1)="fightidle"
     AirStillAnim="fightidle"
     TakeoffStillAnim="fightidle"
     IdleWeaponAnim="fightidle"
     IdleAnimName="fightidle"
     WalkAnimName="patrol"
     Health=50
     MovementAnims(0)="run"
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     TurnLeftAnim="fightidle"
     TurnRightAnim="fightidle"
     CollisionRadius=40.000000
}
