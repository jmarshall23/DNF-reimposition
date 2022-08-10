struct SPendingActivity
{
	var() noexport name ActivateSequence "Name of the sequence we're waiting for to end to activate. If left blank then *any* animation completing will trigger a pending activity.";
	var() noexport dnDecoration.EDecoActivityID ActivityID "Identification of what activity to execute. Used, Triggered, Etc.";
	var() noexport name ActivityIDScript "Generally a coder defined identification for what activity to execute.";
};