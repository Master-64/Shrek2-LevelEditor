//================================================================================
// MilkOnGround.
//================================================================================

class MilkOnGround extends ShProps
  Placeable
  Config(User);

var() float fFadeOutTime;
var(sounds) array<Sound> sfxLanded;

function RenderOpactity()
{
}

defaultproperties
{
     fFadeOutTime=5.000000
     sfxLanded(0)=Sound'The_Seige.milk_spash01'
     sfxLanded(1)=Sound'The_Seige.milk_spash02'
     sfxLanded(2)=Sound'The_Seige.milk_spash03'
     sfxLanded(3)=Sound'The_Seige.milk_spash04'
     sfxLanded(4)=Sound'The_Seige.milk_spash05'
     sfxLanded(5)=Sound'The_Seige.milk_spash06'
     StaticMesh=StaticMesh'Shrek2_Univ_SM.Decal_StampShape'
     DrawScale=0.190000
     CollisionRadius=40.000000
     CollisionHeight=1.000000
     bCollideActors=False
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_StaticMesh
}
