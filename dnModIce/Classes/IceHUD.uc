class IceHUD extends DukeHUD;

var MaterialEx dnHudBackground;
var MaterialEx dnCrosshair;

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
	TickEgoChanges(Delta);
	TickPickupEvents(Delta);
	TickStatusIndex(Delta);
	TickHUDEffects(Delta);
	TickQuestItemInfo(Delta);
	TickInventory(Delta);
}

simulated function DrawNewCrosshair(Canvas C)
{
	local int width;
	local int height;
	local Actor HitActor;
	local AIActor HitAIActor;
	local int i;

	width = dnCrosshair.GetUSize();
	height = dnCrosshair.GetVSize();	
	
	HitActor = PlayerOwner.TraceFromCrosshairMesh(6000);
	HitAIActor = AIActor(HitActor);

	if(HitAIActor != none)
	{
		C.DrawColor = RedColor;
	}

	for(i = 0; i < 3; i++)
	{
		C.SetPos(ScaleWidth(C, 640 - (width / 2)), ScaleHeight(C, 360 - (height / 2)));
		C.DrawTile(dnCrosshair, width, height, 0, 0, width, height);	
	}
	
	C.DrawColor = WhiteColor;
}

event DrawRosterText(Canvas C, int x, int y, string ammoCommand, string weaponId)
{
	y = y - 5;

	C.SetPos(ScaleWidth(C, x), C.SizeY-ScaleHeight(C,y));

	if(PlayerOwner.ConsoleCommand("CurrentWeapon") == weaponId)
	{
		C.DrawColor = WhiteColor;
	}
	else
	{
		C.DrawColor = GrayColor;
	}

	C.DrawText(PlayerOwner.ConsoleCommand(ammoCommand), false, false, false, 0.9, 0.9);
}

event DrawAmmoRoster(Canvas C)
{
	DrawRosterText(C, 430, 77, "GetWeapon1Ammo", "1");
	DrawRosterText(C, 430, 60, "GetWeapon2Ammo", "2");
	DrawRosterText(C, 430, 43, "GetWeapon3Ammo", "3");

	DrawRosterText(C, 510, 77, "GetWeapon4Ammo", "4");
	DrawRosterText(C, 510, 60, "GetWeapon5Ammo", "5");
	DrawRosterText(C, 510, 43, "GetWeapon6Ammo", "6");

	DrawRosterText(C, 590, 77, "GetWeapon7Ammo", "7");
	DrawRosterText(C, 590, 60, "GetWeapon8Ammo", "8");
	DrawRosterText(C, 590, 43, "GetWeapon9Ammo", "9");

	DrawRosterText(C, 650, 43, "GetWeapon0Ammo", "0");

	C.DrawColor = WhiteColor;
}

simulated event PostPostRender(Canvas C)
{
	local int ego;
	local int currentAmmo;

	bHideHUD = false;
	bHideCrosshair = false;

	DrawNewCrosshair(C);	

	C.SetPos(50, C.SizeY-ScaleHeight(C, 113));
	C.DrawTile(dnHudBackground, C.SizeX, ScaleHeight(C, 190), 0, 0, 1920, 256);

	DrawAmmoRoster(C);

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
	dnCrosshair=hud_effects.crosshairs.crosshair11BC
	dnHudBackground=dukeui.ui.minimalhud2
}