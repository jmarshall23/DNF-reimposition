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

simulated function Tick(float Delta)
{
	super(Actor).Tick(Delta);
	TickScreenFlashes(Delta);
}

simulated function DrawNewCrosshair(Canvas C)
{
	local int width;
	local int height;
	local Actor HitActor;
	local AIActor HitAIActor;

	width = CrosshairTextures[5].GetUSize();
	height = CrosshairTextures[5].GetVSize();	
	
	HitActor = PlayerOwner.TraceFromCrosshairMesh(6000);
	HitAIActor = AIActor(HitActor);

	if(HitAIActor != none)
	{
		C.DrawColor = RedColor;
	}

	C.SetPos(ScaleWidth(C, 640 - (width / 2)), ScaleHeight(C, 360 - (height / 2)));
	C.DrawTile(CrosshairTextures[5], width, height, 0, 0, width, height);
	
	C.DrawColor = WhiteColor;
}

simulated event PostPostRender(Canvas C)
{
	local int ego;
	local int currentAmmo;

	bHideHUD = false;
	bHideCrosshair = false;

	DrawNewCrosshair(C);

	C.SetPos(0, C.SizeY-ScaleHeight(C, 113));
	C.DrawTile(dnHudBackground, C.SizeX, ScaleHeight(C, 190), 0, 0, 1920, 256);

	ego = PlayerOwner.Ego;

	if(ego >= 100)
	{
		C.SetPos(ScaleWidth(C, 225), C.SizeY-ScaleHeight(C,63));
	}
	else if(ego >= 10)
	{
		C.SetPos(ScaleWidth(C, 238), C.SizeY-ScaleHeight(C,63));
	}
	else
	{
		C.SetPos(ScaleWidth(C, 251), C.SizeY-ScaleHeight(C,63));
	}
	C.DrawText(ego, false, false, false, 2.0, 2.0);

	if(PlayerOwner.Weapon != none)
	{
		if(PlayerOwner.Weapon.GetMaximumAmmo() > 0)
		{
			currentAmmo = PlayerOwner.Weapon.GetTotalAmmo();

			if(currentAmmo >= 100)
			{
				C.SetPos(ScaleWidth(C, 752), C.SizeY-ScaleHeight(C,63));
			}
			else if(currentAmmo >= 10)
			{
				C.SetPos(ScaleWidth(C, 765), C.SizeY-ScaleHeight(C,63));
			}
			else
			{
				C.SetPos(ScaleWidth(C, 778), C.SizeY-ScaleHeight(C,63));
			}

			C.DrawText(PlayerOwner.Weapon.GetTotalAmmo(), false, false, false, 2.0, 2.0);			
		}
	}
}

function SaveComplete()
{
	super.SaveComplete();
}

defaultproperties
{
	dnHudBackground=dukeui.ui.hud
}