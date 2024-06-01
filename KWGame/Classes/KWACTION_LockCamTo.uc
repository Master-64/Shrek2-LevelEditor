//*******************************************************************************
//* KWACTION_LockCamTo generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWACTION_LockCamTo extends KWScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var bool bLock;
var Rotator LockCone;
var Actor LockActor;
var name ActorTag;
var float fSpeed;
var float fTightness;

function bool InitActionFor(KWCutController C);

function string GetActionString();

function SerializeFrom(string args);

defaultproperties
{
    bLock=true
    LockCone=(Pitch=2000,Yaw=2000,Roll=0)
    fSpeed=7
    fTightness=10
    ActionString="LockCamTo"
    bValidForTrigger=false
}