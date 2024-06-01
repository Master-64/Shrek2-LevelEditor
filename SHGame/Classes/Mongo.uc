//================================================================================
// Mongo.
//================================================================================

class Mongo extends ShHeroPawn
  Config(User);

var() array<name> CrumpBones;
var() Class<Emitter> CrumpEmitter;
var() array<Material> SkinsArray;
var() Material ShrekSkinInv;
var() array<Sound> Throw2Sounds;
var() array<Sound> KickSounds;
var() array<Sound> FakeKickSounds;
var GenericColObj LeftFistColObj;
var GenericColObj RightFistColObj;
var() name LeftFistBone;
var() name RightFistBone;
var() name KickAnimName;
var bool L;
var bool R;

function AttachGenericColObjs()
{
}

function AttachCitizenCollision()
{
}

function AddAnimNotifys()
{
}

function bool CanUsePotion()
{
}

function PlayFootStepsSound()
{
}

function PlayerThrowCarryingActor()
{
}

function AnimNotifyObjectPickup()
{
}

function PlayGroundShakeSound()
{
}

function ShakeTheGround()
{
}

function SayHitKarmaBumpLine()
{
}

function HitSomebody(int hitdamage, array<Sound> SoundArray, name animseq, float AnimFrame)
{
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
}

function ResetSkinUp()
{
}

function GoToStateKnock(bool forward)
{
}

function bool IsAttacking()
{
}

function DoSomeAction()
{
}

function DropACrump()
{
}

function ColObjTouch(Actor Other, GenericColObj ColObj)
{
}

event bool Mount(Vector Delta, Actor A)
{
}

function bool DoJump(bool bUpdating)
{
}

function DoDoubleJump(bool bUpdating)
{
}

function bool MovingForward()
{
}

function Bump(Actor Other)
{
}

defaultproperties
{
     CrumpBones(0)=body_l_thigh_joint
     CrumpBones(1)=body_r_thigh_joint
     CrumpBones(2)=body_l_wrist_joint
     CrumpBones(3)=body_r_wrist_joint
     CrumpBones(4)=body_spine2_joint
     CrumpEmitter=Class'SHGame.Cookie_Bits'
     SkinsArray(0)=Texture'ShCharacters.mongo_tx'
     SkinsArray(1)=Texture'ShCharacters.mongo2_tx'
     SkinsArray(2)=Texture'ShCharacters.mongo3_tx'
     SkinsArray(3)=Texture'ShCharacters.mongo4_tx'
     SkinsArray(4)=Texture'ShCharacters.mongo5_tx'
     ShrekSkinInv=Texture'ShCharacters.minus_handsome_tx'
     Throw2Sounds(0)=Sound'Mongo.throw_01'
     Throw2Sounds(1)=Sound'Mongo.throw_02'
     KickSounds(0)=Sound'Mongo.kick_01'
     KickSounds(1)=Sound'Mongo.kick_02'
     LeftFistBone="body_l_wrist_joint"
     RightFistBone="body_r_wrist_joint"
     KickAnimName="kickright"
     SHHeroName="Mongo"
     EndAttackAnim3="punch3end"
     PreStartAttackAnim1="None"
     SwingSounds(0)=Sound'Mongo.attack_01'
     SwingSounds(1)=Sound'Mongo.attack_02'
     Attack1Sounds(0)=Sound'The_Seige.building_smash01'
     Attack1Sounds(1)=Sound'The_Seige.building_smash02'
     Attack1Sounds(2)=Sound'The_Seige.building_smash03'
     Attack1Sounds(3)=Sound'The_Seige.building_smash04'
     Attack1Sounds(4)=Sound'The_Seige.building_smash05'
     Attack1Sounds(5)=Sound'The_Seige.building_smash06'
     Attack1Sounds(6)=Sound'The_Seige.building_smash07'
     Attack1Sounds(7)=Sound'The_Seige.building_smash08'
     Attack1Sounds(8)=Sound'The_Seige.building_smash09'
     Attack2Sounds(0)=Sound'The_Seige.building_smash01'
     Attack2Sounds(1)=Sound'The_Seige.building_smash02'
     Attack2Sounds(2)=Sound'The_Seige.building_smash03'
     Attack2Sounds(3)=Sound'The_Seige.building_smash04'
     Attack2Sounds(4)=Sound'The_Seige.building_smash05'
     Attack2Sounds(5)=Sound'The_Seige.building_smash06'
     Attack2Sounds(6)=Sound'The_Seige.building_smash07'
     Attack2Sounds(7)=Sound'The_Seige.building_smash08'
     Attack2Sounds(8)=Sound'The_Seige.building_smash09'
     Attack3Sounds(0)=Sound'The_Seige.building_smash01'
     Attack3Sounds(1)=Sound'The_Seige.building_smash02'
     Attack3Sounds(2)=Sound'The_Seige.building_smash03'
     Attack3Sounds(3)=Sound'The_Seige.building_smash04'
     Attack3Sounds(4)=Sound'The_Seige.building_smash05'
     Attack3Sounds(5)=Sound'The_Seige.building_smash06'
     Attack3Sounds(6)=Sound'The_Seige.building_smash07'
     Attack3Sounds(7)=Sound'The_Seige.building_smash08'
     Attack3Sounds(8)=Sound'The_Seige.building_smash09'
     FrontLeftBone="body_l_hoof_joint"
     FrontRightBone="body_r_hoof_joint"
     BackLeftBone="body_l_foot_joint"
     BackRightBone="body_r_foot_joint"
     KnockBackDistance=30.000000
     DyingBumpLines="GGM_MongoDie"
     AttackDist=100.000000
     AttackHeight=100.000000
     AttackAngle=40.000000
     PickupAnimNames(0)="pickup2"
     ThrowAnimNames(0)="throw2"
     CarryIdleAnimNames(0)="carry_idle2"
     CarryTurnRightAnims(0)="carry_turnright2"
     CarryTurnLeftAnims(0)="carry_turnleft2"
     CarryForwardAnimNames(0)="carry2"
     CarryBackwardAnimNames(0)="carrybackwards2"
     CarryStrafeLeftAnimNames(0)="carrystafeleft2"
     CarryStrafeRightAnimNames(0)="carrystaferight2"
     CameraSetStandard=(vLookAtOffset=(X=-200,Y=20,Z=250),fLookAtDistance=600,fLookAtHeight=400,fRotTightness=8,fRotSpeed=8,fMoveTightness=(X=25,Y=40,Z=40),fMoveSpeed=0,fMaxMouseDeltaX=190,fMaxMouseDeltaY=65,fMinPitch=-10000,fMaxPitch=10000)
     CameraSnapRotationPitch=-2500.000000
     DefaultPlayerControllerClass=Class'SHGame.ShrekController'
     WalkAnims(1)="walkbackwards"
     CarryTurnRightAnim="carry_turnright"
     CarryTurnLeftAnim="carry_turnleft"
     BigClimbOffset=50.000000
     JumpToHangAnim="jumptoclimb"
     RunAnimName="Walk"
     WalkAnimName="Walk"
     CarryIdleAnimName="carry_idle"
     CarryBackwardAnimName="carrybackwards"
     PickupAnimName="Pickup"
     ThrowAnimName="throw"
     PickupBoneName="body_object_joint"
     LeftUpperLidBone="body_l_topeyelid_joint"
     LeftLowerLidBone="body_l_bottomeyelid_joint"
     RightUpperLidBone="body_r_topeyelid_joint"
     RightLowerLidBone="body_r_bottomeyelid_joint"
     bCanBlink=False
     FootstepsStone(0)=Sound'Footsteps.F_GGM_default01'
     FootstepsStone(1)=Sound'Footsteps.F_GGM_default01'
     FootstepsStone(2)=Sound'Footsteps.F_GGM_default01'
     FootstepsStone(3)=Sound'Footsteps.F_GGM_default01'
     FootstepsStone(4)=Sound'Footsteps.F_GGM_default01'
     FootstepsStone(5)=Sound'Footsteps.F_GGM_default01'
     FootstepsWood(0)=Sound'Footsteps.F_GGM_default01'
     FootstepsWood(1)=Sound'Footsteps.F_GGM_default01'
     FootstepsWood(2)=Sound'Footsteps.F_GGM_default01'
     FootstepsWood(3)=Sound'Footsteps.F_GGM_default01'
     FootstepsWood(4)=Sound'Footsteps.F_GGM_default01'
     FootstepsWood(5)=Sound'Footsteps.F_GGM_default01'
     FootstepsGrass(0)=Sound'Footsteps.F_GGM_default01'
     FootstepsGrass(1)=Sound'Footsteps.F_GGM_default01'
     FootstepsGrass(2)=Sound'Footsteps.F_GGM_default01'
     FootstepsGrass(3)=Sound'Footsteps.F_GGM_default01'
     FootstepsGrass(4)=Sound'Footsteps.F_GGM_default01'
     FootstepsGrass(5)=Sound'Footsteps.F_GGM_default01'
     FootstepsDirt(0)=Sound'Footsteps.F_GGM_default01'
     FootstepsDirt(1)=Sound'Footsteps.F_GGM_default01'
     FootstepsDirt(2)=Sound'Footsteps.F_GGM_default01'
     FootstepsDirt(3)=Sound'Footsteps.F_GGM_default01'
     FootstepsDirt(4)=Sound'Footsteps.F_GGM_default01'
     FootstepsDirt(5)=Sound'Footsteps.F_GGM_default01'
     FootstepsNone(0)=Sound'Footsteps.F_GGM_default01'
     FootstepsNone(1)=Sound'Footsteps.F_GGM_default01'
     FootstepsNone(2)=Sound'Footsteps.F_GGM_default01'
     FootstepsNone(3)=Sound'Footsteps.F_GGM_default01'
     FootstepsNone(4)=Sound'Footsteps.F_GGM_default01'
     FootstepsNone(5)=Sound'Footsteps.F_GGM_default01'
     FootFramesWalk(0)=12
     FootFramesWalk(1)=32
     FootFramesWalk(2)=52
     FootFramesWalk(3)=72
     FootFramesRun(0)=12
     FootFramesRun(1)=32
     FootFramesRun(2)=52
     FootFramesRun(3)=72
     IdleAnims(0)="Idle"
     IdleAnims(1)="Idle"
     IdleAnims(2)="Idle"
     IdleAnims(3)="Idle"
     IdleAnims(4)="Idle"
     IdleAnims(5)="Idle"
     IdleAnims(6)="Idle"
     IdleAnims(7)="Idle"
	 bIsMainPlayer=True
     ControllerClass=Class'SHGame.SHCompanionController'
     MovementAnims(0)="Walk"
     MovementAnims(1)="walkbackwards"
     MovementAnims(2)="walkleft"
     MovementAnims(3)="walkright"
     TurnLeftAnim="TurnLeft"
     TurnRightAnim="TurnRight"
     Mesh=SkeletalMesh'ShrekCharacters.Mongo'
     CollisionRadius=150.000000
     CollisionHeight=300.000000
	 Label="Mongo"
}
