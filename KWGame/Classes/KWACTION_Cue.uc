//*******************************************************************************
//* KWACTION_Cue generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWACTION_Cue extends KWScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) string CueName;

function bool InitActionFor(KWCutController C);

function string GetActionString();

function SerializeFrom(string args);

defaultproperties
{
    ActionString="Cue "
}