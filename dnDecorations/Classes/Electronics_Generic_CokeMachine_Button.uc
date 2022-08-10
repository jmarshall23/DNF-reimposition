/*******************************************************************************
 * Electronics_Generic_CokeMachine_Button generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_CokeMachine_Button extends Electronics_Generic
	dependson(Electronics_Generic_CokeMachine_Door)
	dependson(Electronics_Generic_CokeMachine);

var bool bCanPush;
var Electronics_Generic_CokeMachine_Door DoorOwner;
var MaterialEx CanMaterial;

function PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	DoorOwner = Electronics_Generic_CokeMachine_Door(Owner);
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	FindAndPlaySound('VendingMachine_Button');
	// End:0x31
	if(bCanPush)
	{
		__NFUN_646__(1, true);
		bCanPush = false;
	}
	return;
}

final function PushInDone()
{
	__NFUN_646__(0, true);
	DoorOwner.MachineOwner.SpawnItem(CanMaterial);
	return;
}

final function PushOutDone()
{
	bCanPush = true;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'VendingMachine_Button');
	return;
}

defaultproperties
{
	bCanPush=true
	HealthPrefab=0
	bUsable=true
	bBlockKarma=false
	DesiredLocation=/* Array type was not detected. */
}