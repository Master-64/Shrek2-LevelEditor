//*******************************************************************************
//* KWAction_PlayMusic generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWAction_PlayMusic extends KWScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) string Song;
var(Action) float TransitionTime;
var(Action) bool Loop;
var(Action) bool Stab;

function bool InitActionFor(KWCutController C);

function SerializeFrom(string args);

function string GetActionString();

defaultproperties
{
    Loop=true
    ActionString="PlayMusic"
}