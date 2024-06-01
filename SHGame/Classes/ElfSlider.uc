//================================================================================
// ElfSlider.
//================================================================================

class ElfSlider extends Elf
  Config(User);

var() name AttackBeginAnimName;
var() name AttackEndAnimName;
var ElfSlideTarget SlideTarget;
var(Enemy) name SlideTargetTag;
var Vector SlideLocationOne;
var Vector SlideLocationTwo;
var Vector CurrentLocation;
var Vector CurrentTargetLocation;
var bool bTouched;
var(Enemy) float timeBetweenSlides;

function Touch(Actor Other)
{
}

function Bump(Actor Other)
{
}

function DestroyRibbonEmitters()
{
}

function CreateRibbonEmittersForSlide()
{
}

function DestroyRibbonEmittersForSlide()
{
}

defaultproperties
{
     AttackBeginAnimName="slide"
     AttackEndAnimName="slideend"
     timeBetweenSlides=3.000000
     KnockFrontAnimName="knockforward"
     bSeeEverywhere=True
     ReactDistance=1500.000000
     HeroEscapeDistance=1500.000000
     CombatSpeed=450.000000
     AttackDistance=200.000000
     HitDistance=20.000000
     CombatController=Class'SHGame.ElfSliderController'
     PreCombatController=Class'SHGame.ElfPreCombatController'
     sfxAttackEffort(0)=Sound'AllDialog.pc_elf_ElfRunIntoRam_2'
     sfxAttackEffort(1)=Sound'AllDialog.pc_elf_ElfRunIntoRam_4'
     sfxAttackEffort(2)=Sound'AllDialog.pc_elf_ElfRunIntoRam_6'
     sfxAttackEffort(3)=Sound'AllDialog.pc_elf_ElfRunIntoRam_8'
     sfxAttackEffort(4)=Sound'AllDialog.pc_elf_ElfRunIntoRam_10'
     sfxAttackEffort(5)=Sound'AllDialog.pc_elf_ElfRunIntoRam_12'
     RibbonEmitterName=Class'SHGame.waterstreak_ribbon'
     CombatWalkAnimName="run"
     AttackAnimName(0)="slideloop"
     AttackAnimName(1)="slideloop"
     SpecialFaintAnimName="faint"
     DazedAnimName="daze"
     ControllerClass=Class'SHGame.ElfPreCombatController'
     MovementAnims(0)="slideloop"
     MovementAnims(1)="slideloop"
     MovementAnims(2)="slideloop"
     MovementAnims(3)="slideloop"
}
