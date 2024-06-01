//================================================================================
// PeasantUpEnderWimp.
//================================================================================

class PeasantUpEnderWimp extends PeasantWimp
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
     AttackDistance=100.000000
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
     CombatIdleAnimName="scared_torchidle"
     CombatWalkAnimName="scared_torchwalk"
     AttackAnimName(0)="scared_torchswipe"
     AttackAnimName(1)="scared_torchswipe"
     FaintAnimName="scared_torchfaint"
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
     AttackInfo(0)=(AnimName="scared_torchswipe",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_torchtip_joint",StartFrame=11.7,EndFrame=15)
     AttackInfo(1)=(AnimName="scared_torchswipe",StartBoneName="body_r_fingersbase_joint",EndBoneName="body_torchtip_joint",StartFrame=11.7,EndFrame=15)
     WalkAnims(0)="torchcasualwalk"
     WalkAnims(1)="torchcasualwalk"
     WalkAnims(2)="torchcasualwalk"
     WalkAnims(3)="torchcasualwalk"
     IdleAnimName="torchidle"
     RunAnimName="scared_torchwalk"
     KnockBackAnimName="scared_torchknockback"
     MovementAnims(0)="scared_torchwalk"
     MovementAnims(1)="scared_torchwalk"
     MovementAnims(2)="scared_torchwalk"
     MovementAnims(3)="scared_torchwalk"
}
