//*******************************************************************************
//* KWACTION_WaitForSay generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWACTION_WaitForSay extends KWLatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(KWCutController C);

function ForceFinish(KWCutController C);

function OnTimer();

function bool CompleteWhenTriggered();

function bool CompleteWhenTimer();

function string GetActionString();

defaultproperties
{
    ActionString="WaitForSay "
}