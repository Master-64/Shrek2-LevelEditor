//================================================================================
// HerdAnimal.
//================================================================================

class HerdAnimal extends AmbientCreature;

var() HerdAnimal NextHerdAnimal;
var() HerdAnimal PrevHerdAnimal;
var() float HerdDist;
var() HerdAnimal Child;
var() HerdAnimal Parent;

function Destroyed()
{
}

function PawnDied(Pawn P)
{
}

function Possess(Pawn aPawn)
{
}

event bool NotifyHitWall(Vector HitNormal, Actor Wall)
{
}

event bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
{
}

function HerdAnimal HerdLeader()
{
}

function FindMomFor(HerdAnimal Infant)
{
}

function WarnHerd(Pawn Other)
{
}

function Stampede(Pawn Other)
{
}

function FollowParent()
{
}