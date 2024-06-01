//================================================================================
// HayPile.
//================================================================================

class HayPile extends ShPropsStatic
  Config(User);

var bool bBeenBumped;
var(sounds) array<Sound> sfxLand;
var Emitter fxHayPuff;
var() Class<Emitter> fxHayPuffClass;

function Bump(Actor Other)
{
}

defaultproperties
{
     sfxLand(0)=Sound'Enviroment.hay_land'
     fxHayPuffClass=Class'SHGame.Hay_Spray'
     bCanBeBaseForPawns=True
     StaticMesh=StaticMesh'6_Hamlet_SM.Hay_pile'
     CollisionRadius=41.000000
     CollisionHeight=41.000000
	 DrawType=DT_StaticMesh
}
