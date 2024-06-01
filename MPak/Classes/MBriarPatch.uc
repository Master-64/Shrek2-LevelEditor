// *****************************************************
// *		  Master Pack (MPak) by Master_64		   *
// *		  Copyrighted (c) Master_64, 2022		   *
// *   May be modified but not without proper credit!  *
// *	 https://master-64.itch.io/shrek-2-pc-mpak	   *
// *****************************************************


class MBriarPatch extends BriarPatch
	HideCategories(BriarPatch)
	Config(MPak);


var() float fDamageAmount, fDamageDelay;
var() class<Emitter> EmitterHurtClass;
var() array<Sound> HurtSound;
var() bool bAffectAllPawns, bTakeKnockback;
var() float fChanceToSayBumpline;
var bool bTouched;
var KWHeroController PC;
var Pawn HP, ICP;
var KWHud HUD;
var array<KWHudItem> HudItems;
var BaseCam Cam;
var MUtils U;


event PostBeginPlay()
{
	super.PostBeginPlay();
	
	U = GetUtils();
}

event Timer()
{
	bTouched = false;
}

function MUtils GetUtils()
{
	local MUtils Ut;
	
	foreach DynamicActors(class'MUtils', Ut)
	{
		return Ut;
	}
	
	return Spawn(class'MUtils');
}

event Bump(Actor Other)
{
	HP = U.GetHP();
	
	if(bTouched || !Other.IsA('Pawn'))
	{
		return;
	}
	
	if(bAffectAllPawns || Other == HP)
	{
		if(Other == HP && U.PercentChance(fChanceToSayBumpline) && HP.IsA('SHHeroPawn'))
		{
			if(HP.IsA('Shrek'))
			{
				SHHeroPawn(HP).InterestMgr.CommentMgr.SayComment('SHK_briarshrek', HP.Tag,, true,,, HP, "HPDialog");
			}
			else if(HP.IsA('Donkey'))
			{
				SHHeroPawn(HP).InterestMgr.CommentMgr.SayComment('DNK_briardonkey', HP.Tag,, true,,, HP, "HPDialog");
			}
		}
		
		U.AddHealth(Pawn(Other), -fDamageAmount, !bTakeKnockback);
		
		if(U.MFancySpawn(EmitterHurtClass, Location))
		{
			U.PlayASound3D(self,, HurtSound[Rand(HurtSound.Length)], 0.1);
		}
		
		bTouched = true;
		
		SetTimer(FMax(fDamageDelay, 0.000001), false);
	}
}


defaultproperties
{
	fDamageAmount=5.0
	fDamageDelay=1.0
	EmitterHurtClass=class'Briar_Break'
	HurtSound(0)=Sound'Items.Briar_damage01'
	HurtSound(1)=Sound'Items.Briar_damage02'
	HurtSound(2)=Sound'Items.Briar_damage03'
	HurtSound(3)=Sound'Items.Briar_damage04'
	HurtSound(4)=Sound'Items.Briar_damage05'
	bTakeKnockback=true
	fChanceToSayBumpline=0.5
	ControllerClass=none
}