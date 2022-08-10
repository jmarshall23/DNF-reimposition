/*******************************************************************************
 * Industrial_Generic_RoadBarricade generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_RoadBarricade extends Industrial_Generic
	collapsecategories;

var array<dnDecoration> MountedDecorations;

event PostVerifySelf()
{
	local dnDecoration deco;

	super(dnDecoration).PostVerifySelf();
	// End:0x2A
	foreach __NFUN_753__(class'dnDecoration', deco)
	{
		MountedDecorations[MountedDecorations.Add(1)] = deco;		
	}	
	return;
}

event Destroyed()
{
	local int i;

	i = __NFUN_166__(string(MountedDecorations), 1);
	J0x0F:

	// End:0x3A [Loop If]
	if(__NFUN_172__(i, 0))
	{
		MountedDecorations[i].CriticalDamage();
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	super(dnDecoration).Destroyed();
	return;
}