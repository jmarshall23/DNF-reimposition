/*******************************************************************************
 * MP_EnforcerGunPickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_EnforcerGunPickup extends MP_WeaponPickup
	collapsecategories;

defaultproperties
{
	ItemName="<?int?dnGame.MP_EnforcerGunPickup.ItemName?>"
	InventoryType='MP_EnforcerGun'
	RespawnTime=20
	PhysicsSoundOverrides(0)=(SoundType=0,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=('a_impact.Generic.Weap_Drop_AltSci_01','a_impact.Generic.Weap_Drop_AltSci_02','a_impact.Generic.Weap_Drop_AltSci_03','a_impact.Generic.Weap_Drop_AltSci_04'),SoundInfo=(InputRange=(Min=10,Max=250),OutputPitchRange=(Min=0.9,Max=1),OutputVolumeRange=(Min=0.5,Max=1)),bDisableSoundInWater=true)
	PhysicsSoundOverrides(1)=(SoundType=1,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=none,SoundInfo=(InputRange=(Min=0,Max=0),OutputPitchRange=(Min=0,Max=0),OutputVolumeRange=(Min=0,Max=0)),bDisableSoundInWater=false)
	PhysicsSoundOverrides(2)=(SoundType=2,OtherMaterialTypes=none,OtherMassTypes=none,Sounds=none,SoundInfo=(InputRange=(Min=0,Max=0),OutputPitchRange=(Min=0,Max=0),OutputVolumeRange=(Min=0,Max=0)),bDisableSoundInWater=false)
	bBlockKarma=true
	StaticMesh='sm_class_dukeitems.Enforcer_Gun_pickup.Enforcer_Gun_pickup'
	Skins(0)='dt_multiplayer_shared.Weapons.Enfgun2_BS'
}