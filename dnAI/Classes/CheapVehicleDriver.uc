/*******************************************************************************
 * CheapVehicleDriver generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class CheapVehicleDriver extends AIActor
	config
	collapsecategories;

state UseX
{
	event BeginState()
	{
		super.BeginState();
		TickStyle = 0;
		__NFUN_590__(true);
		return;
	}

	event EndState()
	{
		TickStyle = default.TickStyle;
		__NFUN_590__(default.bHidden);
		super.EndState();
		return;
	}
	stop;
}

defaultproperties
{
	AnimControllers[0]=(m_eFallback=0,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[1]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[2]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[3]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[4]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[5]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[6]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[7]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	AnimControllers[8]=(m_eFallback=1,m_cClass='acCheapVehicleDriver',m_oController=none)
	DisableAimGrids=true
	bShrinkable=false
	Faction='Engine.AIFactionHuman'
	Health=20
	HealthCap=20
	bDumbMesh=true
	CollisionRadius=18
	Mesh='c_generic.BigError'
}