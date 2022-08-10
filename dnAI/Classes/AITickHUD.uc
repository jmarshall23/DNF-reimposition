/*******************************************************************************
 * AITickHUD generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AITickHUD extends AIHUD
	collapsecategories;

simulated function DrawAIHUD(Canvas C)
{
	local AIActor AI;
	local array<AIActor> TickingAIList;
	local string str;
	local int i;
	local float sx, sy, xw, yh, StartY, StartX,
		lengthX, lengthXb;

	// End:0x0E
	if(__NFUN_339__(C, none))
	{
		return;
	}
	sx = __NFUN_195__(10, HUDScaleX);
	sy = __NFUN_195__(32, HUDScaleY);
	C.DrawColor = WhiteColor;
	C.__NFUN_1231__("AI Tick HUD", xw, yh);
	StartColumn(int(sx), int(__NFUN_199__(sy, yh)), int(yh));
	C.__NFUN_1250__(0, 0);
	C.__NFUN_1250__(__NFUN_195__(float(C.SizeX), 0.005), __NFUN_195__(float(C.SizeY), 0.005));
	C.Style = 5;
	C.DrawColor.R = 0;
	C.DrawColor.G = 0;
	C.DrawColor.B = 0;
	C.__NFUN_1234__(class'WhiteTexture', __NFUN_195__(float(C.SizeX), 0.99), __NFUN_195__(float(C.SizeY), 0.655), 1, 1, 1, 1,,,,, 0.5);
	C.__NFUN_1232__("White / Alpha 0.5 / STY_Translucent2");
	C.DrawColor = WhiteColor;
	// End:0x20F
	foreach __NFUN_747__(class'AIActor', AI)
	{
		// End:0x20E
		if(AI.bTickedLastFrame)
		{
			TickingAIList[TickingAIList.Add(1)] = AI;
		}		
	}	
	C.DrawColor = OrangeColor;
	DrawString(C, " ");
	DrawString(C, "Orange = Changed from default");
	DrawString(C, " ");
	C.DrawColor = WhiteColor;
	DrawString(C, __NFUN_302__("Ticking AI: ", string(string(TickingAIList))));
	StartY = C.CurY;
	StartX = __NFUN_195__(float(C.SizeX), 0.01);
	lengthX = 0;
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "Name");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("Name   ", xw, yh);
	lengthX = xw;
	i = 0;
	J0x38E:

	// End:0x448 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x3C5
		if(__NFUN_173__(__NFUN_164__(i, 2), 0))
		{
			C.DrawColor = LightBlueColor;			
		}
		else
		{
			C.DrawColor = WhiteColor;
		}
		str = __NFUN_302__(string(TickingAIList[i].Name), "  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x38E;
	}
	__NFUN_209__(StartX, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "Tag");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("Tag   ", xw, yh);
	lengthX = xw;
	i = 0;
	J0x500:

	// End:0x5BA [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x537
		if(__NFUN_173__(__NFUN_164__(i, 2), 0))
		{
			C.DrawColor = LightBlueColor;			
		}
		else
		{
			C.DrawColor = WhiteColor;
		}
		str = __NFUN_302__(string(TickingAIList[i].Tag), "  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x500;
	}
	__NFUN_209__(StartX, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "TickStyle");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("TickStyle   ", xw, yh);
	lengthX = xw;
	i = 0;
	J0x67E:

	// End:0x741 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x6B5
		if(__NFUN_173__(__NFUN_164__(i, 2), 0))
		{
			C.DrawColor = LightBlueColor;			
		}
		else
		{
			C.DrawColor = WhiteColor;
		}
		str = __NFUN_302__(string(__NFUN_365__(class'ETickStyle', int(TickingAIList[i].TickStyle))), "  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x67E;
	}
	__NFUN_209__(StartX, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "ExtPhys");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("ExtPhys  ", xw, yh);
	lengthX = xw;
	i = 0;
	J0x800:

	// End:0x8EC [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x841
		if(TickingAIList[i].bTickOnlyExternalPhysics)
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0x868
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(string(TickingAIList[i].bTickOnlyExternalPhysics), "  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x800;
	}
	__NFUN_209__(StartX, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "AITick()  ");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("AITick()  ", xw, yh);
	lengthX = xw;
	i = 0;
	J0x9AF:

	// End:0xA9B [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x9F0
		if(TickingAIList[i].AIShouldTick())
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0xA17
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(string(TickingAIList[i].AIShouldTick()), "  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x9AF;
	}
	__NFUN_209__(StartX, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "bTickOnlyRecent");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("bTickOnlyRecent   ", xw, yh);
	lengthXb = xw;
	i = 0;
	J0xB6B:

	// End:0xCA6 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0xBF5
		if(__NFUN_150__(__NFUN_147__(TickingAIList[i].bTickOnlyRecent, TickingAIList[i].default.bTickOnlyRecent), __NFUN_206__(TickingAIList[i].TickSelfRecentTime, TickingAIList[i].default.TickSelfRecentTime)))
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0xC1C
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(__NFUN_302__("[", string(TickingAIList[i].bTickOnlyRecent)), ", ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xB6B;
	}
	__NFUN_209__(StartX, lengthX);
	__NFUN_210__(lengthXb, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, " ");
	DrawString(C, "--------------------------------------");
	i = 0;
	J0xD3E:

	// End:0xE87 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0xDDC
		if(__NFUN_150__(__NFUN_147__(TickingAIList[i].bTickOnlyRecent, TickingAIList[i].Class.default.bTickOnlyRecent), __NFUN_206__(TickingAIList[i].TickSelfRecentTime, TickingAIList[i].Class.default.TickSelfRecentTime)))
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0xE03
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(string(TickingAIList[i].TickSelfRecentTime), "]  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xD3E;
	}
	__NFUN_209__(StartX, float(__NFUN_189__(int(lengthX), int(lengthXb))));
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "bTickOnlyZoneRecent");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("bTickOnlyZoneRecent   ", xw, yh);
	lengthXb = xw;
	i = 0;
	J0xF69:

	// End:0x10A4 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0xFF3
		if(__NFUN_150__(__NFUN_147__(TickingAIList[i].bTickOnlyZoneRecent, TickingAIList[i].default.bTickOnlyZoneRecent), __NFUN_206__(TickingAIList[i].TickZoneRecentTime, TickingAIList[i].default.TickZoneRecentTime)))
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0x101A
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(__NFUN_302__("[", string(TickingAIList[i].bTickOnlyZoneRecent)), ", ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0xF69;
	}
	__NFUN_209__(StartX, lengthX);
	__NFUN_210__(lengthXb, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, " ");
	DrawString(C, "--------------------------------------");
	i = 0;
	J0x113C:

	// End:0x1270 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x11C6
		if(__NFUN_150__(__NFUN_147__(TickingAIList[i].bTickOnlyZoneRecent, TickingAIList[i].default.bTickOnlyZoneRecent), __NFUN_206__(TickingAIList[i].TickZoneRecentTime, TickingAIList[i].default.TickZoneRecentTime)))
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0x11ED
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(string(TickingAIList[i].TickZoneRecentTime), ", ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x113C;
	}
	__NFUN_209__(StartX, lengthX);
	__NFUN_210__(lengthXb, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, " ");
	DrawString(C, "-----------");
	i = 0;
	J0x12ED:

	// End:0x1441 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x1377
		if(__NFUN_150__(__NFUN_147__(TickingAIList[i].bTickOnlyZoneRecent, TickingAIList[i].default.bTickOnlyZoneRecent), __NFUN_206__(TickingAIList[i].TickZoneRecentTime, TickingAIList[i].default.TickZoneRecentTime)))
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0x139E
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(string(__NFUN_199__(TickingAIList[i].Level.TimeSeconds, TickingAIList[i].__NFUN_599__())), "]  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x12ED;
	}
	__NFUN_209__(StartX, float(__NFUN_189__(int(lengthX), int(lengthXb))));
	StartColumn(int(StartX), int(StartY), int(yh));
	lengthX = 0;
	C.DrawColor = WhiteColor;
	DrawString(C, "bTickOnlyNearby");
	DrawString(C, "--------------------------------------");
	C.__NFUN_1231__("bTickOnlyNearby  ", xw, yh);
	lengthXb = xw;
	i = 0;
	J0x151A:

	// End:0x1655 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x15A4
		if(__NFUN_150__(__NFUN_147__(TickingAIList[i].bTickOnlyNearby, TickingAIList[i].default.bTickOnlyNearby), __NFUN_206__(TickingAIList[i].TickNearbyRadius, TickingAIList[i].default.TickNearbyRadius)))
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0x15CB
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(__NFUN_302__("[", string(TickingAIList[i].bTickOnlyNearby)), ", ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x151A;
	}
	__NFUN_209__(StartX, lengthX);
	__NFUN_210__(lengthXb, lengthX);
	StartColumn(int(StartX), int(StartY), int(yh));
	C.DrawColor = WhiteColor;
	DrawString(C, " ");
	DrawString(C, "--------------------------------------");
	i = 0;
	J0x16E2:

	// End:0x1817 [Loop If]
	if(__NFUN_169__(i, string(TickingAIList)))
	{
		// End:0x176C
		if(__NFUN_150__(__NFUN_147__(TickingAIList[i].bTickOnlyNearby, TickingAIList[i].default.bTickOnlyNearby), __NFUN_206__(TickingAIList[i].TickNearbyRadius, TickingAIList[i].default.TickNearbyRadius)))
		{
			C.DrawColor = OrangeColor;			
		}
		else
		{
			// End:0x1793
			if(__NFUN_173__(__NFUN_164__(i, 2), 0))
			{
				C.DrawColor = LightBlueColor;				
			}
			else
			{
				C.DrawColor = WhiteColor;
			}
		}
		str = __NFUN_302__(string(TickingAIList[i].TickNearbyRadius), "]  ");
		DrawString(C, str);
		C.__NFUN_1231__(str, xw, yh);
		lengthX = float(__NFUN_189__(int(lengthX), int(xw)));
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x16E2;
	}
	__NFUN_209__(StartX, float(__NFUN_189__(int(lengthX), int(lengthXb))));
	return;
}
