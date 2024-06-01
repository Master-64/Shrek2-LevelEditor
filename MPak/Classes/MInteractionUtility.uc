// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************
// 
// A fork of an Interaction used for obtaining some
// very helpful information for programmers


class MInteractionUtility extends MInteraction
	Config(MPak);


event bool KeyEvent(out Interactions.EInputKey Key, out Interactions.EInputAction Action, float Delta)
{
	U.IM.SetIKAction(Key, Action);
	
	return super.KeyEvent(Key, Action, Delta);
}