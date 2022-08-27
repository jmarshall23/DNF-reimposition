// IceBot.uc
//

class IceBot extends DukeBot;

function Restart()
{
local bool bOnlyAmmo;

	super(DukeMultiPlayer).Restart();
    
    bOnlyAmmo = false;
    bCheatsEnabled = true;
    bAdmin = true;
    bInfiniteAmmo = true;
	switch(Rand(11))
    {
        // End:0x67
        case 0:
            GiveWeaponCheat("dnGame.MP_Pistol_Gold", bOnlyAmmo);
            // End:0x200
            break;
        // End:0x8D
        case 1:
            GiveWeaponCheat("dnGame.MP_RailGun", bOnlyAmmo);
            // End:0x200
            break;
        // End:0xB0
        case 2:
            GiveWeaponCheat("dnGame.MP_RPG", bOnlyAmmo);
            // End:0x200
            break;
        // End:0xDA
        case 3:
            GiveWeaponCheat("dnGame.MP_Devastator", bOnlyAmmo);
            // End:0x200
            break;
        // End:0x103
        case 4:
            GiveWeaponCheat("dnGame.MP_RPG", bOnlyAmmo); // Was MP_ShrinkRay but they don't do well with this gun.
            // End:0x200
            break;
        // End:0x12C
        case 5:
            GiveWeaponCheat("dnGame.MP_Shotgun", bOnlyAmmo); // Was MP_FreezeRay but they don't do well with this gun.
            // End:0x200
            break;
        // End:0x153
        case 6:
            GiveWeaponCheat("dnGame.MP_ATLaser", bOnlyAmmo);
            // End:0x200
            break;
        // End:0x17E
        case 7:
            GiveWeaponCheat("dnGame.MP_EnforcerGun", bOnlyAmmo);
            // End:0x200
            break;
        // End:0x1AC
        case 8:
            GiveWeaponCheat("dnGame.MP_ATCaptainLaser", bOnlyAmmo);
            // End:0x200
            break;
        // End:0x1D3
        case 9:
            GiveWeaponCheat("dnGame.MP_Shotgun", bOnlyAmmo);
            // End:0x200
            break;
        // End:0x1FD
        case 10:
            GiveWeaponCheat("dnGame.MP_MachineGun", bOnlyAmmo);
            // End:0x200
            break;
        // End:0xFFFF
        default:
            break;
    }
}

simulated function bool WantsToFire(Weapon W)
{
	if(!super.WantsToFire(W))
		return false;

	if(Target == none || Pawn(Target).IsDead())
		return false;

    // If we can't see the target dont shoot. 
    if(!FastTrace(Target.Location))
        return false;

	return true;
}