//================================================================================
// HouseStraw.
//================================================================================

class HouseStraw extends House
  Placeable
  Config(User);

defaultproperties
{
     classEmitter=Class'SHGame.Pig_Straw'
     HouseBlowSound=Sound'Hamlet.strawhut_blow_down'
     StaticMesh=StaticMesh'6_Hamlet_SM.pighouse_straw'
	 DrawType=DT_StaticMesh
}
