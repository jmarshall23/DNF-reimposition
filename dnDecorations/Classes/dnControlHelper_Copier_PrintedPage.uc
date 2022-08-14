/*******************************************************************************
 * dnControlHelper_Copier_PrintedPage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Copier_PrintedPage extends Details_Generic
	dependson(dnControl_Copier);

const PAPER_THICKNESS = 0.025f;

var dnControl_Copier OwnerCopier;
var int PageNumber;
var float BaseDropHeight;
var float DropUnitsPerSecond;
var float SlideOutOffset;
var float SlideOutTime;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	OwnerCopier = dnControl_Copier(Owner);
	return;
}

final function SetPageNumber(int NewPageNumber)
{
	PageNumber = NewPageNumber;
	return;
}

final function SlideOutOfCopier()
{
	local SDesiredLocation DL;

	DL.Target = MountOrigin;
	__NFUN_209__(DL.Target.Y, SlideOutOffset);
	DL.TimeTotal = SlideOutTime;
	DL.Style = 0;
	DL.FunctionComplete = 'SlideComplete';
	__NFUN_650__(DL);
	TickStyle = 3;
	bNoNativeTick = false;
	return;
}

final function SlideComplete()
{
	local SDesiredLocation DL;
	local float DropHeight;

	DropHeight = __NFUN_199__(BaseDropHeight, __NFUN_195__(float(PageNumber), 0.025));
	DL.Target = MountOrigin;
	__NFUN_210__(DL.Target.Z, DropHeight);
	DL.TimeTotal = __NFUN_196__(DropHeight, DropUnitsPerSecond);
	DL.Style = 0;
	DL.FunctionComplete = 'DropComplete';
	__NFUN_650__(DL);
	TickStyle = 3;
	bNoNativeTick = false;
	return;
}

final function DropComplete()
{
	TickStyle = default.TickStyle;
	bNoNativeTick = default.bNoNativeTick;
	bNoDamage = false;
	bCastStencilShadows = false;
	// End:0x44
	if(__NFUN_340__(OwnerCopier, none))
	{
		OwnerCopier.FinishMakeCopy();
	}
	return;
}

defaultproperties
{
	BaseDropHeight=3.4
	DropUnitsPerSecond=20
	SlideOutOffset=17.2
	SlideOutTime=3.6
	HealthPrefab=1
	bNoDamage=true
	SpawnOnDestroyedSimple(0)='dnParticles.dnDebris_Paper1'
	bIgnoresPhysicsDamage=true
	Physics=9
	bBlockActors=false
	bBlockPlayers=false
	bBlockKarma=false
	bCollideWorld=false
	CollisionRadius=6
	CollisionHeight=0.1
	DrawType=2
	Mesh='c_generic.Paper_Sheaf'
	Skins(0)='dt_Props.Paper.buttscanRC_diff'
}