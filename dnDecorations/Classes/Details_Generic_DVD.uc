/*******************************************************************************
 * Details_Generic_DVD generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_DVD extends Details_Generic
	collapsecategories;

var Electronics_Generic_DVDPlayer OwnerDVDPlayer;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	// End:0x22
	if(__NFUN_340__(Owner, none))
	{
		OwnerDVDPlayer = Electronics_Generic_DVDPlayer(Owner);
	}
	return;
}

function Grabbed(Pawn Grabber)
{
	// End:0x65
	if(__NFUN_340__(OwnerDVDPlayer, none))
	{
		// End:0x62
		if(__NFUN_340__(OwnerDVDPlayer.MountedCase, none))
		{
			Grabber.CarriedActor = OwnerDVDPlayer.MountedCase;
			Grabber.CarriedActor.Grabbed(Grabber);
			return;
		}		
	}
	else
	{
		super(dnDecoration).Grabbed(Grabber);
	}
	return;
}

defaultproperties
{
	HealthPrefab=0
	UsePhrase="<?int?dnDecorations.Details_Generic_DVD.UsePhrase?>"
	GrabInfo=(bCanDuckWhileHeld=true,MountItemOverride=mount_handright,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Plastic'
	bBlockActors=false
	bBlockPlayers=false
	bBlockKarma=false
	bCollideWorld=false
	CollisionRadius=2.56
	CollisionHeight=0.1
	StaticMesh='sm_class_decorations.DVDDisc.DVDDisc'
}