/*******************************************************************************
 * UDukeFavoritesFact generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeFavoritesFact extends UDukeServerListFactory
	config;

var config int FavoriteCount;
var config string Favorites[100];

function string ParseOption(string Input, int pos)
{
	local int i;

	J0x00:
	// End:0x8B [Loop If]
	if(true)
	{
		// End:0x48
		if(__NFUN_173__(pos, 0))
		{
			i = __NFUN_315__(Input, "\\");
			// End:0x42
			if(__NFUN_174__(i, -1))
			{
				Input = __NFUN_317__(Input, i);
			}
			return Input;
		}
		i = __NFUN_315__(Input, "\\");
		// End:0x6B
		if(__NFUN_173__(i, -1))
		{
			return "";
		}
		Input = __NFUN_316__(Input, __NFUN_165__(i, 1));
		__NFUN_185__(pos);
		// [Loop Continue]
		goto J0x00;
	}
	return;
}

function Query(optional bool bBySuperset, optional bool bInitial)
{
	local int i;
	local UDukeServerList l;

	super.Query(bBySuperset, bInitial);
	i = 0;
	J0x19:

	// End:0xA9 [Loop If]
	if(__NFUN_169__(i, FavoriteCount))
	{
		l = FoundServer(ParseOption(Favorites[i], 1), int(ParseOption(Favorites[i], 2)), "", "Unreal", ParseOption(Favorites[i], 0));
		l.bKeepDescription = __NFUN_310__(ParseOption(Favorites[i], 3), string(true));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x19;
	}
	QueryFinished(true);
	return;
}

function SaveFavorites()
{
	local UDukeServerList i;

	FavoriteCount = 0;
	i = UDukeServerList(PingedList.Next);
	J0x21:

	// End:0xC6 [Loop If]
	if(__NFUN_340__(i, none))
	{
		// End:0x3C
		if(__NFUN_173__(FavoriteCount, 100))
		{
			// [Explicit Break]
			goto J0xC6;
		}
		Favorites[FavoriteCount] = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(i.HostName, "\\"), i.IP), "\\"), string(i.QueryPort)), "\\"), string(i.bKeepDescription));
		__NFUN_184__(FavoriteCount);
		i = UDukeServerList(i.Next);
		// [Loop Continue]
		goto J0x21;
	}
	J0xC6:

	i = UDukeServerList(UnpingedList.Next);
	J0xE0:

	// End:0x185 [Loop If]
	if(__NFUN_340__(i, none))
	{
		// End:0xFB
		if(__NFUN_173__(FavoriteCount, 100))
		{
			// [Explicit Break]
			goto J0x185;
		}
		Favorites[FavoriteCount] = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(i.HostName, "\\"), i.IP), "\\"), string(i.QueryPort)), "\\"), string(i.bKeepDescription));
		__NFUN_184__(FavoriteCount);
		i = UDukeServerList(i.Next);
		// [Loop Continue]
		goto J0xE0;
	}
	J0x185:

	// End:0x19F
	if(__NFUN_169__(FavoriteCount, 100))
	{
		Favorites[FavoriteCount] = "";
	}
	__NFUN_368__();
	return;
}