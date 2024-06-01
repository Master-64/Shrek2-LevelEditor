//================================================================================
// ElfShower.
//================================================================================

class ElfShower extends ElfSlider
  Config(User);

function JumpUp(float Amount, float Time)
{
}

defaultproperties
{
     bInShower=True
     sfxRubber(0)=Sound'Items.slot_eject_prize'
     sfxRubber(1)=Sound'Elves.HazMat_rubber02'
     sfxRubber(2)=Sound'Elves.HazMat_rubber03'
     sfxRubber(3)=Sound'Elves.HazMat_rubber04'
     sfxRubber(4)=Sound'Elves.HazMat_rubber05'
     sfxRubber(5)=Sound'Elves.HazMat_rubber06'
     sfxRubber(6)=Sound'Elves.HazMat_rubber07'
     sfxRubber(7)=Sound'Elves.HazMat_rubber08'
     sfxRubber(8)=Sound'Elves.HazMat_rubber09'
     sfxRubber(9)=Sound'Elves.HazMat_rubber10'
     sfxBodyFall(0)=Sound'Items.snapdragon_hiss_end'
     sfxBodyFall(1)=Sound'Elves.HazMat_bodyfall02'
     sfxBodyFall(2)=Sound'Elves.HazMat_bodyfall03'
     sfxBodyFall(3)=Sound'Elves.HazMat_bodyfall04'
     ReactDistance=500.000000
     HeroEscapeDistance=500.000000
     CombatController=Class'SHGame.ElfShowerController'
     AttackAnimName(0)="punch"
     AttackAnimName(1)="punch"
     Health=1
}
