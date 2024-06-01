//================================================================================
// OutHousePanicSpeaker.
//================================================================================

class OutHousePanicSpeaker extends BumpLineSpeaker
  Placeable
  Config(User);

defaultproperties
{
     BumpLines(0)=PST_OutHouse
     BumpLines(1)=BBS_OutHouse
     BumpLines(2)=BND_OutHouse
     BumpLines(3)=ELF_OutHouse
     BumpLines(4)=LEP_OutHouse
     TimeDelay=2.000000
	 DrawType=DT_Sprite
}
