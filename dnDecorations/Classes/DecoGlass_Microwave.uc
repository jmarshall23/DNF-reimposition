/*******************************************************************************
 * DecoGlass_Microwave generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DecoGlass_Microwave extends dnBreakableGlass_DecoGlass
	collapsecategories
	dependson(Electronics_Generic_Microwave);

var Electronics_Generic_Microwave MicrowaveActor;

event GlassCracked()
{
	super(dnBreakableGlass).GlassCracked();
	DecoGlassDamaged();
	return;
}

event GlassShattered()
{
	super(dnBreakableGlass).GlassShattered();
	DecoGlassDamaged();
	return;
}

final function DecoGlassDamaged()
{
	// End:0x1C
	if(__NFUN_340__(MicrowaveActor, none))
	{
		MicrowaveActor.GlassDamaged();
	}
	MicrowaveActor = none;
	return;
}

final function CrackSelf()
{
	MicrowaveActor = none;
	__NFUN_1080__(Location);
	return;
}

defaultproperties
{
	ParticleSize=3
	bRandomTextureRotation=false
	bAlignTextureOnBreak=false
	bStaticEdgePieces=false
	bDrawHUDInfo=true
	bForceUsePhrase=true
	bUsable=true
	StaticInteractionClassification=3
	DynamicInteractionClassification=1
	PhysicsEntityGroup=MicrowaveEntityGroup
	DrawScale3D=(X=1.291717E-41,Y=2.802795E-17,Z=16.5)
	Skins=/* Array type was not detected. */
	Roll[1]=
/* Exception thrown while deserializing Roll
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UnrealReader.ReadText() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 156
   at UELib.UObjectStream.ReadText() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 722
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 447 */
}