//================================================================================
// HouseWood.
//================================================================================

class HouseWood extends House
  Placeable
  Config(User);

defaultproperties
{
     classEmitter=Class'SHGame.Pig_Wood'
     HouseBlowSound=Sound'Hamlet.house_blow_down'
     StaticMesh=StaticMesh'6_Hamlet_SM.pig_woodhouse'
	 DrawType=DT_StaticMesh
}
