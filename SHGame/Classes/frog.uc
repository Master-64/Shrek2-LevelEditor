//================================================================================
// frog.
//================================================================================

class frog extends SHCharacter
  Config(User);

var() float fDrawscaleMod;
var() string LoadString;
var(sounds) array<Sound> sfxHop;
var(sounds) array<Sound> sfxCroak;

function AddAnimNotifys()
{
}

function PlayHopSound()
{
}

function RandomizeLookAndFeel()
{
}

defaultproperties
{
     fDrawscaleMod=0.400000
     LoadString="ShrekCharacters.frog"
     sfxHop(0)=Sound'Items.frog_hop1'
     sfxHop(1)=none
     sfxHop(2)=Sound'Items.frog_hop2'
     sfxCroak(0)=Sound'Items.frog_01'
     sfxCroak(1)=Sound'Items.frog_02'
     sfxCroak(2)=Sound'Items.frog_03'
     WalkAnims(0)="run"
     WalkAnims(1)="run"
     WalkAnims(2)="run"
     WalkAnims(3)="run"
     AirAnims(0)="Idle"
     AirAnims(1)="Idle"
     AirAnims(2)="Idle"
     AirAnims(3)="Idle"
     TakeoffAnims(0)="Idle"
     TakeoffAnims(1)="Idle"
     TakeoffAnims(2)="Idle"
     TakeoffAnims(3)="Idle"
     LandAnims(0)="Idle"
     LandAnims(1)="Idle"
     AirStillAnim="Idle"
     TakeoffStillAnim="Idle"
     GroundRunSpeed=100.000000
     GroundWalkSpeed=100.000000
     GroundSpeed=100.000000
     ControllerClass=Class'SHGame.frogcontroller'
     BaseMovementRate=100.000000
     MovementAnims(1)="run"
     MovementAnims(2)="run"
     MovementAnims(3)="run"
     Mesh=SkeletalMesh'ShrekCharacters.frog'
     DrawScale=0.850000
     AmbientGlow=65
     bUnlit=True
     CollisionRadius=15.000000
     CollisionHeight=15.000000
     bCollideActors=False
     bBlockPlayers=False
}
