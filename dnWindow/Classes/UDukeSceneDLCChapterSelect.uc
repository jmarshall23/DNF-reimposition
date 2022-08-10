/*******************************************************************************
 * UDukeSceneDLCChapterSelect generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneDLCChapterSelect extends UDukeSceneChapterSelect;

function int CheckEgoAwardAndSetDifficulty(DukePlayer Duke, int i, out float DifficultyAlphas[4])
{
	local int j, AwardCount;

	AwardCount = 0;
	j = 0;
	J0x0E:

	// End:0x66 [Loop If]
	if(__NFUN_169__(j, 4))
	{
		// End:0x4B
		if(Duke.HasCompletionForDLCLevel(j, i))
		{
			DifficultyAlphas[j] = 1;
			// [Explicit Continue]
			goto J0x5C;
		}
		DifficultyAlphas[j] = LockedAlpha;
		J0x5C:

		__NFUN_182__(j);
		// [Loop Continue]
		goto J0x0E;
	}
	return AwardCount;
	return;
}

function OnNavForward()
{
	local int i;
	local SChapterEntry Entry;
	local bool bLastChapterComplete;

	ChapterNames.Remove(0, string(ChapterNames));
	Chapters.Remove(0, string(Chapters));
	i = 0;
	J0x21:

	// End:0x102 [Loop If]
	if(__NFUN_169__(i, string(class'MapInfo'.default.CampaignList)))
	{
		Chapters.Insert(string(Chapters), 1);
		Chapters[__NFUN_166__(string(Chapters), 1)].URL = class'MapInfo'.default.CampaignList[i].URL;
		Chapters[__NFUN_166__(string(Chapters), 1)].SShotPaackage = class'MapInfo'.default.CampaignList[i].SShotPath;
		Chapters[__NFUN_166__(string(Chapters), 1)].IsDLC = true;
		ChapterNames[ChapterNames.Add(1)] = __NFUN_356__("MapNames", class'MapInfo'.default.CampaignList[i].MapNameTag, "Maps");
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x21;
	}
	bLastChapterComplete = false;
	ChapterList.Clear();
	i = 0;
	J0x121:

	// End:0x223 [Loop If]
	if(__NFUN_169__(i, string(Chapters)))
	{
		// End:0x186
		if(DukePlayer(GetPlayerOwner()).HasCompletionForDLCLevel(0, i))
		{
			bLastChapterComplete = true;
			ChapterList.AddItem(ChapterNames[i], Chapters[i].URL);
			// [Explicit Continue]
			goto J0x219;
		}
		// End:0x1D2
		if(DukePlayer(GetPlayerOwner()).IsDLCCampaignStart(i))
		{
			ChapterList.AddItem(ChapterNames[i], Chapters[i].URL);
			// [Explicit Continue]
			goto J0x219;
		}
		// End:0x211
		if(bLastChapterComplete)
		{
			bLastChapterComplete = false;
			ChapterList.AddItem(ChapterNames[i], Chapters[i].URL);
			// [Explicit Continue]
			goto J0x219;
		}
		bLastChapterComplete = false;
		J0x219:

		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x121;
	}
	ChapterList.SetSelectedIndex(0);
	super(UWindowScene).OnNavForward();
	return;
}

function GetTitleLocation(Canvas C, coerce out float Top, coerce out float Right)
{
	local float XL, YL;

	Right = __NFUN_195__(554, WinScaleY);
	C.Font = C.TallFont;
	TextSize(C, TitleText, XL, YL, TTFontScale, TTFontScale);
	// End:0x95
	if(__NFUN_200__(__NFUN_199__(Right, XL), __NFUN_195__(WinWidth, 0.15)))
	{
		__NFUN_209__(Right, __NFUN_198__(__NFUN_211__(__NFUN_199__(Right, XL)), __NFUN_195__(WinWidth, 0.15)));
	}
	Top = __NFUN_195__(200, WinScaleY);
	return;
}

function string GetTravelURL(string Chapter)
{
	return Chapter;
	return;
}

defaultproperties
{
	TitleText="<?int?dnWindow.UDukeSceneDLCChapterSelect.TitleText?>"
}