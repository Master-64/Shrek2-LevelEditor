//*******************************************************************************
//* KWACTION_SetProp generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWACTION_SetProp extends KWScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) string PropName;
var(Action) string PropValue;
var(Action) name ActorTag;
var Actor TargetActor;

function bool InitActionFor(KWCutController C);

function SerializeFrom(string args);

function string GetActionString();

defaultproperties
{
    ActionString="SetProp"
}