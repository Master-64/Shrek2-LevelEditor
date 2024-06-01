//================================================================================
// AppleTreeRotten.
//================================================================================

class AppleTreeRotten extends AppleTree
  Config(User);

function AddAnimNotifys()
{
}

function GetBumpSets()
{
}

defaultproperties
{
     fxImpactClass=Class'SHGame.Nut_Explo'
     LoadString="EnvAnims.nuttree"
     fxTreeExplodeClass=Class'SHGame.Tree_Explo'
     RoarAnimName="Idle"
     ThrowAnimName(0)="ThrowLeft"
     ThrowAnimName(1)="ThrowRight"
     ThrowAnimName(2)="ThrowSquirrel"
     StareAnimName="Idle"
     GotoSleepAnimName="Idle"
     KnockBackAnimName="knockback"
     PreExplodeAnimName="die"
     LookAroundAnimName="Idle"
     sfxSleep(0)=Sound'Items.ent_rotten_sleep'
     sfxSleep(1)=Sound'Items.ent_rotten_sleep'
     sfxWakeUp(0)=Sound'Items.ent_rotten_wakeup'
     sfxWakeUp(1)=Sound'Items.ent_rotten_wakeup'
     sfxRoar(0)=Sound'Items.ent_rotten_roar'
     sfxRoar(1)=Sound'Items.ent_rotten_roar'
     sfxLook(0)=None
     sfxLook(1)=None
     sfxThrow(0)=Sound'Items.ent_rotten_throw_apple'
     sfxThrow(1)=Sound'Items.ent_rotten_throw_apple'
     sfxThrowLeft(0)=Sound'Items.ent_rotten_throw_apple'
     sfxThrowRight(0)=Sound'Items.ent_rotten_throw_apple'
     sfxThrowSquirrel(0)=Sound'Items.ent_rotten_throw_apple'
     sfxLand(0)=Sound'Items.apple_explode1'
     sfxLand(1)=Sound'Items.apple_explode1'
     sfxLandSquirrel(0)=Sound'Items.ent_rotten_wakeup'
     sfxLandSquirrel(1)=Sound'Items.ent_rotten_wakeup'
     throwingClass=Class'SHGame.AppleRotten'
     ShrunkAnimName="'"
     HitsToKill=-1
     Health=3
     ControllerClass=Class'SHGame.AppleTreeRottenController'
     Mesh=SkeletalMesh'EnvAnims.nuttree'
     CollisionRadius=85.000000
     CollisionHeight=175.000000
}
