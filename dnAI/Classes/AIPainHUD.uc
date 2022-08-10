/*******************************************************************************
 * AIPainHUD generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AIPainHUD extends TriggerHUD
	collapsecategories;

exec function Rate(float X)
{
	local int i;
	local string str;

	// End:0x0E
	if(__NFUN_339__(m_aTarget, none))
	{
		return;
	}
	BroadcastLog(__NFUN_302__("Setting AnimRate of pain animations to ", string(X)));
	i = 7;
	J0x4E:

	// End:0xF7 [Loop If]
	if(__NFUN_169__(i, string(m_aTarget.AnimCtrl.m_oController.Animations)))
	{
		str = string(m_aTarget.AnimCtrl.m_oController.Animations[i].AnimSequence);
		// End:0xBE
		if(__NFUN_169__(__NFUN_315__(str, "pain"), 0))
		{
			// [Explicit Continue]
			goto J0xED;
		}
		m_aTarget.AnimCtrl.m_oController.Animations[i].AnimRate = X;
		J0xED:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x4E;
	}
	return;
}