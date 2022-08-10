/*******************************************************************************
 * UWindowHTMLTextArea generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowHTMLTextArea extends UWindowDynamicTextArea
	config;

var Color BGColor;
var Color LinkColor;
var Color ALinkColor;
var float LastBlinkTime;
var bool bShowBlink;
var bool bReleased;

function SetHTML(string HTML)
{
	Clear();
	ReplaceText(HTML, __NFUN_302__(__NFUN_321__(13), __NFUN_321__(10)), " ");
	ReplaceText(HTML, __NFUN_321__(13), " ");
	ReplaceText(HTML, __NFUN_321__(10), " ");
	AddText(HTML);
	return;
}

function BeforePaint(Canvas C, float X, float Y)
{
	super.BeforePaint(C, X, Y);
	cursor = Root.NormalCursor;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	C.DrawColor = BGColor;
	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, class'WhiteTexture');
	super.Paint(C, X, Y);
	bReleased = false;
	return;
}

function Click(float X, float Y)
{
	super(UWindowWindow).Click(X, Y);
	bReleased = true;
	return;
}

function ProcessURL(string URL)
{
	__NFUN_355__(__NFUN_302__(__NFUN_302__("Clicked Link: >>", URL), "<<"));
	// End:0x5F
	if(__NFUN_310__(__NFUN_317__(URL, 7), "mailto:"))
	{		
		GetPlayerOwner().ConsoleCommand(__NFUN_302__("start ", URL));
	}
	// End:0x9A
	if(__NFUN_310__(__NFUN_317__(URL, 7), "http://"))
	{		
		GetPlayerOwner().ConsoleCommand(__NFUN_302__("start ", URL));
	}
	// End:0xD4
	if(__NFUN_310__(__NFUN_317__(URL, 6), "ftp://"))
	{		
		GetPlayerOwner().ConsoleCommand(__NFUN_302__("start ", URL));
	}
	// End:0x111
	if(__NFUN_310__(__NFUN_317__(URL, 9), "telnet://"))
	{		
		GetPlayerOwner().ConsoleCommand(__NFUN_302__("start ", URL));
	}
	// End:0x14E
	if(__NFUN_310__(__NFUN_317__(URL, 9), "gopher://"))
	{		
		GetPlayerOwner().ConsoleCommand(__NFUN_302__("start ", URL));
	}
	// End:0x18D
	if(__NFUN_310__(__NFUN_317__(URL, 4), "www."))
	{		
		GetPlayerOwner().ConsoleCommand(__NFUN_302__("start http://", URL));
	}
	// End:0x1CE
	if(__NFUN_310__(__NFUN_317__(URL, 4), "ftp."))
	{		
		GetPlayerOwner().ConsoleCommand(__NFUN_302__("start ftp://", URL));		
	}
	else
	{
		// End:0x1F4
		if(__NFUN_310__(__NFUN_317__(URL, 9), "unreal://"))
		{
			LaunchUnrealURL(URL);
		}
	}
	return;
}

function OverURL(string URL)
{
	return;
}

function LaunchUnrealURL(string URL)
{
	GetPlayerOwner().ClientTravel(URL, 0, false);
	return;
}

function TextAreaTextSize(Canvas C, string Text, out float W, out float h)
{
	ReplaceText(Text, "&nbsp;", " ");
	ReplaceText(Text, "&gt;", ">");
	ReplaceText(Text, "&lt;", "<");
	ReplaceText(Text, "&amp;", "&");
	TextSize(C, Text, W, h);
	return;
}

function TextAreaClipText(Canvas C, float DrawX, float DrawY, coerce string Text, optional bool bCheckHotKey)
{
	ReplaceText(Text, "&nbsp;", " ");
	ReplaceText(Text, "&gt;", ">");
	ReplaceText(Text, "&lt;", "<");
	ReplaceText(Text, "&amp;", "&");
	ClipText(C, DrawX, DrawY, Text, bCheckHotKey);
	return;
}

function WrapRow(Canvas C, UWindowDynamicTextRow l)
{
	local HTMLStyle CurrentStyle;
	local UWindowHTMLTextRow R;
	local string Input, LeftText, HTML, RightText;

	super.WrapRow(C, l);
	R = UWindowHTMLTextRow(l);
	J0x20:

	// End:0x19C [Loop If]
	if(__NFUN_148__(__NFUN_340__(R, none), __NFUN_150__(__NFUN_339__(R, l), __NFUN_339__(R.WrapParent, l))))
	{
		R.DisplayString = "";
		R.StyleString = "";
		CurrentStyle = R.StartStyle;
		Input = R.Text;
		J0xA8:

		// End:0x17F [Loop If]
		if(__NFUN_309__(Input, ""))
		{
			ParseHTML(Input, LeftText, HTML, RightText);
			// End:0x151
			if(__NFUN_150__(__NFUN_309__(LeftText, ""), __NFUN_308__(R.DisplayString, "")))
			{
				R.DisplayString = __NFUN_302__(R.DisplayString, LeftText);
				R.StyleString = __NFUN_302__(R.StyleString, WriteStyleText(CurrentStyle, __NFUN_314__(LeftText)));
			}
			ProcessInlineHTML(HTML, CurrentStyle);
			SetCanvasStyle(C, CurrentStyle);
			Input = RightText;
			// [Loop Continue]
			goto J0xA8;
		}
		R = UWindowHTMLTextRow(R.Next);
		// [Loop Continue]
		goto J0x20;
	}
	return;
}

function float DrawTextLine(Canvas C, UWindowDynamicTextRow l, float Y)
{
	local float X, W, h, MouseX, MouseY;

	local HTMLStyle CurrentStyle;
	local float RowHeight;
	local Color OldColor;
	local int StylePos, DisplayPos, i;
	local string S;

	RowHeight = 0;
	CurrentStyle = UWindowHTMLTextRow(l).StartStyle;
	// End:0xB4
	if(CurrentStyle.bCenter)
	{
		W = CalcHTMLTextWidth(C, l.Text, CurrentStyle);
		// End:0x98
		if(VertSB.bWindowVisible)
		{
			X = float(int(__NFUN_196__(__NFUN_199__(__NFUN_199__(WinWidth, VertSB.WinWidth), W), float(2))));			
		}
		else
		{
			X = float(int(__NFUN_196__(__NFUN_199__(WinWidth, W), float(2))));
		}		
	}
	else
	{
		X = 2;
	}
	// End:0x105
	if(__NFUN_201__(GetLevel().TimeSeconds, __NFUN_198__(LastBlinkTime, 0.5)))
	{
		bShowBlink = __NFUN_145__(bShowBlink);
		LastBlinkTime = GetLevel().TimeSeconds;
	}
	// End:0x134
	if(__NFUN_308__(UWindowHTMLTextRow(l).DisplayString, ""))
	{
		SetCanvasStyle(C, CurrentStyle);		
	}
	else
	{
		J0x134:

		// End:0x3E4 [Loop If]
		if(__NFUN_169__(DisplayPos, __NFUN_314__(UWindowHTMLTextRow(l).DisplayString)))
		{
			i = ReadStyleText(UWindowHTMLTextRow(l).StyleString, StylePos, CurrentStyle);
			S = __NFUN_316__(UWindowHTMLTextRow(l).DisplayString, DisplayPos, i);
			__NFUN_180__(DisplayPos, i);
			SetCanvasStyle(C, CurrentStyle);
			TextAreaTextSize(C, S, W, h);
			// End:0x1F6
			if(__NFUN_201__(h, RowHeight))
			{
				RowHeight = h;
			}
			// End:0x2D6
			if(CurrentStyle.bLink)
			{
				GetMouseXY(MouseX, MouseY);
				// End:0x2D6
				if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_200__(X, MouseX), __NFUN_201__(__NFUN_198__(X, W), MouseX)), __NFUN_200__(Y, MouseY)), __NFUN_201__(__NFUN_198__(Y, h), MouseY)))
				{
					cursor = Root.HandCursor;
					OverURL(CurrentStyle.LinkDestination);
					// End:0x2D6
					if(__NFUN_150__(bMouseDown, bReleased))
					{
						// End:0x2C1
						if(bReleased)
						{
							ProcessURL(CurrentStyle.LinkDestination);
							bReleased = false;							
						}
						else
						{
							C.DrawColor = ALinkColor;
						}
					}
				}
			}
			// End:0x353
			if(__NFUN_337__(CurrentStyle.BGColor, BGColor))
			{
				OldColor = C.DrawColor;
				C.DrawColor = CurrentStyle.BGColor;
				DrawStretchedTexture(C, X, Y, W, h, class'WhiteTexture');
				C.DrawColor = OldColor;
			}
			// End:0x388
			if(__NFUN_150__(__NFUN_145__(CurrentStyle.bBlink), bShowBlink))
			{
				TextAreaClipText(C, X, Y, S);
			}
			// End:0x3D5
			if(__NFUN_150__(CurrentStyle.bLink, CurrentStyle.bUnderline))
			{
				DrawStretchedTexture(C, X, __NFUN_199__(__NFUN_198__(Y, h), float(1)), W, 1, class'WhiteTexture');
			}
			__NFUN_209__(X, W);
			// [Loop Continue]
			goto J0x134;
		}
	}
	// End:0x408
	if(__NFUN_204__(RowHeight, float(0)))
	{
		TextAreaTextSize(C, "A", W, RowHeight);
	}
	return RowHeight;
	return;
}

function UWindowDynamicTextRow SplitRowAt(UWindowDynamicTextRow l, int SplitPos)
{
	local UWindowDynamicTextRow n;
	local HTMLStyle CurrentStyle;

	n = super.SplitRowAt(l, SplitPos);
	UWindowHTMLTextRow(n).EndStyle = UWindowHTMLTextRow(l).EndStyle;
	CurrentStyle = UWindowHTMLTextRow(l).StartStyle;
	HTMLUpdateStyle(l.Text, CurrentStyle);
	UWindowHTMLTextRow(l).EndStyle = CurrentStyle;
	UWindowHTMLTextRow(n).StartStyle = CurrentStyle;
	return n;
	return;
}

function RemoveWrap(UWindowDynamicTextRow l)
{
	local UWindowDynamicTextRow n;

	n = UWindowDynamicTextRow(l.Next);
	J0x1A:

	// End:0x88 [Loop If]
	if(__NFUN_148__(__NFUN_340__(n, none), __NFUN_339__(n.WrapParent, l)))
	{
		UWindowHTMLTextRow(l).EndStyle = UWindowHTMLTextRow(n).EndStyle;
		n = UWindowDynamicTextRow(n.Next);
		// [Loop Continue]
		goto J0x1A;
	}
	super.RemoveWrap(l);
	return;
}

function int GetWrapPos(Canvas C, UWindowDynamicTextRow l, float MaxWidth)
{
	local float W, LineWidth, NextWordWidth;
	local string Input, NextWord;
	local int WordsThisRow, WrapPos;
	local HTMLStyle CurrentStyle;

	CurrentStyle = UWindowHTMLTextRow(l).StartStyle;
	// End:0x49
	if(__NFUN_202__(CalcHTMLTextWidth(C, l.Text, CurrentStyle), MaxWidth))
	{
		return -1;
	}
	Input = l.Text;
	WordsThisRow = 0;
	LineWidth = 0;
	WrapPos = 0;
	NextWord = "";
	CurrentStyle = UWindowHTMLTextRow(l).StartStyle;
	J0x99:

	// End:0x146 [Loop If]
	if(__NFUN_150__(__NFUN_309__(Input, ""), __NFUN_309__(NextWord, "")))
	{
		// End:0xED
		if(__NFUN_308__(NextWord, ""))
		{
			RemoveNextWord(Input, NextWord);
			NextWordWidth = CalcHTMLTextWidth(C, NextWord, CurrentStyle);
		}
		// End:0x119
		if(__NFUN_148__(__NFUN_170__(WordsThisRow, 0), __NFUN_201__(__NFUN_198__(LineWidth, NextWordWidth), MaxWidth)))
		{
			return WrapPos;			
		}
		else
		{
			__NFUN_180__(WrapPos, __NFUN_314__(NextWord));
			__NFUN_209__(LineWidth, NextWordWidth);
			NextWord = "";
			__NFUN_184__(WordsThisRow);
		}
		// [Loop Continue]
		goto J0x99;
	}
	return -1;
	return;
}

function RemoveNextWord(out string Text, out string NextWord)
{
	local int i;
	local bool bInsideTag;
	local string Ch;

	bInsideTag = false;
	i = 0;
	J0x0F:

	// End:0x89 [Loop If]
	if(__NFUN_169__(i, __NFUN_314__(Text)))
	{
		Ch = __NFUN_316__(Text, i, 1);
		// End:0x4B
		if(__NFUN_308__(Ch, ">"))
		{
			bInsideTag = false;
		}
		// End:0x61
		if(__NFUN_308__(Ch, "<"))
		{
			bInsideTag = true;
		}
		// End:0x7F
		if(__NFUN_148__(__NFUN_308__(Ch, " "), __NFUN_145__(bInsideTag)))
		{
			// [Explicit Break]
			goto J0x89;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	J0x89:

	// End:0xAA [Loop If]
	if(__NFUN_308__(__NFUN_316__(Text, i, 1), " "))
	{
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x89;
	}
	NextWord = __NFUN_317__(Text, i);
	Text = __NFUN_316__(Text, i);
	return;
}

function UWindowDynamicTextRow AddText(string NewLine)
{
	local string Input, Output, LeftText, RightText, HTML;

	local int i;
	local UWindowDynamicTextRow l;
	local HTMLStyle CurrentStyle, StartStyle;

	// End:0xB6
	if(__NFUN_339__(List.Last, List))
	{
		CurrentStyle.BulletLevel = 0;
		CurrentStyle.LinkDestination = "";
		CurrentStyle.TextColor = TextColor;
		CurrentStyle.BGColor = BGColor;
		CurrentStyle.bCenter = bHCenter;
		CurrentStyle.bLink = false;
		CurrentStyle.bUnderline = false;
		CurrentStyle.bNoBR = false;
		CurrentStyle.bHeading = false;
		CurrentStyle.bBold = false;
		CurrentStyle.bBlink = false;		
	}
	else
	{
		CurrentStyle = UWindowHTMLTextRow(List.Last).EndStyle;
	}
	StartStyle = CurrentStyle;
	i = __NFUN_315__(NewLine, "\\n");
	J0xF7:

	// End:0x14B [Loop If]
	if(__NFUN_174__(i, -1))
	{
		NewLine = __NFUN_302__(__NFUN_302__(__NFUN_317__(NewLine, i), "<br>"), __NFUN_316__(NewLine, __NFUN_165__(i, 2)));
		i = __NFUN_315__(NewLine, "\\n");
		// [Loop Continue]
		goto J0xF7;
	}
	Input = NewLine;
	Output = "";
	J0x15E:

	// End:0x1B7 [Loop If]
	if(__NFUN_309__(Input, ""))
	{
		ParseHTML(Input, LeftText, HTML, RightText);
		DecodeHTMLTag(HTML, Output, LeftText, l, StartStyle, CurrentStyle);
		Input = RightText;
		// [Loop Continue]
		goto J0x15E;
	}
	l = super.AddText(Output);
	UWindowHTMLTextRow(l).StartStyle = StartStyle;
	UWindowHTMLTextRow(l).EndStyle = CurrentStyle;
	return l;
	return;
}

function DecodeHTMLTag(string strHTML, out string strOutput, out string strLeft, out UWindowDynamicTextRow rowText, out HTMLStyle StartStyle, out HTMLStyle CurrentStyle)
{
	local bool bNegative;
	local string strTag, strOption;

	strTag = GetTag(strHTML);
	// End:0x3A
	if(__NFUN_308__(__NFUN_317__(strTag, 1), "/"))
	{
		strTag = __NFUN_316__(strTag, 1);
		bNegative = true;
	}
	switch(strTag)
	{
		// End:0x188
		case "P":
			strOption = GetOption(strHTML, "ALIGN=");
			// End:0xB8
			if(__NFUN_148__(__NFUN_174__(__NFUN_314__(strOption), 0), __NFUN_308__(strOption, "CENTER")))
			{
				__NFUN_355__("TIM: Centertin paragraph");
				CurrentStyle.bCenter = __NFUN_145__(bNegative);				
			}
			else
			{
				// End:0xCE
				if(bNegative)
				{
					CurrentStyle.bCenter = false;
				}
			}
			// End:0x138
			if(__NFUN_309__(__NFUN_302__(strOutput, strLeft), ""))
			{
				rowText = AddText(__NFUN_302__(strOutput, strLeft));
				strOutput = "";
				UWindowHTMLTextRow(rowText).StartStyle = StartStyle;
				UWindowHTMLTextRow(rowText).EndStyle = CurrentStyle;
			}
			StartStyle = CurrentStyle;
			rowText = AddText("");
			UWindowHTMLTextRow(rowText).StartStyle = StartStyle;
			UWindowHTMLTextRow(rowText).EndStyle = CurrentStyle;
			// End:0x79A
			break;
		// End:0x232
		case "BR":
			strOutput = __NFUN_302__(strOutput, strLeft);
			rowText = AddText(strOutput);
			StartStyle.bLink = CheckTextForLink(strOutput);
			// End:0x1E8
			if(StartStyle.bLink)
			{
				StartStyle.LinkDestination = strOutput;
			}
			UWindowHTMLTextRow(rowText).StartStyle = StartStyle;
			UWindowHTMLTextRow(rowText).EndStyle = CurrentStyle;
			strOutput = "";
			StartStyle = CurrentStyle;
			// End:0x79A
			break;
		// End:0x368
		case "BODY":
			// End:0x352
			if(__NFUN_145__(bNegative))
			{
				strOption = GetOption(strHTML, "BGCOLOR=");
				// End:0x29F
				if(__NFUN_309__(strOption, ""))
				{
					BGColor = ParseColor(strOption);
					CurrentStyle.BGColor = BGColor;
					StartStyle.BGColor = BGColor;
				}
				strOption = GetOption(strHTML, "LINK=");
				// End:0x2D5
				if(__NFUN_309__(strOption, ""))
				{
					LinkColor = ParseColor(strOption);
				}
				strOption = GetOption(strHTML, "ALINK=");
				// End:0x30C
				if(__NFUN_309__(strOption, ""))
				{
					ALinkColor = ParseColor(strOption);
				}
				strOption = GetOption(strHTML, "TEXT=");
				// End:0x352
				if(__NFUN_309__(strOption, ""))
				{
					TextColor = ParseColor(strOption);
					CurrentStyle.TextColor = TextColor;
				}
			}
			strOutput = __NFUN_302__(strOutput, strLeft);
			// End:0x79A
			break;
		// End:0x460
		case "CENTER":
			// End:0x3D4
			if(bNegative)
			{
				rowText = AddText(__NFUN_302__(strOutput, strLeft));
				strOutput = "";
				UWindowHTMLTextRow(rowText).StartStyle = StartStyle;
				UWindowHTMLTextRow(rowText).EndStyle = CurrentStyle;				
			}
			else
			{
				// End:0x43E
				if(__NFUN_309__(__NFUN_302__(strOutput, strLeft), ""))
				{
					rowText = AddText(__NFUN_302__(strOutput, strLeft));
					strOutput = "";
					UWindowHTMLTextRow(rowText).StartStyle = StartStyle;
					UWindowHTMLTextRow(rowText).EndStyle = CurrentStyle;
				}
			}
			CurrentStyle.bCenter = __NFUN_145__(bNegative);
			StartStyle = CurrentStyle;
			// End:0x79A
			break;
		// End:0x554
		case "H1":
			// End:0x4C8
			if(bNegative)
			{
				rowText = AddText(__NFUN_302__(strOutput, strLeft));
				strOutput = "";
				UWindowHTMLTextRow(rowText).StartStyle = StartStyle;
				UWindowHTMLTextRow(rowText).EndStyle = CurrentStyle;				
			}
			else
			{
				// End:0x532
				if(__NFUN_309__(__NFUN_302__(strOutput, strLeft), ""))
				{
					rowText = AddText(__NFUN_302__(strOutput, strLeft));
					strOutput = "";
					UWindowHTMLTextRow(rowText).StartStyle = StartStyle;
					UWindowHTMLTextRow(rowText).EndStyle = CurrentStyle;
				}
			}
			CurrentStyle.bHeading = __NFUN_145__(bNegative);
			StartStyle = CurrentStyle;
			// End:0x79A
			break;
		// End:0x62C
		case "FONT":
			// End:0x59C
			if(bNegative)
			{
				strOutput = __NFUN_302__(strOutput, strLeft);
				CurrentStyle.TextColor = TextColor;
				CurrentStyle.BGColor = BGColor;				
			}
			else
			{
				strOutput = __NFUN_302__(strOutput, strLeft);
				strOption = GetOption(strHTML, "COLOR=");
				// End:0x5EB
				if(__NFUN_309__(strOption, ""))
				{
					CurrentStyle.TextColor = ParseColor(strOption);
				}
				strOption = GetOption(strHTML, "BGCOLOR=");
				// End:0x629
				if(__NFUN_309__(strOption, ""))
				{
					CurrentStyle.BGColor = ParseColor(strOption);
				}
			}
			// End:0x79A
			break;
		// End:0x664
		case "B":
			strOutput = __NFUN_302__(__NFUN_302__(strOutput, strLeft), strHTML);
			CurrentStyle.bBold = __NFUN_145__(bNegative);
			// End:0x79A
			break;
		// End:0x69C
		case "U":
			strOutput = __NFUN_302__(__NFUN_302__(strOutput, strLeft), strHTML);
			CurrentStyle.bUnderline = __NFUN_145__(bNegative);
			// End:0x79A
			break;
		// End:0x70A
		case "A":
			// End:0x6BB
			if(bNegative)
			{
				CurrentStyle.LinkDestination = "";				
			}
			else
			{
				CurrentStyle.LinkDestination = GetOption(strHTML, "HREF=");
			}
			strOutput = __NFUN_302__(__NFUN_302__(strOutput, strLeft), strHTML);
			CurrentStyle.bLink = __NFUN_145__(bNegative);
			// End:0x79A
			break;
		// End:0x745
		case "NOBR":
			strOutput = __NFUN_302__(__NFUN_302__(strOutput, strLeft), strHTML);
			CurrentStyle.bNoBR = __NFUN_145__(bNegative);
			// End:0x79A
			break;
		// End:0x781
		case "BLINK":
			strOutput = __NFUN_302__(__NFUN_302__(strOutput, strLeft), strHTML);
			CurrentStyle.bBlink = __NFUN_145__(bNegative);
			// End:0x79A
			break;
		// End:0xFFFF
		default:
			strOutput = __NFUN_302__(strOutput, strLeft);
			// End:0x79A
			break;
			break;
	}
	return;
}

function bool CheckTextForLink(string strIn)
{
	// End:0x1B
	if(__NFUN_310__(__NFUN_317__(strIn, 7), "http://"))
	{
		return true;
	}
	// End:0x35
	if(__NFUN_310__(__NFUN_317__(strIn, 6), "ftp://"))
	{
		return true;
	}
	return false;
	return;
}

function ParseHTML(string Input, out string LeftText, out string HTML, out string RightText)
{
	local int i;

	i = __NFUN_315__(Input, "<");
	// End:0x3D
	if(__NFUN_173__(i, -1))
	{
		LeftText = Input;
		HTML = "";
		RightText = "";
		return;
	}
	LeftText = __NFUN_317__(Input, i);
	HTML = __NFUN_316__(Input, i);
	i = __NFUN_315__(HTML, ">");
	// End:0x8D
	if(__NFUN_173__(i, -1))
	{
		RightText = "";
		return;
	}
	RightText = __NFUN_316__(HTML, __NFUN_165__(i, 1));
	HTML = __NFUN_317__(HTML, __NFUN_165__(i, 1));
	return;
}

function float CalcHTMLTextWidth(Canvas C, string Text, out HTMLStyle CurrentStyle)
{
	local string Input, LeftText, HTML, RightText;
	local float W, h, Width;

	Width = 0;
	Input = Text;
	J0x16:

	// End:0x91 [Loop If]
	if(__NFUN_309__(Input, ""))
	{
		ParseHTML(Input, LeftText, HTML, RightText);
		SetCanvasStyle(C, CurrentStyle);
		TextAreaTextSize(C, LeftText, W, h);
		__NFUN_209__(Width, W);
		ProcessInlineHTML(HTML, CurrentStyle);
		Input = RightText;
		// [Loop Continue]
		goto J0x16;
	}
	return Width;
	return;
}

function ProcessInlineHTML(string HTML, out HTMLStyle CurrentStyle)
{
	local string temp;

	// End:0x0F
	if(__NFUN_308__(HTML, ""))
	{
		return;
	}
	switch(GetTag(HTML))
	{
		// End:0x34
		case "H1":
			CurrentStyle.bHeading = true;
			// End:0x21B
			break;
		// End:0x4C
		case "/H1":
			CurrentStyle.bHeading = false;
			// End:0x21B
			break;
		// End:0xD2
		case "FONT":
			temp = GetOption(HTML, "COLOR=");
			// End:0x91
			if(__NFUN_309__(temp, ""))
			{
				CurrentStyle.TextColor = ParseColor(temp);
			}
			temp = GetOption(HTML, "BGCOLOR=");
			// End:0xCF
			if(__NFUN_309__(temp, ""))
			{
				CurrentStyle.BGColor = ParseColor(temp);
			}
			// End:0x21B
			break;
		// End:0xFF
		case "/FONT":
			CurrentStyle.TextColor = TextColor;
			CurrentStyle.BGColor = BGColor;
			// End:0x21B
			break;
		// End:0x115
		case "B":
			CurrentStyle.bBold = true;
			// End:0x21B
			break;
		// End:0x12C
		case "/B":
			CurrentStyle.bBold = false;
			// End:0x21B
			break;
		// End:0x142
		case "U":
			CurrentStyle.bUnderline = true;
			// End:0x21B
			break;
		// End:0x159
		case "/U":
			CurrentStyle.bUnderline = false;
			// End:0x21B
			break;
		// End:0x18C
		case "A":
			CurrentStyle.bLink = true;
			CurrentStyle.LinkDestination = GetOption(HTML, "HREF=");
			// End:0x21B
			break;
		// End:0x1B0
		case "/A":
			CurrentStyle.bLink = false;
			CurrentStyle.LinkDestination = "";
			// End:0x21B
			break;
		// End:0x1C9
		case "NOBR":
			CurrentStyle.bNoBR = true;
			// End:0x21B
			break;
		// End:0x1E3
		case "/NOBR":
			CurrentStyle.bNoBR = false;
			// End:0x21B
			break;
		// End:0x1FD
		case "BLINK":
			CurrentStyle.bBlink = true;
			// End:0x21B
			break;
		// End:0x218
		case "/BLINK":
			CurrentStyle.bBlink = false;
			// End:0x21B
			break;
		// End:0xFFFF
		default:
			break;
	}
	return;
}

function HTMLUpdateStyle(string Input, out HTMLStyle CurrentStyle)
{
	local string LeftText, HTML, RightText;

	J0x00:
	// End:0x45 [Loop If]
	if(__NFUN_309__(Input, ""))
	{
		ParseHTML(Input, LeftText, HTML, RightText);
		ProcessInlineHTML(HTML, CurrentStyle);
		Input = RightText;
		// [Loop Continue]
		goto J0x00;
	}
	return;
}

function string GetOption(string HTML, string Option)
{
	local int i, j;
	local string S;

	i = __NFUN_315__(__NFUN_319__(HTML), __NFUN_319__(Option));
	// End:0xE4
	if(__NFUN_150__(__NFUN_173__(i, 1), __NFUN_308__(__NFUN_316__(HTML, __NFUN_166__(i, 1), 1), " ")))
	{
		S = __NFUN_316__(HTML, __NFUN_165__(i, __NFUN_314__(Option)));
		j = FirstMatching(__NFUN_315__(S, ">"), __NFUN_315__(S, " "));
		S = __NFUN_317__(S, j);
		// End:0xB3
		if(__NFUN_308__(__NFUN_317__(S, 1), "\""))
		{
			S = __NFUN_316__(S, 1);
		}
		// End:0xDE
		if(__NFUN_308__(__NFUN_318__(S, 1), "\""))
		{
			S = __NFUN_317__(S, __NFUN_166__(__NFUN_314__(S), 1));
		}
		return S;
	}
	return "";
	return;
}

function string GetTag(string HTML)
{
	local int i;

	// End:0x10
	if(__NFUN_308__(HTML, ""))
	{
		return "";
	}
	HTML = __NFUN_316__(HTML, 1);
	i = FirstMatching(__NFUN_315__(HTML, ">"), __NFUN_315__(HTML, " "));
	// End:0x5C
	if(__NFUN_173__(i, -1))
	{
		return __NFUN_319__(HTML);		
	}
	else
	{
		return __NFUN_319__(__NFUN_317__(HTML, i));
	}
	return;
}

function Color ParseColor(string S)
{
	local Color C;

	// End:0x21
	if(__NFUN_308__(__NFUN_317__(S, 1), "#"))
	{
		S = __NFUN_316__(S, 1);
	}
	C.R = byte(__NFUN_165__(__NFUN_162__(int(16), GetHexDigit(__NFUN_316__(S, 0, 1))), GetHexDigit(__NFUN_316__(S, 1, 1))));
	C.G = byte(__NFUN_165__(__NFUN_162__(int(16), GetHexDigit(__NFUN_316__(S, 2, 1))), GetHexDigit(__NFUN_316__(S, 3, 1))));
	C.B = byte(__NFUN_165__(__NFUN_162__(int(16), GetHexDigit(__NFUN_316__(S, 4, 1))), GetHexDigit(__NFUN_316__(S, 5, 1))));
	return C;
	return;
}

function int GetHexDigit(string D)
{
	switch(__NFUN_319__(D))
	{
		// End:0x13
		case "0":
			return 0;
		// End:0x1B
		case "1":
			return 1;
		// End:0x24
		case "2":
			return 2;
		// End:0x2D
		case "3":
			return 3;
		// End:0x36
		case "4":
			return 4;
		// End:0x3F
		case "5":
			return 5;
		// End:0x48
		case "6":
			return 6;
		// End:0x51
		case "7":
			return 7;
		// End:0x5A
		case "8":
			return 8;
		// End:0x63
		case "9":
			return 9;
		// End:0x6C
		case "A":
			return 10;
		// End:0x75
		case "B":
			return 11;
		// End:0x7E
		case "C":
			return 12;
		// End:0x87
		case "D":
			return 13;
		// End:0x90
		case "E":
			return 14;
		// End:0x99
		case "F":
			return 15;
		// End:0xFFFF
		default:
			return 0;
			break;
	}
	return;
}

function int FirstMatching(int i, int j)
{
	// End:0x15
	if(__NFUN_173__(i, -1))
	{
		return j;
	}
	// End:0x2D
	if(__NFUN_173__(j, -1))
	{
		return i;		
	}
	else
	{
		return __NFUN_188__(i, j);
	}
	return;
}

function SetCanvasStyle(Canvas C, HTMLStyle CurrentStyle)
{
	// End:0x26
	if(CurrentStyle.bLink)
	{
		C.DrawColor = LinkColor;		
	}
	else
	{
		C.DrawColor = CurrentStyle.TextColor;
	}
	// End:0x70
	if(CurrentStyle.bHeading)
	{
		C.Font = C.TallFont;		
	}
	else
	{
		// End:0xA0
		if(CurrentStyle.bBold)
		{
			C.Font = C.TallFont;			
		}
		else
		{
			C.Font = C.TallFont;
		}
	}
	return;
}

function string WriteStyleText(HTMLStyle CurrentStyle, int CharCount)
{
	local string Pad, temp, Output;

	Pad = "0000";
	temp = string(CharCount);
	Output = __NFUN_302__(__NFUN_317__(Pad, __NFUN_166__(4, __NFUN_314__(temp))), temp);
	temp = string(__NFUN_314__(CurrentStyle.LinkDestination));
	Output = __NFUN_302__(__NFUN_302__(__NFUN_302__(Output, __NFUN_317__(Pad, __NFUN_166__(4, __NFUN_314__(temp)))), temp), CurrentStyle.LinkDestination);
	temp = string(CurrentStyle.TextColor.R);
	Output = __NFUN_302__(__NFUN_302__(Output, __NFUN_317__(Pad, __NFUN_166__(3, __NFUN_314__(temp)))), temp);
	temp = string(CurrentStyle.TextColor.G);
	Output = __NFUN_302__(__NFUN_302__(Output, __NFUN_317__(Pad, __NFUN_166__(3, __NFUN_314__(temp)))), temp);
	temp = string(CurrentStyle.TextColor.B);
	Output = __NFUN_302__(__NFUN_302__(Output, __NFUN_317__(Pad, __NFUN_166__(3, __NFUN_314__(temp)))), temp);
	temp = string(CurrentStyle.BGColor.R);
	Output = __NFUN_302__(__NFUN_302__(Output, __NFUN_317__(Pad, __NFUN_166__(3, __NFUN_314__(temp)))), temp);
	temp = string(CurrentStyle.BGColor.G);
	Output = __NFUN_302__(__NFUN_302__(Output, __NFUN_317__(Pad, __NFUN_166__(3, __NFUN_314__(temp)))), temp);
	temp = string(CurrentStyle.BGColor.B);
	Output = __NFUN_302__(__NFUN_302__(Output, __NFUN_317__(Pad, __NFUN_166__(3, __NFUN_314__(temp)))), temp);
	// End:0x227
	if(CurrentStyle.bCenter)
	{
		Output = __NFUN_302__(Output, "T");		
	}
	else
	{
		Output = __NFUN_302__(Output, "F");
	}
	// End:0x25A
	if(CurrentStyle.bLink)
	{
		Output = __NFUN_302__(Output, "T");		
	}
	else
	{
		Output = __NFUN_302__(Output, "F");
	}
	// End:0x28D
	if(CurrentStyle.bUnderline)
	{
		Output = __NFUN_302__(Output, "T");		
	}
	else
	{
		Output = __NFUN_302__(Output, "F");
	}
	// End:0x2C0
	if(CurrentStyle.bNoBR)
	{
		Output = __NFUN_302__(Output, "T");		
	}
	else
	{
		Output = __NFUN_302__(Output, "F");
	}
	// End:0x2F3
	if(CurrentStyle.bHeading)
	{
		Output = __NFUN_302__(Output, "T");		
	}
	else
	{
		Output = __NFUN_302__(Output, "F");
	}
	// End:0x326
	if(CurrentStyle.bBold)
	{
		Output = __NFUN_302__(Output, "T");		
	}
	else
	{
		Output = __NFUN_302__(Output, "F");
	}
	// End:0x359
	if(CurrentStyle.bBlink)
	{
		Output = __NFUN_302__(Output, "T");		
	}
	else
	{
		Output = __NFUN_302__(Output, "F");
	}
	return Output;
	return;
}

function int ReadStyleText(string StyleString, out int StylePos, out HTMLStyle CurrentStyle)
{
	local string temp;
	local int CharCount, i;

	CharCount = int(__NFUN_316__(StyleString, StylePos, 4));
	__NFUN_180__(StylePos, 4);
	i = int(__NFUN_316__(StyleString, StylePos, 4));
	__NFUN_180__(StylePos, 4);
	CurrentStyle.LinkDestination = __NFUN_316__(StyleString, StylePos, i);
	__NFUN_180__(StylePos, i);
	CurrentStyle.TextColor.R = byte(int(__NFUN_316__(StyleString, StylePos, 3)));
	__NFUN_180__(StylePos, 3);
	CurrentStyle.TextColor.G = byte(int(__NFUN_316__(StyleString, StylePos, 3)));
	__NFUN_180__(StylePos, 3);
	CurrentStyle.TextColor.B = byte(int(__NFUN_316__(StyleString, StylePos, 3)));
	__NFUN_180__(StylePos, 3);
	CurrentStyle.BGColor.R = byte(int(__NFUN_316__(StyleString, StylePos, 3)));
	__NFUN_180__(StylePos, 3);
	CurrentStyle.BGColor.G = byte(int(__NFUN_316__(StyleString, StylePos, 3)));
	__NFUN_180__(StylePos, 3);
	CurrentStyle.BGColor.B = byte(int(__NFUN_316__(StyleString, StylePos, 3)));
	__NFUN_180__(StylePos, 3);
	CurrentStyle.bCenter = __NFUN_308__(__NFUN_316__(StyleString, __NFUN_184__(StylePos), 1), "T");
	CurrentStyle.bLink = __NFUN_308__(__NFUN_316__(StyleString, __NFUN_184__(StylePos), 1), "T");
	CurrentStyle.bUnderline = __NFUN_308__(__NFUN_316__(StyleString, __NFUN_184__(StylePos), 1), "T");
	CurrentStyle.bNoBR = __NFUN_308__(__NFUN_316__(StyleString, __NFUN_184__(StylePos), 1), "T");
	CurrentStyle.bHeading = __NFUN_308__(__NFUN_316__(StyleString, __NFUN_184__(StylePos), 1), "T");
	CurrentStyle.bBold = __NFUN_308__(__NFUN_316__(StyleString, __NFUN_184__(StylePos), 1), "T");
	CurrentStyle.bBlink = __NFUN_308__(__NFUN_316__(StyleString, __NFUN_184__(StylePos), 1), "T");
	return CharCount;
	return;
}

defaultproperties
{
	LinkColor=(B=13,G=1,R=0,A=12)
	ALinkColor=(B=13,G=1,R=255,A=12)
	bTopCentric=true
	bAutoScrollbar=true
	bVariableRowHeight=true
	RowClass='UWindowHTMLTextRow'
	bIgnoreLDoubleClick=true
}