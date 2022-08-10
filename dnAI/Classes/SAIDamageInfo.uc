struct SAIDamageInfo
{
	var bool Valid;
	var Pawn Instigator;
	var float Damage;
	var Engine.Object.EPawnBodyPart Part;
	var class<DamageType> DamageType;
	var Vector pos;
	var Vector Dir;
	var float Time;
};