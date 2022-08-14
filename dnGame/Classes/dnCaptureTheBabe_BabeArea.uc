/*******************************************************************************
 * dnCaptureTheBabe_BabeArea generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnCaptureTheBabe_BabeArea extends dnDecoration
	collapsecategories;

var(Team) byte Team;
var dnCaptureTheBabe_Babe babe;
var StaticMesh RedTeamMesh;

function PostBeginPlay()
{
	local dnCaptureTheBabe GameMode;
	local bool Found;

	Found = false;
	// End:0x24
	foreach __NFUN_747__(class'dnCaptureTheBabe', GameMode)
	{
		Found = true;
		// End:0x24
		break;		
	}	
	super.PostBeginPlay();
	FindBabes();
	// End:0x42
	if(__NFUN_145__(Found))
	{
		__NFUN_614__();		
	}
	else
	{
		// End:0x56
		if(__NFUN_173__(int(Team), 1))
		{
			__NFUN_595__(RedTeamMesh);
		}
	}
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	return;
}

event Bump(Actor Other)
{
	local dnCaptureTheBabe_Babe TouchedBabe;
	local dnCaptureTheBabe_Player TouchedPlayer;
	local bool bGrabberDead;

	super.Bump(Other);
	// End:0x13B
	if(Other.__NFUN_358__('dnCaptureTheBabe_Player'))
	{
		TouchedPlayer = dnCaptureTheBabe_Player(Other);
		// End:0x47
		if(__NFUN_145__(TouchedPlayer.bCarryingBabe))
		{
			return;
		}
		TouchedBabe = dnCaptureTheBabe_Babe(TouchedPlayer.carriedbabe);
		// End:0x13B
		if(__NFUN_174__(int(Team), int(TouchedBabe.Team)))
		{
			// End:0xB6
			if(__NFUN_340__(TouchedBabe.Grabber, none))
			{
				bGrabberDead = TouchedBabe.Grabber.IsDead();				
			}
			else
			{
				bGrabberDead = false;
			}
			// End:0x13B
			if(__NFUN_148__(__NFUN_340__(TouchedBabe.Grabber, none), __NFUN_145__(bGrabberDead)))
			{
				TouchedBabe.SetUnGrabbedByEnemy2();
				TouchedBabe.bGrabbable = false;
				__NFUN_355__(__NFUN_302__("CTB - Area Says scored with babe for team ", string(Team)));
			}
		}
	}
	return;
}

function FindBabes()
{
	local dnCaptureTheBabe_Single tempgame;

	// End:0x1B
	foreach __NFUN_747__(class'dnCaptureTheBabe_Single', tempgame)
	{
		babe = none;		
		return;		
	}	
	// End:0x55
	foreach __NFUN_747__(class'dnCaptureTheBabe_Babe', babe)
	{
		// End:0x4D
		if(__NFUN_173__(int(babe.Team), int(Team)))
		{
			// End:0x55
			break;
			// End:0x54
			continue;
		}
		babe = none;		
	}	
	// End:0xC6
	if(__NFUN_339__(babe, none))
	{
		__NFUN_355__(__NFUN_302__("WARNING! dnCaptureTheBabe_BabeArea::FindBabes: Could not find CaptureTheBabe Babe Team", string(Team)));
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1267__(RedTeamMesh, self);
	return;
}

defaultproperties
{
	RedTeamMesh='SM_Multiplayer.CTB.CTB_PlatformRed'
	MountOnSpawn(0)=(bSkipVerifySelf=false,SpawnClass='dnCaptureTheBabe_DiscoBallLights',SpawnChance=0,MountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=-20),MountOriginVariance=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	bBlockKarma=true
	bLowerByCollision=true
	bLowerAsPrePivot=false
	bAlwaysRelevant=true
	bUsePlayerCollisions=true
	CollisionRadius=100
	CollisionHeight=20
	DrawType=8
	StaticMesh='SM_Multiplayer.CTB.CTB_PlatformBlue'
}