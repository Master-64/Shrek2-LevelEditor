//================================================================================
// Movie.
//================================================================================

class Movie extends Object;

var const transient int FMovie;
var HUD HudParent;

final function Play(string MovieFilename, bool UseSound, bool LoopMovie);

final function Pause(bool Pause);

final function bool IsPaused();

final function StopNow();

final function StopAtEnd();

final function bool IsPlaying();

final function int GetWidth();

final function int GetHeight();

event MovieEnded();