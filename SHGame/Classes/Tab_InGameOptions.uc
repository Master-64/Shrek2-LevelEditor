//*******************************************************************************
//* Tab_InGameOptions generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class Tab_InGameOptions extends Tab_Options
    config
    instanced;

function InitComponent(GUIController MyController, GUIComponent MyOwner);

function AddTabs();

function bool InternalOnClick(GUIComponent Sender);

event Timer();
