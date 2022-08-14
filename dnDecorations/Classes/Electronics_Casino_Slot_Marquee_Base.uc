/*******************************************************************************
 * Electronics_Casino_Slot_Marquee_Base generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Casino_Slot_Marquee_Base extends Electronics_Casino
	collapsecategories;

var() noexport int Dollars "Dollar value of marquee";
var() noexport int DollarsPerUpdate "Dollars per update that the marquee increases by.";
var() noexport float UpdateTime "How often to update marqee in seconds";
var array<MaterialEx> NumberMaterials;
var array<int> DigitSectionMap;

function UpdateJackpot()
{
	local int i, mod;

	i = 0;
	mod = 10;
	__NFUN_180__(Dollars, DollarsPerUpdate);
	// End:0x3D
	if(__NFUN_170__(Dollars, 99999999))
	{
		Dollars = 99999999;
		__NFUN_606__('UpdateJackpot');
	}
	J0x3D:

	// End:0xCB [Loop If]
	if(__NFUN_169__(i, 8))
	{
		// End:0x8A
		if(__NFUN_170__(__NFUN_162__(Dollars, 10), mod))
		{
			__NFUN_741__(DigitSectionMap[i], NumberMaterials[__NFUN_163__(__NFUN_164__(Dollars, mod), __NFUN_163__(mod, 10))]);			
		}
		else
		{
			J0x8A:

			// End:0xB5 [Loop If]
			if(__NFUN_169__(i, 8))
			{
				__NFUN_741__(DigitSectionMap[i], NumberMaterials[0]);
				__NFUN_184__(i);
				// [Loop Continue]
				goto J0x8A;
			}
			return;
		}
		__NFUN_184__(i);
		__NFUN_178__(mod, float(10));
		// [Loop Continue]
		goto J0x3D;
	}
	return;
}

simulated event PostBeginPlay()
{
	super(dnDecoration).PostBeginPlay();
	__NFUN_605__(UpdateTime, true, 'UpdateJackpot',,, true);
	return;
}

event Destroyed()
{
	super(dnDecoration).Destroyed();
	__NFUN_606__('UpdateJackpot');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	i = __NFUN_166__(string(NumberMaterials), 1);
	J0x1A:

	// End:0x47 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1269__(NumberMaterials[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1A;
	}
	return;
}

defaultproperties
{
	DollarsPerUpdate=1
	UpdateTime=0.0333333
	NumberMaterials(0)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-0_fb'
	NumberMaterials(1)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-1_fb'
	NumberMaterials(2)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-2_fb'
	NumberMaterials(3)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-3_fb'
	NumberMaterials(4)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-4_fb'
	NumberMaterials(5)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-5_fb'
	NumberMaterials(6)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-6_fb'
	NumberMaterials(7)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-7_fb'
	NumberMaterials(8)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-8_fb'
	NumberMaterials(9)='smt_skins8.LK_slotmarquee.SlotMarqueeNum-9_fb'
	DigitSectionMap(0)=9
	DigitSectionMap(1)=8
	DigitSectionMap(2)=7
	DigitSectionMap(3)=4
	DigitSectionMap(4)=2
	DigitSectionMap(5)=3
	DigitSectionMap(6)=5
	DigitSectionMap(7)=6
	HealthPrefab=0
	CollisionRadius=105
	CollisionHeight=34.5
	TickStyle=2
	StaticMesh='sm_lvl_ladykiller.Casino.LK_SlotMarqueeBase'
}