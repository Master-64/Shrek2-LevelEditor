//================================================================================
// PotionCards.
//================================================================================

class PotionCards extends PotionObject
  Config(User);

var() array<Material> RandSkins;

defaultproperties
{
     RandSkins(0)=Texture'Character_Props_tx.card_club'
     RandSkins(1)=Texture'Character_Props_tx.card_diamond'
     RandSkins(2)=Texture'Character_Props_tx.card_heart'
     RandSkins(3)=Texture'Character_Props_tx.card_spade'
     bBounce=False
     sfxBounce=None
     sfxLand=None
     AccelRate=0.050000
     StaticMesh=StaticMesh'Character_Props.potion_card'
     DrawScale=3.000000
     CollisionRadius=4.000000
     CollisionHeight=4.000000
     Mass=1.000000
}
