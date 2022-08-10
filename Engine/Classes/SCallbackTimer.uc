struct SCallbackTimer
{
	var float Rate;
	var float Counter;
	var int Loops;
	var const name CallbackName;
	var const transient Function Pointer;
	var bool bIndependent;
	var const bool bDeleted;
	var const bool bEnforceLoop;
};