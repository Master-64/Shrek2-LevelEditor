//================================================================================
// PeasantCowardCombatController.
//================================================================================

class PeasantCowardCombatController extends PeasantCombatController;

var RunAwayMarker marker;
var float pitchSlow;
var float pitchMedium;
var float pitchFast;
var Rotator CurrentRotation;
var bool bStartPitching;
var Sound fallSound;
var Sound goStiffSound;
var Sound hitGroundSound;

function Init()
{
}

function ReInit()
{
}

defaultproperties
{
     pitchSlow=500.000000
     pitchMedium=1200.000000
     pitchFast=2500.000000
     hitGroundSound=Sound'Footsteps.F_shrek_wood03'
}
