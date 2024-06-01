//================================================================================
// PeasantProjectile.
//================================================================================

class PeasantProjectile extends PeasantTough
  Config(User);

var() name bumpHitENEMYAPPLE;
var() name bumpHitENEMYPUMPKIN;
var() name bumpHitSHREKAPPLE;
var() name bumpHitDONKEYAPPLE;
var() name bumpHitSHREKPUMPKIN;
var() name bumpHitDONKEYPUMPKIN;

function AddAnimNotifys()
{
}

function PickupObject()
{
}

function GetThrowType()
{
}

function GetBumpSets()
{
}

defaultproperties
{
     bumpHitENEMYAPPLE="'"
     bumpHitENEMYPUMPKIN="'"
     bumpHitSHREKAPPLE="'"
     bumpHitDONKEYAPPLE="'"
     bumpHitSHREKPUMPKIN="'"
     bumpHitDONKEYPUMPKIN="'"
     CombatController=Class'SHGame.ProjectileController'
     attachBone="body_r_wrist_joint"
     AttackAnimName(0)=throw
     AttackAnimName(1)=throw
     ShrunkAnimName="lookaround"
     RunAnimName="attackrun"
}
