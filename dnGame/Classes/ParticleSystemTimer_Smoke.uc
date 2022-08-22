/*******************************************************************************
 * ParticleSystemTimer_Smoke generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ParticleSystemTimer_Smoke extends ParticleSystemTimer
    collapsecategories
    hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Actor,Collision,Display,HeatVision,Interpolation,Material,Tick,TickTules,ParticleSystemTimer_Display,ParticleSystemTimer_Sound);

defaultproperties
{
    ParticleSystemClass='p_environment.Smokes.Smokes_SoftPillar'
    bEffectActive=true
    bTimerActive=false
    SoundName=Smoke_Med
    SoundFadeOutTime=0.75
}