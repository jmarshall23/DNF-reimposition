/*******************************************************************************
 * Engine generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Engine extends Subsystem
	transient
	native
	config
	noexport;

var config class<RenderDevice> GameRenderDevice;
var(Drivers) config class<AudioSubsystem> AudioDevice;
var(Drivers) config class<Console> Console;
var(Drivers) config class<NetDriver> NetworkDevice;
var(Drivers) config class<Language> Language;
var Primitive Cylinder;
var const Client Client;
var const Render Render;
var const AudioSubsystem Audio;
var const OnlineSubsystem Online;
var const MetagameData MGData;
var const int ParticleEditorHWND;
var const array<int> ModelessHWNDs;
var bool bAllowInput;
var(Settings) config int CacheSizeMegs;
var(Settings) config bool UseSound;
var(Settings) float CurrentTickRate;
var const int pIXHVEnginePadding;
var const int hXHVThreadPadding;

// Export UEngine::execGetOnlineSubsystem(FFrame&, void* const)
native(503) static final function OnlineSubsystem GetOnlineSubsystem();

// Export UEngine::execGetMetagameDataSubsystem(FFrame&, void* const)
native(504) static final function MetagameData GetMetagameDataSubsystem();

defaultproperties
{
	NetworkDevice='Engine.AgentNetDriver'
	bAllowInput=true
	CacheSizeMegs=2
	UseSound=true
}