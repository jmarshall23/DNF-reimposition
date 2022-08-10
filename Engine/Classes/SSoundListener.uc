struct SSoundListener
{
	var noexport Actor Listener "An actor we can hear from";
	var noexport Coords ToListenerLocal "To local transformation for this listner, in D3D coordinate system.";
};