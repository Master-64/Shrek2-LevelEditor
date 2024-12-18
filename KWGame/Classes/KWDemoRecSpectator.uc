//*******************************************************************************
//* KWDemoRecSpectator generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//*******************************************************************************
class KWDemoRecSpectator extends DemoRecSpectator
    config(User);

event PostBeginPlay();

function InitPlayerReplicationInfo();

exec function ViewClass(class<Actor> aClass, optional bool bQuiet, optional bool bCheat);

exec function DemoViewNextPlayer();

event PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation);

auto state Spectating{}