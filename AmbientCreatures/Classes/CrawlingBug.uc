//================================================================================
// CrawlingBug.
//================================================================================

class CrawlingBug extends Bug
  Config(User);

defaultproperties
{
    bFlyer=false
    bCrawler=true
    AirSpeed=170
    AccelRate=1500
    Mesh=VertMesh'Firefly'
    RotationRate=(Pitch=4096,Yaw=120000,Roll=0)
}