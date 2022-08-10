struct HUDLocalizedMessage
{
	var class<LocalMessage> Message;
	var int Switch;
	var PlayerReplicationInfo RelatedPRI;
	var Object OptionalObject;
	var float EndOfLife;
	var float Lifetime;
	var bool bDrawing;
	var bool bIcon;
	var int numLines;
	var string StringMessage;
	var Color DrawColor;
	var float XL;
	var float YL;
	var float YPos;
};