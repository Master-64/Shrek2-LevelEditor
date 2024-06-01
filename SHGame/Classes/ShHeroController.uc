//================================================================================
// ShHeroController.
//================================================================================

class ShHeroController extends KWHeroController
  Config(User);

var input float aArrowUp;
var int PotionSelected;
var bool bPotionInUse;
var globalconfig int ShrekFirstStrengthPotion;
var globalconfig int DonkeyFirstStrengthPotion;
var globalconfig int SteedFirstStrengthPotion;
var globalconfig int PibFirstStrengthPotion;
var globalconfig int HumanFirstStrengthPotion;
var globalconfig int bonuscoins;
var globalconfig int bonusHealth;
var string PrePotionMusic;
var int PotionMusicHandle;
var globalconfig string Save0Image;
var globalconfig string Save1Image;
var globalconfig string Save2Image;
var globalconfig string Save3Image;
var globalconfig string Save4Image;
var globalconfig string Save5Image;
var float TimeAfterLoading;
var bool bUnAssigned;

exec function SaveSlottedGame(int slot, optional bool bCopyToSlotZero)
{
}

function PausePotion()
{
}

function UnPausePotion()
{
}

function UsePotion()
{
}

function PotionEnded()
{
}

function bool DoIHaveThisPotion(int pIndex)
{
}

function SetPotionDisplay()
{
}

function SetFall()
{
}

function bool bShouldSnapRotation()
{
}

function SaveGame()
{
}

function SetSaveGameImage(int iSlot)
{
}

function Possess(Pawn NewPawn)
{
}

event OnEnginePreFirstTick(bool bLoadFromSaveGame)
{
}

function ClearPlayerStartEvents()
{
}

exec function AddPotions(int H)
{
}

exec function SelectPotion(int H)
{
}

exec function Fire(optional float f)
{
}

exec function Addposters()
{
}

defaultproperties
{
     PotionMusicHandle=-1
     Save0Image="storybookanimTX.box_button"
     Save1Image="storybookanimTX.box_button"
     Save2Image="storybookanimTX.box_button"
     Save3Image="storybookanimTX.box_button"
     Save4Image="storybookanimTX.box_button"
     Save5Image="storybookanimTX.box_button"
     DefaultSelectCursorType=None
     CameraClass=Class'SHGame.ShCam'
     rSnapRotation=(Pitch=-1)
     rSnapRotationSpeed=(Pitch=7)
     bDoOpacityForCamera=True
     CheatClass=Class'SHGame.SHCheatManager'
     InputClass=Class'SHGame.ShPlayerInput'
}
