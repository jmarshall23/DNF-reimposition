struct SClassEvent
{
	var() class<Actor> Class;
	var() noexport name Event "We will fire off this custom Event whenever we attach to an object of this class or a child class.";
};