//================================================================================
// SHMovieManager.
//================================================================================

class SHMovieManager extends MovieManager
  Config(User);

#exec TEXTURE IMPORT NAME=SHMovieManager FILE=Texture\SHMovieManager.tga FLAGS=2

var() int WhichMovie;
var() array<string> MovieList;
var() array<string> MovieList512;
var() array<string> MovieList640;
var() array<string> MovieList1024;
var() string NextLevel;

event Trigger(Actor Other, Pawn EventInstigator)
{
}

defaultproperties
{
     WhichMovie=-1
     MovieList(0)="DW_LOGO.bik"
     MovieList(1)="ACTIVSN.bik"
     MovieList(2)="KWlogo.bik"
     MovieList512(0)="DW_LOGO512.bik"
     MovieList512(1)="ACTIVSN512.bik"
     MovieList512(2)="KWlogo512.bik"
     MovieList640(0)="DW_LOGO640.bik"
     MovieList640(1)="ACTIVSN640.bik"
     MovieList640(2)="KWlogo640.bik"
     MovieList1024(0)="DW_LOGO1024.bik"
     MovieList1024(1)="ACTIVSN1024.bik"
     MovieList1024(2)="KWlogo1024.bik"
     NextLevel="Book_FrontEnd.unr"
     DrawType=DT_Sprite
	 Texture=Texture'SHMovieManager'
}
