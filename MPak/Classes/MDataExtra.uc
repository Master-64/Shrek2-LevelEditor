// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MDataExtra extends MInfo
	Config(MPak);


#exec TEXTURE IMPORT NAME=MData FILE=Textures\MData.dds FLAGS=2


var() bool b1, b2, b3, b4, b5, b6;
var() int i1, i2, i3, i4, i5, i6;
var() float f1, f2, f3, f4, f5, f6;
var() string s1, s2, s3, s4, s5, s6;
var() vector v1, v2, v3, v4, v5, v6;
var() rotator r1, r2, r3, r4, r5, r6;


defaultproperties
{
	Texture=Texture'MData'
}