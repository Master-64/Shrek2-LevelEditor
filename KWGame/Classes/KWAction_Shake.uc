//*******************************************************************************
//* KWAction_Shake generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWAction_Shake extends KWScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var float magnitude;
var float Time;
var float decay;

function bool InitActionFor(KWCutController C);

function SerializeFrom(string args);

function string GetActionString();

defaultproperties
{
    magnitude=100
    Time=0.5
    ActionString="Shake"
}