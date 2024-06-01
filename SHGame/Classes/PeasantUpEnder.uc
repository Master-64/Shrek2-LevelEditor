//================================================================================
// PeasantUpEnder.
//================================================================================

class PeasantUpEnder extends PeasantTough
  Config(User);

function PlayBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function LoopBlendedAnim(name anim, optional float rate, optional float tween)
{
}

function GetBumpSets()
{
}

defaultproperties
{
     DamageAmount=10.000000
     AttackDistance=35.000000
     sfxWeaponSwoosh(0)=Sound'Peasants.torch_swoosh01'
     sfxWeaponSwoosh(1)=Sound'Peasants.torch_swoosh02'
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
     CombatIdleAnimName="torchcombatidle"
     CombatWalkAnimName="torchwalk"
     AttackAnimName(0)="torchswipe"
     AttackAnimName(1)="torchswipe"
     FaintAnimName="torchfaint"
     CasualIdleAnimName="torchidle"
     CasualWalkAnimName="torchcasualwalk"
     LookAroundAnimName="torchlookaround"
     FlyBackAnimName="torchflyback"
     SpecialFaintAnimName="torchspecialfaint"
     NoticeAnimName="torchenemyaware"
     ShrunkAnimName="torchlookaround"
     LoveTransAnimName="torchlovetrans"
     LoveIdleAnimName="torchloveidle"
     LoveWalkAnimName="torchloverun"
     sleepBeginAnimName="torchnightynight_start"
     sleepLoopAnimName="torchnightynight_loop"
     sleepEndAnimName="torchnightynight_end"
     WhereAnimName="torchinvisible_react"
     stinkBeginAnimName="torchstinky_start"
     stinkLoopAnimName="torchstinky_loop"
     stinkEndAnimName="torchstinky_end"
     AttackInfo(0)=(AnimName="torchswipe",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_torchtip_joint",StartFrame=12,EndFrame=15)
     AttackInfo(1)=(AnimName="torchswipe",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_torchtip_joint",StartFrame=12,EndFrame=15)
     WalkAnims(0)="torchcasualwalk"
     WalkAnims(1)="torchcasualwalk"
     WalkAnims(2)="torchcasualwalk"
     WalkAnims(3)="torchcasualwalk"
     IdleAnimName="torchcasualidle"
     RunAnimName="torchattackwalk"
     WalkAnimName="torchcasualwalk"
     KnockBackAnimName="torchknockback"
     MovementAnims(0)="torchattackwalk"
     MovementAnims(1)="torchattackwalk"
     MovementAnims(2)="torchattackwalk"
     MovementAnims(3)="torchattackwalk"
}
