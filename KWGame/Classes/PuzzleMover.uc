//================================================================================
// PuzzleMover.
//================================================================================

class PuzzleMover extends KWMover;

var(Puzzle) int KeyFrames[8];
var(Puzzle) name Tags[8];
var(Puzzle) name PuzzleName;
var(Puzzle) name PuzzleEvent;
var(Puzzle) bool bSolveOnlyOnce;
var bool bAlreadySolved;
var ElevatorMover ElMovers[8];
var int TagIndex[8];
var() float fWaitTime;
var float fCurrTime;
var bool bIsOpen;
var int Pieces;

function bool IsRelevant(Actor Other)
{
}

function MyOpenDoor()
{
}

function MyCloseDoor()
{
}

function MyToggleDoor()
{
}

defaultproperties
{
     fWaitTime=1.000000
}
