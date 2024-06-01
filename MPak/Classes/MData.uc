// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MData extends MInfo
	Config(MPak);


#exec TEXTURE IMPORT NAME=MData FILE=Textures\MData.dds FLAGS=2


var() bool b1, b2, b3;
var() int i1, i2, i3;
var() float f1, f2, f3;
var() string s1, s2, s3;


defaultproperties
{
	Texture=Texture'MData'
}