//*******************************************************************************
//* AnimNotify_KWSound generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class AnimNotify_KWSound extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

var Sound Sound;
var() array<KWGame.SoundGroup> RandSounds;
var float Volume;
var float Radius;
var float Pitch;
var Range PitchRandRange;
var bool bNoOverride;
var bool bAttenuate;
var bool No3D;
var Actor.ESoundSlot slot;

event Notify(Actor Owner);

defaultproperties
{
    Volume=0.3
    Radius=300
    Pitch=1
    PitchRandRange=(Min=1,Max=1)
    bAttenuate=true
}