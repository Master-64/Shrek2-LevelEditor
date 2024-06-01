//================================================================================
// MigratingBirds.
//================================================================================

class MigratingBirds extends Birds;

var() bool bWing;
var() bool bUneven;
var() int WingOffset;

defaultproperties
{
    bWing=true
    WingOffset=1
    MinFlockSize=5
    MaxFlockSize=20
    PawnTypes[0]=Class'Bird'
    PawnTypes[1]=Class'SmallBird'
    PawnTypes[2]=Class'Bird'
}