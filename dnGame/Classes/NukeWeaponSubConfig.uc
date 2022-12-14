/*******************************************************************************
 * NukeWeaponSubConfig generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class NukeWeaponSubConfig extends Object;

var int CountdownMaterialIndex;
var float CountDownTimer;
var array<SNukeCountdownInfo> CountdownInfo;
var BumpShader PanelOffMaterial;
var float NukeArmColorTransitionTime;
var Color NukeArmedColor;
var Color NukeUnarmedColor;

defaultproperties
{
    CountdownMaterialIndex=1
    CountDownTimer=1
    CountdownInfo(0)=(SoundName=Nuke_CountDown03,Material='mt_skins4.RPG.rpgdisplay1bc_bs3',Smacker='mt_skins4.RPG.rpgdisplayems_3')
    CountdownInfo(1)=(SoundName=Nuke_CountDown02,Material='mt_skins4.RPG.rpgdisplay1bc_bs2',Smacker='mt_skins4.RPG.rpgdisplayems_2')
    CountdownInfo(2)=(SoundName=Nuke_CountDown01,Material='mt_skins4.RPG.rpgdisplay1bc_bs1',Smacker='mt_skins4.RPG.rpgdisplayems_1')
    CountdownInfo(3)=(SoundName=Nuke_SysReady,Material='mt_skins4.RPG.rpgdisplay1bc_bsarmed',Smacker='mt_skins4.RPG.rpgdisplayems_armed')
    PanelOffMaterial='mt_skins4.RPG.rpgdisplay1bc_bs'
    NukeArmColorTransitionTime=0.4
}