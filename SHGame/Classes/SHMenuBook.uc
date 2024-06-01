//================================================================================
// SHMenuBook.
//================================================================================

class SHMenuBook extends SHMenuProps
  Config(User);

var string NextMenuPage;
var PlayerController pc;
var(MenuControls0_1) float ButtonsRoot_T;
var(MenuControls0_1) float ButtonsRoot_L;
var(MenuControls0_1) float controlBut_T;
var(MenuControls0_1) float controlBut_L;
var(MenuControls0_1) float controlBut_W;
var(MenuControls0_1) float controlBut_H;
var(MenuControls0_1) float controlBut_VGAP;
var(MenuControls0_1) float DeleteLbl_T;
var(MenuControls0_1) float DeleteLbl_L;
var(MenuControls0_1) float DeleteLbl_W;
var(MenuControls0_1) float DeleteLbl_H;
var(MenuControls0_1) float savegameBut_T;
var(MenuControls0_1) float savegameBut_L;
var(MenuControls0_1) float savegameBut_W;
var(MenuControls0_1) float savegameBut_H;
var(MenuControls0_1) float savegameBut_VGAP;
var(MenuControls0_1) float savegameBut_HGAP;
var(Menu) float PageTurnSpeed;
var(Menu) float PageTurnTween;
var(Menu) float BookOpenSpeed;
var(Menu) float BookOPenTween;
var(Menu) Sound sfxPageTurn;
var(Menu) Sound sfxPage2Turn;

function RenderActor(Canvas Canvas)
{
}

function PerformDraw(Canvas Canvas)
{
}

defaultproperties
{
     ButtonsRoot_T=0.040000
     controlBut_T=0.500000
     controlBut_L=0.270000
     controlBut_W=0.450000
     controlBut_H=0.080000
     controlBut_VGAP=0.020000
     DeleteLbl_T=0.170000
     DeleteLbl_L=0.230000
     DeleteLbl_W=0.500000
     DeleteLbl_H=0.100000
     savegameBut_T=0.210000
     savegameBut_L=0.310000
     savegameBut_W=0.090000
     savegameBut_H=0.120000
     savegameBut_VGAP=0.030000
     savegameBut_HGAP=0.040000
     PageTurnSpeed=1.600000
     PageTurnTween=0.100000
     BookOpenSpeed=0.600000
     BookOPenTween=0.100000
     sfxPageTurn=Sound'UI.page_turn'
     sfxPage2Turn=Sound'UI.page_turn2'
     Mesh=SkeletalMesh'storybook_anims.frontend'
     DrawScale=3.000000
}
