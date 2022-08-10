/*******************************************************************************
 * Pigcop_Berzerker generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Pigcop_Berzerker extends PigCop_Grunt
	config
	collapsecategories;

var int PainRefID;

static function class<AIActor> GetSpawnClass(AIActorFactory Factory)
{
	return default.Class;
	return;
}

function AIActor_AnimEnd(int Channel, name AnimName, int RefId)
{
	super(AIActor).AIActor_AnimEnd(Channel, AnimName, RefId);
	// End:0x49
	if(__NFUN_173__(PainRefID, RefId))
	{
		AnimCtrl.m_oController.EmptyAnimChannel('Weapon_Ref');
		GroundSpeedScale = 1;
	}
	return;
}

event EnumerateWeaponClasses(PrecacheIndex PrecacheIndex, out array< class<Weapon> > WeaponClasses)
{
	return;
}

defaultproperties
{
	StartBezerk=true
	WeaponConfig='WeaponCfg_PigCopCaptain'
	Weapons(0)=class'm_aTarget'
	Weapons(1)=none
	Weapons(2)=class'TargetPos'
	Weapons(3)=class'Level'
	Weapons(4)=class'LinearVelocity'
	Weapons(5)=class'Level'
	Weapons(6)=class'NewActionPoint'
	Weapons(7)=class'm_aTarget'
	Weapons(8)=class'AIActor'
	Weapons(9)=class'ScriptObj'
	Weapons(10)=
/* Exception thrown while deserializing Weapons
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealPackage.GetIndexObject(Int32 objectIndex) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealPackage.cs:line 1821
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 559 */
	Weapons(11)=class'GotoXParms'
	Weapons(12)=class'RegisterAIAnimationControllerEntry'
	Weapons(13)=class'PrecacheIndex'
	Weapons(14)=class'm_aTarget'
	Weapons(15)=class'm_aTarget'
	Weapons(16)=class'Destructible_Armor'
	Weapons(17)=class'PrecacheIndex'
	Weapons(18)=class'acPigCop_Bezerk'
	Weapons(19)=class'i'
	Weapons(20)=class'AnimXParms'
	Weapons(21)=none
	Weapons(22)=class'ReturnValue'
	Weapons(23)=class'i'
	Weapons(24)=class'NewFaction'
	Weapons(25)=class'PrecacheIndex'
	Weapons(26)=
/* Exception thrown while deserializing Weapons
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealPackage.GetIndexObject(Int32 objectIndex) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealPackage.cs:line 1821
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 559 */
	Weapons(27)=class'PrimaryTargetActor'
	Weapons(28)=class'AnimXParms'
	Weapons(29)=none
	Weapons(30)=class'C'
	Weapons(31)=class'PrecacheIndex'
	Weapons(32)=none
	Weapons(33)=none
	Weapons(34)=none
	Weapons(35)=none
	Weapons(36)=class'm_RelationOverrides'
	Weapons(37)=class'PrecacheIndex'
	Weapons(38)=none
	Weapons(39)=none
	Weapons(40)=none
	Weapons(41)=none
	Weapons(42)=class'i'
	Weapons(43)=class'JumpAttackParms'
	Weapons(44)=class'Code'
	Weapons(45)=class'JumpAttackParms'
	Weapons(46)=class'Cycloid_Shockwave_Sensor'
	Weapons(47)=class'JumpAttackParms'
	Weapons(48)=class'bForceHaywire'
	Weapons(49)=class'JumpAttackParms'
	Weapons(50)=class'AnimThreshold'
	Weapons(51)=class'PrecacheIndex'
	Weapons(52)=none
	Weapons(53)=none
	Weapons(54)=none
	Weapons(55)=none
	Weapons(56)=class'bDetaching'
	Weapons(57)=class'AnimName'
	Weapons(58)=class'PrecacheIndex'
	Weapons(59)=class'Pregnator'
	Weapons(60)=class'TickingAIList'
	Weapons(61)=none
	Weapons(62)=none
	Weapons(63)=none
	Weapons(64)=none
	Weapons(65)=class'acBattleLordBoss'
	Weapons(66)=class'TickingAIList'
	Weapons(67)=none
	Weapons(68)=none
	Weapons(69)=none
	Weapons(70)=none
	Ident=/* Unknown default property type! */
	AnimRateVariance=true
	bTryBackupPathingOnFailure=true
	InitialAnimController=6
	AnimControllers[4]=(m_eFallback=1,m_cClass='acPigCop_Bezerk',m_oController=none)
	JumpAttackParms=(TargetActor=none,Mode=0,Type=0,AttackOnTakeoff=false,Attacked=false,AttackSuccess=false,AppliedJumpVel=false,RefId=0,FrameVelocity=(X=1.298303E-41,Y=3.773024E-17,Z=0),Z=0)
	ShowPain=false
	MinPainOpInterval=0.4
	MaxConsecutivePainOp=3
	MaxConsecutivePainInterval=1
	bDontUseAIOPPain=true
	MeleeZone=60
	bNeverFailOnDynamicPath=true
}