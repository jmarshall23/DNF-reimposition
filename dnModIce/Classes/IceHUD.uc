class IceHUD extends DukeHUD;

var MaterialEx dnHudBackground;

simulated event PreRender(Canvas Canvas)
{

}

simulated event PostPostRender(Canvas C)
{
	local int ego;

	C.SetPos(0, C.SizeY-153);
	C.DrawTile(dnHudBackground, C.SizeX, 256, 0, 0, 1920, 256);

	ego = PlayerOwner.Ego;

	C.SetPos(280, C.SizeY-93);
	C.DrawText(ego, false, false, false, 2.0, 2.0);

	if(PlayerOwner.Weapon != none)
	{
		if(PlayerOwner.Weapon.GetMaximumAmmo() > 0)
		{
			C.SetPos(940, C.SizeY-93);
			C.DrawText(PlayerOwner.Weapon.GetTotalAmmo(), false, false, false, 2.0, 2.0);			
		}
	}
}

defaultproperties
{
	dnHudBackground=dukeui.ui.hud
}