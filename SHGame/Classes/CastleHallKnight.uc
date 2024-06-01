//================================================================================
// CastleHallKnight.
//================================================================================

class CastleHallKnight extends Knight
  Config(User);

var() float panicRadius;
var() float panicSpeed;
var Vector savedNormal;
var() int playKnockback;
var(sounds) array<Sound> sfxScream;
var(sounds) array<Sound> sfxHitWall;

function AnimNotifySword()
{
}

function AddAnimNotifys()
{
}

defaultproperties
{
     panicRadius=250.000000
     panicSpeed=250.000000
     playKnockback=3
     HeroEscapeDistance=3000.000000
     CombatSpeed=400.000000
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
     CombatIdleAnimName="swordidle"
     CombatWalkAnimName="swordrun"
     AttackAnimName(0)=swordright
     AttackAnimName(1)=swordleft
     WalkAnims(0)="Walk"
     WalkAnims(1)="Walk"
     WalkAnims(2)="Walk"
     WalkAnims(3)="Walk"
     IdleAnimName="swordidle"
     RunAnimName="swordrun"
     WalkAnimName="swordrun"
     Health=1
     ControllerClass=Class'SHGame.CastleHallKnightController'
     MovementAnims(0)="swordrun"
     MovementAnims(1)="swordrun"
     MovementAnims(2)="swordrun"
     MovementAnims(3)="swordrun"
     bActorShadows=False
     bCollideActors=False
     bBlockActors=False
     bBlockPlayers=False
     RotationRate=(Pitch=4096,Yaw=100000,Roll=3072)
	 bAlignBottom=True
}
