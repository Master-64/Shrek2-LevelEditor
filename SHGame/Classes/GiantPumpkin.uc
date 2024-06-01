//================================================================================
// GiantPumpkin.
//================================================================================

class GiantPumpkin extends ShProps
  Config(User);

var(sounds) array<Sound> sfxPunchOne;
var(sounds) array<Sound> sfxPunchTwo;
var(sounds) array<Sound> sfxPunchThree;
var(sounds) array<Sound> sfxBeforeExplode;
var(sounds) array<Sound> sfxExplode;
var() Material OnePunchSkin;
var() Material TwoPunchSkin;
var() Material ThreePunchSkin;
var() name IdleAnim1;
var() name IdleAnim2;
var() name IdleAnim3;
var() name KnockBackAnim;
var() Class<Emitter> fxPumpkinExplosionClass;

function AnimEnd(int Channel)
{
}

defaultproperties
{
     sfxPunchOne(0)=Sound'Items.giantpumpkin_ouch1'
     sfxPunchOne(1)=Sound'Items.giantpumpkin_ouch1'
     sfxPunchTwo(0)=Sound'Items.giantpumpkin_ouch2'
     sfxPunchTwo(1)=Sound'Items.giantpumpkin_ouch2'
     sfxPunchThree(0)=None
     sfxPunchThree(1)=None
     sfxBeforeExplode(0)=None
     sfxBeforeExplode(1)=None
     sfxExplode(0)=Sound'The_Hunt.giantpumpkin_explode'
     OnePunchSkin=Texture'EnvAnimsTx.Pumpkin_dam1'
     TwoPunchSkin=Texture'EnvAnimsTx.Pumpkin_dam2'
     ThreePunchSkin=Texture'EnvAnimsTx.Pumpkin_dam2'
     IdleAnim1="Idle1"
     IdleAnim2="Idle2"
     IdleAnim3="Idle3"
     KnockBackAnim="knockback"
     fxPumpkinExplosionClass=Class'SHGame.Pumk_Bang_Giant'
     bCouldBeAttacked=True
     IdleAnimName="Idle1"
     Health=3
     ControllerClass=Class'SHGame.GiantPumpkinController'
     MovementAnims(0)="Idle1"
     MovementAnims(1)="Idle1"
     MovementAnims(2)="Idle1"
     MovementAnims(3)="Idle1"
     TurnLeftAnim="Idle1"
     TurnRightAnim="Idle1"
     Mesh=SkeletalMesh'EnvAnims.GiantPumpkin'
     CollisionRadius=125.000000
     CollisionHeight=100.000000
}
