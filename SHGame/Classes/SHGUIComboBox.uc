//*******************************************************************************
//* SHGUIComboBox generated by Eliot.UELib using UE Explorer.
//* Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
//* http://eliotvu.com
//*
//* All rights belong to their respective owners.
//********************************************************************************
class SHGUIComboBox extends GUIComboBox
    instanced;

function InitComponent(GUIController MyController, GUIComponent MyOwner);

defaultproperties
{
    Begin Object name=EditBox1 class=GUIEditBox
        StyleName="SHOptionsBtn"
    End Object
    Edit=EditBox1
    Begin Object name=ShowList class=GUIComboButton
        StyleName="SHOptionsBtn"
    End Object
    MyShowListBtn=ShowList
    Begin Object name=ListBox1 class=GUIListBox
        StyleName="SHOptionsBtn"
        bVisible=false
    End Object
    MyListBox=ListBox1
}