/*******************************************************************************
 * Destructible_WoodenFence_Section generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Destructible_WoodenFence_Section extends dnDestructibleBuildingDefinition within dnDestructibleBuilding;

defaultproperties
{
	Parts(0)=AnimEarlyEndTime='DukeHUD',
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
	Parts(1)=(Location=(X=2.131513E+12,Y=2.965536E-17,Z=0.701904),Z=-1.513672)
	Parts(2)=(Rotation=(Pitch=8741,Yaw=572915712,Roll=16372),Roll=65529)
	Parts(3)=(Scale=(X=-1.075528E+08,Y=2.954391E-17,Z=0.48),Z=0.8)
	Parts(4)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(5)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=1.267875E+15,Y=2.95466E-17,Z=1.701904),Z=-1.513672)
	Parts(6)=(Rotation=(Pitch=8741,Yaw=572915712,Roll=49141),Roll=33661)
	Parts(7)=(Scale=(X=-1.075528E+08,Y=2.954391E-17,Z=0.48),Z=0.8)
	Parts(8)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial=none,bDefaultInteractionClass=false)
	Parts(9)=(StaticMesh='SM_Lvl_Desert.Destructible.gen_2x4_short',Location=(X=6.534395E+11,Y=2.965506E-17,Z=-2.299072),Z=-35.51367)
}