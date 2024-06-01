// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MSelectCursor extends SelectCursor
	Config(MPak);


function bool bIgnoreActor(Actor HitActor, Vector Loc)
{
	if(Player == none || Player.Pawn == none)
	{
		return true;
	}
	
	return (HitActor.IsA('Projector') || HitActor.IsA('Volume') || HitActor == Player || HitActor == KWHeroController(Player).Camera || HitActor == KWHeroController(Player).Camera.CamTarget || HitActor == Player.Pawn) && !bTargetSelf;
}


defaultproperties
{
	Texture=Texture'Shrek2_EFX.Gen_Particle.crosshair_tx'
	fLOS_Distance=1500.0
	Style=STY_Additive
}