//*******************************************************************************
//* MenuBook generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class MenuBook extends MenuActor
    notplaceable;

var PlayerController pc;
var string NextMenuPage;
var float PageTurnSpeed;
var float PageTurnTween;
var Sound sfxPageTurn;
var Sound sfxPage2Turn;

function RenderActor(Canvas Canvas);

function PerformDraw(Canvas Canvas);

state OpenBook{}

state CloseBook{}

state OpenIdle{}

state TurnPageForward{}

state TurnPageBackward{}

defaultproperties
{
    PageTurnSpeed=1
    PageTurnTween=0.1
    sfxPageTurn=Sound'UI.page_turn'
    sfxPage2Turn=Sound'UI.page_turn2'
    DrawType=DT_Mesh
    Mesh=SkeletalMesh'storybook_anims.frontend'
}