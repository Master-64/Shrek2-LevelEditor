// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MSecretTrigger extends MTriggers
	Config(MPak);


#exec TEXTURE IMPORT NAME=MSecretTrigger FILE=Textures\MSecretTrigger.dds FLAGS=2
#exec AUDIO IMPORT FILE=Sounds\Secret_Found.wav NAME=Secret_Found


var() Sound SecretSound;


function Activate(Actor Other, Pawn Instigator)
{
	super.Activate(Other, Instigator);
	
	U.PlayASound(, SecretSound);
}


defaultproperties
{
	bTriggerOnceOnly=true
	SecretSound=Sound'Secret_Found'
	Texture=Texture'MSecretTrigger'
}