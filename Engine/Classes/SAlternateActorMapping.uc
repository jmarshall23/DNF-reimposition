struct SAlternateActorMapping
{
	var() noexport ControlRemapperEx.EControlRemapperMotionType MotionType "The key type this mapping applies to. This is only relevant for the basic movement (turn, strafe, forward/back) types.";
	var() noexport name Tag "Apply this mapping to all actors with this tag.";
	var() noexport float Scale "Pre-scale to multiply input value by before converting to rotation/location. (For example, turning 10 units with a scale of 4 would be the same as turning 40 units. A scale of 0.0 becomes a scale of 1.0.)";
	var() noexport Rotator RotationMultiplier "Multiply this rotator by the post-[Scale]d change in this motion type and then add it to the relevant actor's rotation.";
	var() noexport Vector LocationMultiplier "See [RotationMultiplier], but add it to the actor's location instead.";
	var() noexport bool bApplyAngularAbsolute "Set this to true to apply angular velocity as absolute in the world, otherwise it will be relative to the rotation of the actor.";
	var() noexport bool bApplyLinearAbsolute "Set this to true to apply linear velocity as absolute in the world, otherwise it will be relative to the rotation of the actor.";
	var() noexport bool bApplyAngularAsAcceleration "Set this to true to apply AngularVelocityMultiplier as acceleration instead of velocity.";
	var() noexport bool bApplyLinearAsAcceleration "Set this to true to apply LinearVelocityMultiplier as acceleration instead of velocity.";
	var() noexport Vector AngularVelocityMultiplier "How to affect angular velocity of a physics actor.";
	var() noexport Vector LinearVelocityMultiplier "How to affect linear velocity of a physics actor.";
};