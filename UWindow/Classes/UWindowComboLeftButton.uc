/*******************************************************************************
 * UWindowComboLeftButton generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowComboLeftButton extends UWindowButton;

function BeforePaint(Canvas C, float X, float Y)
{
	LookAndFeel.Combo_SetupLeftButton(self);
	return;
}

function LMouseDown(float X, float Y)
{
	local int i;

	super(UWindowWindow).LMouseDown(X, Y);
	// End:0x94
	if(__NFUN_145__(bDisabled))
	{
		i = UWindowComboControl(OwnerWindow).GetSelectedIndex();
		__NFUN_185__(i);
		// End:0x7A
		if(__NFUN_169__(i, 0))
		{
			i = __NFUN_166__(UWindowComboControl(OwnerWindow).List.Items.Count(), 1);
		}
		UWindowComboControl(OwnerWindow).SetSelectedIndex(i);
	}
	return;
}

defaultproperties
{
	bNoKeyboard=true
}