// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MDirectorTrigger extends MTriggers
	Placeable
	Config(MPak);


var() int iNumberOfEnemiesTotal, iNumberOfEnemiesAtOnce;
var() name nGroupName;
var() float fSpawnDelay;
var EnemySpawnDirector ESD;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	ESD = Spawn(class'EnemySpawnDirector');
	ESD.bHidden = true;
	ESD.NumberOfEnemiesTotal = iNumberOfEnemiesTotal;
	ESD.NumberOfEnemiesAtOnce = iNumberOfEnemiesAtOnce;
	ESD.GroupName = nGroupName;
	ESD.SpawnDelay = fSpawnDelay;
	ESD.PostBeginPlay();
}

function Activate(Actor Other, Pawn Instigator)
{
	super.Activate(Other, Instigator);
	
	ESD.Trigger(Other, Instigator);
}


defaultproperties
{
	bTriggerOnceOnly=true
}