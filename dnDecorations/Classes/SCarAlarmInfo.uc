struct SCarAlarmInfo
{
	var() noexport bool bCarAlarming "When true, car alarm is going off.";
	var() noexport float CarAlarmChance "Percentage chance that car alarm will be set off from damage or impact.";
	var() noexport float CarAlarmDuration "Total amount of time for car alarm to exist.  0 means forever.";
	var() noexport float HornInterval "Time between horn honks.";
	var() noexport float AlarmStateInterval "Amount of time between alarm state changes.";
	var bool bPoweredBeforeAlarm;
};