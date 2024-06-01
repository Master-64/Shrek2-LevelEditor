//================================================================================
// MenuMusicTimer.
//================================================================================

class MenuMusicTimer extends ShProps
  Placeable;

var() float timetowait;
var() int MMSonghandle;
var string lastmusic;

function PlaytheMusic()
{
}

defaultproperties
{
     timetowait=1.000000
     bAlwaysTick=True
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
}
