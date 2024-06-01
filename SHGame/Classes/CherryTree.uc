//================================================================================
// CherryTree.
//================================================================================

class CherryTree extends AppleTree
  Config(User);

var(sounds) array<Sound> sfxLeaves;
var(sounds) array<Sound> sfxLeavesQuick;

function AddAnimNotifys()
{
}

function PlaySpit()
{
}

function PlayPopup()
{
}

function PlayLeaves()
{
}

function PlayLeavesQuick()
{
}

function PlayOuch()
{
}

function PlayCough()
{
}

function PlayGasp()
{
}

function PlayDie()
{
}

function GetBumpSets()
{
}

defaultproperties
{
     sfxLeaves(0)=Sound'Items.ChrryTr_leaves01'
     sfxLeaves(1)=Sound'Items.ChrryTr_leaves02'
     sfxLeaves(2)=Sound'Items.ChrryTr_leaves03'
     sfxLeaves(3)=Sound'Items.ChrryTr_leaves04'
     sfxLeaves(4)=Sound'Items.ChrryTr_leaves05'
     sfxLeavesQuick(0)=Sound'Items.ChrryTr_leavesQuick1'
     sfxLeavesQuick(1)=Sound'Items.ChrryTr_leavesQuick2'
     sfxLeavesQuick(2)=Sound'Items.ChrryTr_leavesQuick3'
     sfxLeavesQuick(3)=Sound'Items.ChrryTr_leavesQuick4'
     fxImpactClass=Class'SHGame.Cherry_Bomb'
     ThrowInterval=3.000000
     LoadString="EnvAnims.cherrytree"
     fxTreeExplodeClass=Class'SHGame.Tree_Explo'
     fxThrowFollowClass=Class'SHGame.Cherry_Trail'
     turnBoneName="CherryTree_Base"
     attachBoneName="cherrytree_MouthTop"
     WakeUpAnimName="Popup"
     RoarAnimName="ShakeHead"
	 ThrowAnimName(0)="Spit"
     StareAnimName="Idle"
     GotoSleepAnimName="Idle"
     KnockBackAnimName="knockback"
     ChokeAnimName="Cough"
     PreExplodeAnimName="Vomit"
     LookAroundAnimName="lookaround"
     sfxSleep(0)=None
     sfxSleep(1)=None
     sfxWakeUp(0)=Sound'Items.ChrryTr_popup01'
     sfxWakeUp(1)=Sound'Items.ChrryTr_popup02'
     sfxWakeUp(2)=Sound'Items.ChrryTr_popup03'
     sfxLook(0)=None
     sfxLook(1)=None
     sfxSpit(0)=Sound'Items.ChrryTr_spit01'
     sfxSpit(1)=Sound'Items.ChrryTr_spit02'
     sfxSpit(2)=Sound'Items.ChrryTr_spit03'
     sfxLand(0)=Sound'Items.apple_explode1'
     sfxLand(1)=Sound'Items.apple_explode1'
     sfxChoke(0)=Sound'Items.ChrryTr_cough01'
     sfxChoke(1)=Sound'Items.ChrryTr_cough02'
     sfxChoke(2)=Sound'Items.ChrryTr_cough03'
     sfxChoke(3)=Sound'Items.ChrryTr_cough04'
     sfxDie(0)=Sound'Items.ChrryTr_die'
     sfxOuch(0)=Sound'Items.ChrryTr_ouch01'
     sfxOuch(1)=Sound'Items.ChrryTr_ouch02'
     sfxOuch(2)=Sound'Items.ChrryTr_ouch03'
     sfxGasp(0)=Sound'Items.ChrryTr_gasp01'
     sfxGasp(1)=Sound'Items.ChrryTr_gasp02'
     sfxGasp(2)=Sound'Items.ChrryTr_gasp03'
     sfxGasp(3)=Sound'Items.ChrryTr_gasp04'
     throwingClass=Class'SHGame.Cherry'
     SkinFreeze=FinalBlend'EnvAnimsTx.cherrytree_ice'
     ShrunkAnimName="ShakeHead"
     HitsToKill=-1
     IdleAnimName="Idle"
     ControllerClass=Class'SHGame.CherryTreeController'
     Mesh=SkeletalMesh'EnvAnims.CherryTree'
     CollisionRadius=90.000000
     CollisionHeight=175.000000
}
