/*******************************************************************************
 * SlotMachineInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SlotMachineInfo extends Object
	abstract;

var() const noexport int MaxDamage "Max damage we can take.";
var() const noexport Texture PayoutTextures[30] "Textures for the payout display.";
var() const noexport Texture PayoutTextureNone "Texture for the payout display.";
var() const noexport Texture PayoutTextureBlank "Blank Texture for the payout display.";
var() const noexport int PayoutBlinks "How many times to blink the payout display when user wins.";
var() const noexport float InitialSpinTime "How long to spin before first rotor stops?";
var() const noexport float AdditionalRotorSpinTime "How much longer for each additional rotor";
var() const noexport int RotorSectionID[3] "Base Section ID for the rotors.";
var() const noexport int PayoutSectionID "Section ID for the payout texture.";
var() const noexport int RotorSymbols "The number of symbols on each rotor.";
var() const noexport int RotorMaxVelocity "RotorTopVelocity - Fastest a rotor can spin.";
var() const noexport int RotorSymbolOffset[3] "Offset (in no of symbols) of the default starting symbol from the first symbol at the top of the texture.";
var() const noexport int Rotor1SymbolTable[8] "List of symbols on the 1st rotor";
var() const noexport int Rotor2SymbolTable[8] "List of symbols on the 2nd rotor";
var() const noexport int Rotor3SymbolTable[8] "List of symbols on the 3rd rotor";
var() const noexport MaterialEx SymbolTextures[8] "Static materials to display when machine is not active.  Helps reduce number of unqiue materials.";

defaultproperties
{
	MaxDamage=20
	PayoutTextures[0]='dt_Electronics.SlotMachines.slotled_1'
	PayoutTextures[1]='dt_Electronics.SlotMachines.slotled_2'
	PayoutTextures[2]='dt_Electronics.SlotMachines.slotled_3'
	PayoutTextures[3]='dt_Electronics.SlotMachines.slotled_5'
	PayoutTextures[4]='dt_Electronics.SlotMachines.slotled_10'
	PayoutTextures[5]='dt_Electronics.SlotMachines.slotled_15'
	PayoutTextures[6]='dt_Electronics.SlotMachines.slotled_20'
	PayoutTextures[7]='dt_Electronics.SlotMachines.slotled_25'
	PayoutTextures[8]='dt_Electronics.SlotMachines.slotled_30'
	PayoutTextures[9]='dt_Electronics.SlotMachines.slotled_40'
	PayoutTextures[10]='dt_Electronics.SlotMachines.slotled_50'
	PayoutTextures[11]='dt_Electronics.SlotMachines.slotled_75'
	PayoutTextures[12]='dt_Electronics.SlotMachines.slotled_80'
	PayoutTextures[13]='dt_Electronics.SlotMachines.slotled_120'
	PayoutTextures[14]='dt_Electronics.SlotMachines.slotled_160'
	PayoutTextures[15]='dt_Electronics.SlotMachines.slotled_240'
	PayoutTextures[16]='dt_Electronics.SlotMachines.slotled_800'
	PayoutTextures[17]='dt_Electronics.SlotMachines.slotled_1600'
	PayoutTextures[18]='dt_Electronics.SlotMachines.slotled_2400'
	PayoutTextureNone='dt_Electronics.SlotMachines.slotled_blank'
	PayoutTextureBlank='dt_Electronics.SlotMachines.slotled_blank'
	PayoutBlinks=10
	InitialSpinTime=4.2
	AdditionalRotorSpinTime=0.8
	RotorSectionID[0]=2
	RotorSectionID[1]=3
	RotorSectionID[2]=4
	PayoutSectionID=5
	RotorSymbols=8
	RotorMaxVelocity=600
	RotorSymbolOffset[0]=4
	RotorSymbolOffset[1]=4
	RotorSymbolOffset[2]=4
	Rotor1SymbolTable[1]=1
	Rotor1SymbolTable[2]=3
	Rotor1SymbolTable[3]=4
	Rotor1SymbolTable[4]=5
	Rotor1SymbolTable[5]=2
	Rotor1SymbolTable[6]=3
	Rotor1SymbolTable[7]=1
	Rotor2SymbolTable[0]=1
	Rotor2SymbolTable[1]=5
	Rotor2SymbolTable[2]=4
	Rotor2SymbolTable[4]=3
	Rotor2SymbolTable[5]=2
	Rotor2SymbolTable[7]=3
	Rotor3SymbolTable[0]=3
	Rotor3SymbolTable[2]=4
	Rotor3SymbolTable[3]=1
	Rotor3SymbolTable[4]=2
	Rotor3SymbolTable[5]=5
	Rotor3SymbolTable[6]=3
	Rotor3SymbolTable[7]=2
	SymbolTextures[0]='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	begin object name=SlotMachine_TexPanner_Symbol_01 class=TexPanner
		PanRate=0
		ShiftY=64
		Material='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	object end
	// Reference: TexPanner'SlotMachineInfo.SlotMachine_TexPanner_Symbol_01'
	SymbolTextures=SlotMachine_TexPanner_Symbol_01
	begin object name=SlotMachine_TexPanner_Symbol_02 class=TexPanner
		PanRate=0
		ShiftY=128
		Material='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	object end
	// Reference: TexPanner'SlotMachineInfo.SlotMachine_TexPanner_Symbol_02'
	SymbolTextures=SlotMachine_TexPanner_Symbol_02
	begin object name=SlotMachine_TexPanner_Symbol_03 class=TexPanner
		PanRate=0
		ShiftY=192
		Material='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	object end
	// Reference: TexPanner'SlotMachineInfo.SlotMachine_TexPanner_Symbol_03'
	SymbolTextures=SlotMachine_TexPanner_Symbol_03
	begin object name=SlotMachine_TexPanner_Symbol_04 class=TexPanner
		PanRate=0
		ShiftY=256
		Material='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	object end
	// Reference: TexPanner'SlotMachineInfo.SlotMachine_TexPanner_Symbol_04'
	SymbolTextures=SlotMachine_TexPanner_Symbol_04
	begin object name=SlotMachine_TexPanner_Symbol_05 class=TexPanner
		PanRate=0
		ShiftY=320
		Material='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	object end
	// Reference: TexPanner'SlotMachineInfo.SlotMachine_TexPanner_Symbol_05'
	SymbolTextures=SlotMachine_TexPanner_Symbol_05
	begin object name=SlotMachine_TexPanner_Symbol_06 class=TexPanner
		PanRate=0
		ShiftY=384
		Material='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	object end
	// Reference: TexPanner'SlotMachineInfo.SlotMachine_TexPanner_Symbol_06'
	SymbolTextures=SlotMachine_TexPanner_Symbol_06
	begin object name=SlotMachine_TexPanner_Symbol_07 class=TexPanner
		PanRate=0
		ShiftY=448
		Material='smt_skins3.SlotMachine.tumblerslot1_finalblendtest'
	object end
	// Reference: TexPanner'SlotMachineInfo.SlotMachine_TexPanner_Symbol_07'
	SymbolTextures=SlotMachine_TexPanner_Symbol_07
}