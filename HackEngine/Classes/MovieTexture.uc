//================================================================================
// MovieTexture.
//================================================================================

class MovieTexture extends Texture
    safereplace
    hidecategories(Object);

var const transient Movie Movie;
var() string MovieFilename;
var() int FrameRate;

final function InitializeMovie();

defaultproperties
{
    FrameRate=30
}