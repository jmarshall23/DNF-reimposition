/*******************************************************************************
 * Containers_Crates_InfiniteAmmo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Containers_Crates_InfiniteAmmo extends Containers_Generic
	collapsecategories;

enum EAmmoCrateState
{
	ACS_Closed,
	ACS_Opening,
	ACS_Open,
	ACS_Closing
};

var Containers_Crates_InfiniteAmmo.EAmmoCrateState CrateState;
var Biology_Generic_AlienSensor Sensor;
var name OpenAnim;
var name IdleOpenAnim;
var name CloseAnim;
var name IdleClosedAnim;

simulated function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	FindAndPlaySound('InfAmmoCrate_Amb');
	Sensor = Biology_Generic_AlienSensor(FindMountedActor(, class'Biology_Generic_AlienSensor'));
	// End:0x46
	if(__NFUN_340__(Sensor, none))
	{
		Sensor.__NFUN_1124__(75);
	}
	FullyClosed();
	return;
}

final simulated function GiveAmmo()
{
	// End:0x3D
	if(Instigator.InfiniteAmmoCrateUsed())
	{
		// End:0x3D
		if(__NFUN_148__(bDoOverlayEffect, __NFUN_206__(OverlayEffectAlphaTarget, 0)))
		{
			FadeOverlayEffect(0, 1);
		}
	}
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x20
	if(__NFUN_150__(__NFUN_173__(int(CrateState), int(1)), __NFUN_173__(int(CrateState), int(3))))
	{
		return false;
	}
	return super(InteractiveActor).CanBeUsedBy(User);
	return;
}

simulated function Used(Actor Other, Pawn EventInstigator)
{
	Instigator = EventInstigator;
	// End:0x2F
	if(__NFUN_173__(int(CrateState), int(0)))
	{
		CrateState = 1;
		DecoPlayAnim(OpenAnim);		
	}
	else
	{
		// End:0x43
		if(__NFUN_173__(int(CrateState), int(2)))
		{
			GiveAmmo();
		}
	}
	return;
}

function OnSenseHumanPawn()
{
	return;
}

function OnUnsenseHumanPawn()
{
	// End:0x21
	if(__NFUN_173__(int(CrateState), int(2)))
	{
		CrateState = 3;
		DecoPlayAnim(CloseAnim);
	}
	return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
	super(dnDecoration).AnimEndEx(AnimEndInfo);
	// End:0x29
	if(__NFUN_341__(AnimEndInfo.AnimName, OpenAnim))
	{
		FullyOpened();		
	}
	else
	{
		// End:0x44
		if(__NFUN_341__(AnimEndInfo.AnimName, CloseAnim))
		{
			FullyClosed();
		}
	}
	return;
}

final simulated function FullyOpened()
{
	GiveAmmo();
	CrateState = 2;
	// End:0x2D
	if(__NFUN_339__(Sensor.__NFUN_1122__(false, true), none))
	{
		OnUnsenseHumanPawn();		
	}
	else
	{
		DecoLoopAnim(IdleOpenAnim);
	}
	return;
}

final simulated function FullyClosed()
{
	CrateState = 0;
	DecoLoopAnim(IdleClosedAnim);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'InfAmmoCrate_Amb');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'InfAmmoCrate_Open');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'InfAmmoCrate_Close');
	PrecacheIndex.__NFUN_1284__(Mesh, OpenAnim);
	PrecacheIndex.__NFUN_1284__(Mesh, IdleOpenAnim);
	PrecacheIndex.__NFUN_1284__(Mesh, CloseAnim);
	PrecacheIndex.__NFUN_1284__(Mesh, IdleClosedAnim);
	return;
}

defaultproperties
{
	OpenAnim=Open
	IdleOpenAnim=idle_open
	CloseAnim=Close
	IdleClosedAnim=idle_closed
	bUsable=true
	MountOnSpawn=/* Array type was not detected. */
	SpawnClass='Biology_Generic_AlienSensor'
	SpawnChance=0
	MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	RenderObject=none
	DrawScale=0
}