class IceHUD extends DukeHUD;

var MaterialEx dnHudBackground;

function float ScaleHeight(Canvas C, float value)
{
	return value * (c.SizeY / 720.0);
}

function float ScaleWidth(Canvas C, float value)
{
	return value * (c.SizeX / 1280.0);
}

simulated event PreRender(Canvas Canvas)
{

}

simulated event PostPostRender(Canvas C)
{
	local int ego;

	C.SetPos(0, C.SizeY-ScaleHeight(C, 113));
	C.DrawTile(dnHudBackground, C.SizeX, ScaleHeight(C, 190), 0, 0, 1920, 256);

	ego = PlayerOwner.Ego;

	C.SetPos(ScaleWidth(C, 238), C.SizeY-ScaleHeight(C,63));
	C.DrawText(ego, false, false, false, 1.0, 1.0);

	if(PlayerOwner.Weapon != none)
	{
		if(PlayerOwner.Weapon.GetMaximumAmmo() > 0)
		{
			C.SetPos(ScaleWidth(C, 765), C.SizeY-ScaleHeight(C,63));
			C.DrawText(PlayerOwner.Weapon.GetTotalAmmo(), false, false, false, 1.0, 1.0);			
		}
	}
}

defaultproperties
{
	dnHudBackground=dukeui.ui.hud
}