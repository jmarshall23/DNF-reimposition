/*******************************************************************************
 * UDukeSceneXboxLiveSearch generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneXboxLiveSearch extends UWindowScene;

var UWindowSmallButton BackButton;
var localized string BackText;
var XboxLiveQuery XboxLiveQueryActor;
var bool bRanked;
var bool bQueryComplete;
var UWindowLabelControl ProgressLabel;

function Created()
{
	super.Created();
	XboxLiveQueryActor = GetPlayerOwner().__NFUN_560__().__NFUN_615__(class'XboxLiveQuery');
	BackButton = UWindowSmallButton(CreateWindow(class'UWindowSmallButton', 1, 1, 1, 1));
	BackButton.SetText(BackText);
	BackButton.Register(self);
	ProgressLabel = UWindowLabelControl(CreateWindow(class'UWindowLabelControl', 1, 1, 1, 1));
	ProgressLabel.SetFont(0);
	ChildInFocus = BackButton;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local int ControlStart, ControlBuffer;

	ControlStart = int(__NFUN_195__(float(300), WinScaleY));
	ControlBuffer = int(__NFUN_195__(float(25), WinScaleY));
	BackButton.AutoSize(C);
	ProgressLabel.AutoSize(C);
	ProgressLabel.WinLeft = __NFUN_199__(__NFUN_196__(WinWidth, float(2)), __NFUN_196__(ProgressLabel.WinWidth, float(2)));
	ProgressLabel.WinTop = float(ControlStart);
	BackButton.WinLeft = __NFUN_199__(__NFUN_196__(WinWidth, float(2)), __NFUN_196__(BackButton.WinWidth, float(2)));
	BackButton.WinTop = __NFUN_198__(__NFUN_198__(ProgressLabel.WinTop, ProgressLabel.WinHeight), float(ControlBuffer));
	super.Paint(C, X, Y);
	// End:0x140
	if(__NFUN_148__(__NFUN_145__(XboxLiveQueryActor.IsSearching()), __NFUN_145__(bQueryComplete)))
	{
		EndQuery();
		bQueryComplete = true;
	}
	return;
}

function OnNavForward()
{
	super.OnNavForward();
	XboxLiveQueryActor.bRanked = default.bRanked;
	XboxLiveQueryActor.Search(0);
	ProgressLabel.SetText("Querying servers");
	bQueryComplete = false;
	return;
}

function EndQuery()
{
	// End:0x81
	if(__NFUN_170__(XboxLiveQueryActor.GetSearchResultCount(), 0))
	{
		ProgressLabel.SetText(__NFUN_303__(__NFUN_303__("Found", string(XboxLiveQueryActor.GetSearchResultCount())), "servers"));
		XboxLiveQueryActor.JoinSearchResult(0);
		ProgressLabel.SetText("Joining server");		
	}
	else
	{
		ProgressLabel.SetText("No servers found.");
	}
	return;
}

defaultproperties
{
	BackText="<?int?dnWindow.UDukeSceneXboxLiveSearch.BackText?>"
}