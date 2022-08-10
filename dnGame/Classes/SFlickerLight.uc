struct SFlickerLight
{
	var StochasticSpawner_FlickerLights FlickerLightActor;
	var TriggerLightEx FlickerLightExActor;
	var() noexport bool bUseFlickerLight "Spawn a flickering system when this actor dies.";
	var() noexport bool bUseFlickerLightEx "Spawn a flickering system when this actor dies.";
	var() noexport bool bInitialEffect "Whether to spawn an initial flash or not.";
	var() noexport bool bInitialEffectOnly "When the initial effect is spawned, no other flickers will occur.";
	var() SMountPrefab FlickerLightMounting;
	var() noexport float FlickerLightExRadius "The radius of the light in world units. Leaving empty leaves it default.";
	var() noexport Vector FlickerLightExRadius3D "The 3d radius of the light in world units. Leaving empty leaves it default.";
	var() noexport Color FlickerLightExColor "The color of the light. Leaving black makes it default light color.";
	var() SMountPrefab FlickerLightExMounting;
	var() noexport float FlickerLightExIntensity "The intensity of the light.";
};