//================================================================================
// PickableTree.
//================================================================================

class PickableTree extends MongoPickup
  Config(User);

var() Class<Emitter> DestroyTreeEmitter;
var() Class<Emitter> TreeRootsEmitter;
var() name TreeRootsBone;
var() float TreeRootsEmitterDelay;
var() array<Sound> UpRootSounds;
var() array<Sound> TreeDestroySounds;

function PlayUpRootSound()
{
}

function PlayTreeDestroySound()
{
}

function SpawnRootEmitter()
{
}

function Landed(Vector HitNormal)
{
}

defaultproperties
{
     UpRootSounds(0)=Sound'The_Seige.tree_uproot1'
     UpRootSounds(1)=Sound'The_Seige.tree_uproot2'
     UpRootSounds(2)=Sound'The_Seige.tree_uproot3'
     TreeDestroySounds(0)=Sound'The_Seige.tree_hit_bridge01'
     TreeDestroySounds(1)=Sound'The_Seige.tree_hit_bridge02'
     PickUpType=0
     bCanBePickedUp=True
     IdleAnimName="Static"
     ControllerClass=Class'SHGame.PickableTreeController'
     bMovable=False
	 bAlignBottom=False
}
