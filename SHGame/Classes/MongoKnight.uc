//================================================================================
// MongoKnight.
//================================================================================

class MongoKnight extends ShEnemy
  Config(User);

var() float panicRadius;
var() float panicSpeed;
var Vector savedNormal;
var(sounds) array<Sound> sfxScream;
var(sounds) array<Sound> sfxHitWall;
var(sounds) array<Sound> sfxRandRunning;
var name bumpOuchWalking;
var name bumpKnightCrowd;

function GetBumpSets()
{
}

function AddAnimNotifys()
{
}

function AnimNotifySword()
{
}

defaultproperties
{
     panicRadius=250.000000
     panicSpeed=250.000000
     sfxRandRunning(0)=Sound'Knights.armor01'
     sfxRandRunning(1)=Sound'Knights.armor02'
     sfxRandRunning(2)=Sound'Knights.armor03'
     sfxRandRunning(3)=Sound'Knights.armor04'
     sfxRandRunning(4)=Sound'Knights.armor05'
     sfxRandRunning(5)=Sound'Knights.armor06'
     sfxRandRunning(6)=Sound'Knights.armor07'
     sfxRandRunning(7)=Sound'Knights.armor08'
     sfxRandRunning(8)=Sound'Knights.armor09'
     sfxRandRunning(9)=Sound'Knights.armor10'
     sfxRandRunning(10)=Sound'Knights.sword_hit08'
     sfxRandRunning(11)=Sound'Knights.sword_hit09'
     sfxRandRunning(12)=Sound'Knights.sword_hit10'
     sfxRandRunning(13)=Sound'Knights.sword_hit11'
     DamageAmount=2.000000
     CombatSpeed=650.000000
     sfxAttackConnect(0)=Sound'Knights.move01'
     sfxAttackConnect(1)=Sound'Knights.move02'
     sfxAttackConnect(2)=Sound'Knights.move03'
     sfxAttackConnect(3)=Sound'Knights.move04'
     sfxAttackConnect(4)=Sound'Knights.move05'
     sfxAttackConnect(5)=Sound'Knights.move06'
     sfxAttackConnect(6)=Sound'Knights.move07'
     sfxAttackConnect(7)=Sound'Knights.move08'
     sfxOuch(0)=Sound'Knights.sword_hit01'
     sfxOuch(1)=Sound'Knights.sword_hit02'
     sfxOuch(2)=Sound'Knights.sword_hit03'
     sfxOuch(3)=Sound'Knights.sword_hit04'
     sfxOuch(4)=Sound'Knights.sword_hit05'
     sfxOuch(5)=Sound'Knights.sword_hit06'
     sfxOuch(6)=Sound'Knights.sword_hit07'
     sfxOuch(7)=Sound'Knights.sword_hit08'
     sfxOuch(8)=Sound'Knights.sword_hit09'
     sfxOuch(9)=Sound'Knights.sword_hit10'
     sfxOuch(10)=Sound'Knights.sword_hit11'
     sfxFaint(0)=Sound'Knights.sword_hit01'
     sfxFaint(1)=Sound'Knights.sword_hit02'
     sfxFaint(2)=Sound'Knights.sword_hit03'
     sfxFaint(3)=Sound'Knights.sword_hit04'
     sfxFaint(4)=Sound'Knights.sword_hit05'
     sfxFaint(5)=Sound'Knights.sword_hit06'
     sfxFaint(6)=Sound'Knights.sword_hit07'
     sfxFaint(7)=Sound'Knights.sword_hit08'
     sfxFaint(8)=Sound'Knights.sword_hit09'
     sfxFaint(9)=Sound'Knights.sword_hit10'
     sfxFaint(10)=Sound'Knights.sword_hit11'
     LoadString="ShrekCharacters.Knight"
     CombatIdleAnimName="swordidle"
     CombatWalkAnimName="swordrun"
     AttackAnimName(0)="swordright"
     AttackAnimName(1)="swordleft"
     bUsePotions=False
     WalkAnims(0)="Walk"
     WalkAnims(1)="Walk"
     WalkAnims(2)="Walk"
     WalkAnims(3)="Walk"
     IdleAnimName="swordidle"
     RunAnimName="swordrun"
     WalkAnimName="swordrun"
     Health=1
     ControllerClass=Class'SHGame.MongoKnightController'
     MovementAnims(0)="swordrun"
     MovementAnims(1)="swordrun"
     MovementAnims(2)="swordrun"
     MovementAnims(3)="swordrun"
     Mesh=SkeletalMesh'ShrekCharacters.knight_lopoly'
     CollisionHeight=33.000000
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
     RotationRate=(Yaw=100000)
}
