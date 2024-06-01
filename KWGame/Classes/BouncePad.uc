//================================================================================
// BouncePad.
//================================================================================

class BouncePad extends BounceObject
  Config(User);

#exec TEXTURE IMPORT NAME=SpongifyTexture FILE=Texture\SpongifyTexture.tga FLAGS=2

var() float fTimeToHitTarget;
var() float SpongifyPadSpeed;
var() Vector SpongifyPadDir;
var BounceTarget SpongyTarget;
var BounceSheet SpongySheet;
var() bool bEnabled;
var() bool bCanMoveWhileJumping;

function Trigger(Actor Other, Pawn EventInstigator)
{
}

function SetTarget(optional name HostTag)
{
}

function OnBounce(Actor Other)
{
}

defaultproperties
{
     fTimeToHitTarget=2.000000
     SpongifyPadSpeed=500.000000
     SpongifyPadDir=(Z=1.000000)
     bEnabled=True
     bHidden=True
     CollisionRadius=48.000000
     CollisionHeight=4.000000
     bCollideWorld=False
     bBlockActors=False
     bBlockPlayers=False
	 DrawType=DT_Sprite
	 Texture=Texture'SpongifyTexture'
}
