class IceHUD extends DukeHUD;

var Color YellowBar;
var MaterialEx dnCrosshair;
var float BarOffset;
var texture GradientTexture;
var texture IndexBarLeftTexture;
var texture IndexBarBottomTexture;
var texture InventoryBarTopTexture;
var texture InventoryBarBotTexture;
var texture InventoryCatHLTexture;
var texture InventoryCatHLTexture2;
var texture MiscBarTabTexture;
var texture MiscBarHLTexture;
var texture HUDTemplateTexture;
var texture ItemSlantTexture;
var texture ItemSlantHLTexture;
var texture MiscBarTexture;
var texture MiscBarTexture2;
var texture NumberCircleTexture;

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

simulated event PostPostRender(Canvas C)
{
	local int ego;
	local int currentAmmo;
	local int loadedAmmo;
	local float egoPerct;
	local float ammoPerct;
	local float minorHudTextSize;
	local float majorHudTextSize;
	local float backScaleX;
	local float backScaleY;

	bHideHUD = false;
	bHideCrosshair = false;

	DrawNewCrosshair(C);

	backScaleX = ScaleWidth(C, 1.41);
	backScaleY = ScaleHeight(C, 1.41);

	C.Font = font'BlockFont';

	ego = PlayerOwner.Ego;

	if(PlayerOwner == none || PlayerOwner.EgoCap == 0)
	{
		egoPerct = 0;
	}
	else
	{
		egoPerct = ego / PlayerOwner.EgoCap;
	}

	if(PlayerOwner.Weapon == none || PlayerOwner.Weapon.GetMaximumAmmo() == 0)
	{
		loadedAmmo = 0;
		currentAmmo = 0;
		ammoPerct = 0;
	}
	else
	{
		loadedAmmo = PlayerOwner.Weapon.GetLoadedAmmo();
		currentAmmo = PlayerOwner.Weapon.GetTotalAmmo();
	
		if(PlayerOwner.Weapon.WeaponConfig.default.ReloadCount == 0)
		{
			ammoPerct = float(loadedAmmo) / float(PlayerOwner.Weapon.GetMaximumAmmo());
		}
		else
		{
			ammoPerct = float(loadedAmmo) / float(PlayerOwner.Weapon.WeaponConfig.default.ReloadCount);
		}

		// Log("ammoPerct = " $ ammoPerct $ " " $ loadedAmmo $ " " $ PlayerOwner.Weapon.WeaponConfig.default.ReloadClipAmmo);
	}	

	minorHudTextSize = ScaleWidth(C, 0.85 - (0.85 * 0.375));
	majorHudTextSize = ScaleWidth(C, 1.1 - (1.1 * 0.375));

	// Draw the index background bar.
	C.DrawColor = YellowBar;
	C.SetPos(0, C.SizeY-ScaleHeight(C, 143));	
	C.DrawScaledIcon(IndexBarLeftTexture, backScaleX, backScaleY);

	C.DrawColor = WhiteColor;
	C.SetPos(0, C.SizeY-ScaleHeight(C, 109));
	C.DrawText("EGO:",,,,minorHudTextSize,minorHudTextSize);
	DrawStatusBar(C, ScaleWidth(C, 65), C.SizeY-ScaleHeight(C, 117), ScaleWidth(C, 233), ScaleHeight(C, 36), egoPerct);
	C.SetPos(ScaleWidth(C, 310), C.SizeY-ScaleHeight(C, 113));
	C.DrawText("" $ ego,,,,majorHudTextSize,majorHudTextSize);
	
	if(PlayerOwner.Weapon != none && PlayerOwner.Weapon.GetMaximumAmmo() > 0)
	{
		C.SetPos(0, C.SizeY-ScaleHeight(C, 82));
		C.DrawText("CLIP:",,,,minorHudTextSize,minorHudTextSize);
		DrawStatusBar(C, ScaleWidth(C, 65), C.SizeY-ScaleHeight(C, 90), ScaleWidth(C, 166), ScaleHeight(C, 36), ammoPerct);
		C.SetPos(ScaleWidth(C, 250), C.SizeY-ScaleHeight(C, 86));
		C.DrawText("" $ loadedAmmo,,,,majorHudTextSize,majorHudTextSize);

		C.SetPos(0, C.SizeY-ScaleHeight(C, 55));
		C.DrawText("AMMO:",,,,minorHudTextSize,minorHudTextSize);
		C.SetPos(ScaleWidth(C, 65), C.SizeY-ScaleHeight(C, 55));
		C.DrawText("" $ currentAmmo,,,,minorHudTextSize,minorHudTextSize);
	}
}

defaultproperties
{
	YellowBar=(R=220,G=220,B=46,A=0)
	dnCrosshair=hud_effects.crosshairs.crosshair11BC
    GradientTexture=hud_effects.ingame_hud.ing_gradient1BC
	IndexBarLeftTexture=hud_effects.ingame_hud.ingame_main
	IndexBarBottomTexture=hud_effects.ingame_hud.ingame_main_repeat1bc
	InventoryBarTopTexture=hud_effects.ingame_hud.ingame_wepbar1BC
	InventoryBarBotTexture=hud_effects.ingame_hud.ingame_wepbar2BC
	InventoryCatHLTexture=hud_effects.ingame_hud.ingame_wepbar_highlight1bc
	InventoryCatHLTexture2=hud_effects.ingame_hud.ingame_wepbar_highlight2bc
	ItemSlantTexture=hud_effects.ingame_hud.ingame_itemslant1bc
	ItemSlantHLTexture=hud_effects.ingame_hud.ingame_itemslant_highlightbc
	MiscBarTexture=hud_effects.ingame_hud.ingame_miscbar1bc
	MiscBarTexture2=hud_effects.ingame_hud.ingame_miscbar2bc
	NumberCircleTexture=hud_effects.ingame_hud.ingame_numbercircleBC
	BarOffset=0.0
}