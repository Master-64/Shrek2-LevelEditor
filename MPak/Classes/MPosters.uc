// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MPosters extends MPickup
	Config(MPak);


#exec AUDIO IMPORT FILE=Sounds\Pickup_Poster.wav NAME=Pickup_Poster


var() string sPosterTexture;
var() bool bDoNotFreezePlayer;


function PostPickupLogic(Actor Other)
{
	PC = U.GetPC();
	HP = U.GetHP();
	
	if(PC.IsA('ShrekController') && HP == Other)
	{
		ShrekController(PC).IngameWantedPosterPopUpImage = sPosterTexture;
		
		if(!bDoNotFreezePlayer)
		{
			ShrekController(PC).ShowGenericMenu("SHGame.SHInGameWantedPoster");
		}
		else
		{
			ShrekController(PC).ShowGenericMenu("MPak.MInGameWantedPoster");
		}
	}
}


defaultproperties
{
	fPickupSoundVolume=0.8
	bRotating=false
	bScalePickupSizeWithDistance=false
	bSpawnWithRandomRotation=false
	PickupSounds(0)=Sound'Pickup_Poster'
	PickupEmitterClass=class'Poster_Get'
	StaticMesh=StaticMesh'Shrek2_Univ_SM.Wanted_ShrekShape'
	DrawScale=0.125
	CollisionRadius=8.0
	CollisionHeight=30.0
	CollisionWidth=16.0
	CollideType=CT_Box
}