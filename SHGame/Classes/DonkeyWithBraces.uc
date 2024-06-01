//================================================================================
// DonkeyWithBraces.
//================================================================================

class DonkeyWithBraces extends Donkey
  Config(User);

var() array<Material> DonkeySkin;

function PostBeginPlay ()
{
  Super.PostBeginPlay();
  Skins[0] = DonkeySkin[0];
  Skins[1] = DonkeySkin[1];
}

defaultproperties
{
     DonkeySkin(0)=Texture'ShCharacters.donkey2_tx'
     DonkeySkin(1)=Texture'ShCharacters.donkey_braces_tx'
}
