/*******************************************************************************
 * Destructible_WindMill generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Destructible_WindMill extends dnDestructibleBuildingDefinition within dnDestructibleBuilding;

defaultproperties
{
	Parts(0)=AnimEnd_NextAnimStateName='DukeHUD',
/* Exception thrown while deserializing Parts
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	Parts(1)=(Location=(X=-3.633731E+19,Y=2.954451E-17,Z=84),Z=306.2452)
	Parts(2)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=49153),Roll=16380)
	Parts(3)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(4)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(5)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=2.566573E-29,Y=2.965293E-17,Z=-84),Z=306.2452)
	Parts(6)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=16384),Roll=16380)
	Parts(7)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(8)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(9)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=NaN,Y=2.954676E-17,Z=-2),Z=306.2452)
	Parts(10)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=32769),Roll=16380)
	Parts(11)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(12)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(13)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=1.764534E-38,Y=2.965518E-17,Z=2),Z=306.2452)
	Parts(14)=(Rotation=(Pitch=-187867,Yaw=572915712,Roll=0),Roll=16380)
}