/*******************************************************************************
 * Soapbomb generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Soapbomb extends DecalBomb
    hidecategories(movement,Collision,Lighting,LightColor);

defaultproperties
{
    TraceNum=4
    TraceRotationVariance=(Pitch=65535,Yaw=65535,Roll=65535)
    MaxTraceDistance=128
    Decals(0)='dt_effects.liquids.soapsplatter1RC'
    Decals(1)='dt_effects.liquids.soapsplatter2RC'
    Decals(2)='dt_effects.liquids.soapsplatter3RC'
    BehaviorArgument=4
    Behavior=3
    bUnlit=true
}