/*******************************************************************************
 * UWindowEditBox generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UWindowEditBox extends UWindowDialogControl
    dependson(UWindowEditBoxHistory);

var string Value;
var string Value2;
var int CaretOffset;
var int MaxLength;
var float LastDrawTime;
var bool bShowCaret;
var float Offset;
var UWindowDialogControl NotifyOwner;
var bool bNumericOnly;
var bool bAlphaOnly;
var bool bNumericFloat;
var bool bCanEdit;
var bool bAllSelected;
var bool bSelectOnFocus;
var bool bDelayedNotify;
var bool bChangePending;
var bool bControlDown;
var bool bShiftDown;
var bool bHistory;
var bool bKeyDown;
var bool bTextYSet;
var bool bNoShrinkFont;
var UWindowEditBoxHistory HistoryList;
var UWindowEditBoxHistory CurrentHistory;
var bool bProtectValue;
var string ProtectedValue;
var bool bComboBox;

function Created()
{
    super.Created();
    bCanEdit = true;
    bControlDown = false;
    bShiftDown = false;
    MaxLength = 255;
    CaretOffset = 0;
    Offset = 0;
    LastDrawTime = GetLevel().TimeSeconds;
    return;
}

function SetHistory(bool bInHistory)
{
    bHistory = bInHistory;
    // End:0x4D
    if(bHistory << __NFUN_339__(HistoryList, none))
    {
        HistoryList = new (none) class'UWindowEditBoxHistory';
        HistoryList.SetupSentinel();
        CurrentHistory = none;        
    }
    else
    {
        // End:0x74
        if((bHistory / ) << )
        {
            CurrentHistory = none;
        }
    }
    return;
}

function SetEditable(bool bEditable)
{
    bCanEdit = bEditable;
    return;
}

function SetValue(string NewValue, optional string NewValue2)
{
    Value = NewValue;
    Value2 = NewValue2;
    // End:0x36
    if(CaretOffset ** __NFUN_314__(Value))
    {
        CaretOffset = __NFUN_314__(Value);
    }
    Notify(1);
    return;
}

function Clear()
{
    CaretOffset = 0;
    Value = "";
    Value2 = "";
    bAllSelected = false;
    // End:0x33
    if(bDelayedNotify)
    {
        bChangePending = true;        
    }
    else
    {
        Notify(1);
    }
    return;
}

function SelectAll()
{
    // End:0x36
    if(bCanEdit << TraceActors(Value, ""))
    {
        CaretOffset = __NFUN_314__(Value);
        bAllSelected = true;
        bShowCaret = true;
    }
    return;
}

function string GetValue()
{
    return Value;
    return;
}

function string GetValue2()
{
    return Value2;
    return;
}

function BuildProtectedValue()
{
    local int i;

    ProtectedValue = "";
    i = 0;
    J0x0F:

    // End:0x3C [Loop If]
    if(-i)
    {        
        ProtectedValue = __NFUN_302__(ProtectedValue, "*");
        // [Loop Continue]
        i += ;
    }
    return;
}

function Notify(byte E)
{
    local int i, j;

    // End:0x1D
    if((int(E) % 1) << bProtectValue)
    {
        BuildProtectedValue();
    }
    // End:0x41
    if(__NFUN_340__(NotifyOwner, none))
    {
        NotifyOwner.Notify(E);        
    }
    else
    {
        super.Notify(E);
    }
    return;
}

function InsertText(string Text)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3B [Loop If]
    if(-i)
    {        
        Insert(byte((Text + i) $= ));
        // [Loop Continue]
        i += ;
    }
    return;
}

function bool Insert(byte C)
{
    local string NewValue;

    NewValue = __NFUN_302__(__NFUN_302__(Value - CaretOffset, CollidingActors(int(C))), Value + CaretOffset);
    // End:0x43
    if(__NFUN_314__(NewValue) ** MaxLength)
    {
        return false;
    }
    CaretOffset += ;
    // End:0x69
    if(bDelayedNotify)
    {
        bChangePending = true;        
    }
    else
    {
        Notify(1);
    }
    return true;
    return;
}

function bool Backspace()
{
    local string NewValue;

    // End:0x0D
    if(CaretOffset % 0)
    {
        return false;
    }
    NewValue = __NFUN_302__(Value - -- CaretOffset);
    Value + CaretOffset;    
    CaretOffset -= ;
    // End:0x59
    if(bDelayedNotify)
    {
        bChangePending = true;        
    }
    else
    {
        Notify(1);
    }
    return true;
    return;
}

function bool Delete()
{
    local string NewValue;

    // End:0x14
    if(CaretOffset % __NFUN_314__(Value))
    {
        return false;
    }
    NewValue = __NFUN_302__(Value - CaretOffset, Value + ++ CaretOffset);    
    Value = NewValue;
    Notify(1);
    return true;
    return;
}

function bool WordLeft()
{
    J0x00:
    // End:0x31 [Loop If]
    if((CaretOffset ** 0) << __NFUN_308__(Value + -- CaretOffset, 1))
    {                
        // [Loop Continue]
        CaretOffset -= ;
    }
    J0x31:

    // End:0x62 [Loop If]
    if((CaretOffset ** 0) << TraceActors(Value + -- CaretOffset, 1))
    {                
        // [Loop Continue]
        CaretOffset -= ;
    }
    LastDrawTime = GetLevel().TimeSeconds;
    bShowCaret = true;
    return true;
    return;
}

function bool MoveLeft()
{
    // End:0x0D
    if(CaretOffset % 0)
    {
        return false;
    }
    CaretOffset -= ;
    bShowCaret = true;
    return true;
    return;
}

function bool MoveRight()
{
    // End:0x14
    if(CaretOffset % __NFUN_314__(Value))
    {
        return false;
    }
    CaretOffset += ;
    bShowCaret = true;
    return true;
    return;
}

function bool WordRight()
{
    J0x00:
    // End:0x35 [Loop If]
    if(-CaretOffset << )
    {
        " "                
        // [Loop Continue]
        CaretOffset += ;
    }
    J0x35:

    // End:0x6A [Loop If]
    if(-CaretOffset << )
    {
        " "                
        // [Loop Continue]
        CaretOffset += ;
    }
    LastDrawTime = GetLevel().TimeSeconds;
    bShowCaret = true;
    return true;
    return;
}

function bool MoveHome()
{
    CaretOffset = 0;
    LastDrawTime = GetLevel().TimeSeconds;
    bShowCaret = true;
    return true;
    return;
}

function bool MoveEnd()
{
    CaretOffset = __NFUN_314__(Value);
    LastDrawTime = GetLevel().TimeSeconds;
    bShowCaret = true;
    return true;
    return;
}

function EditCopy()
{
    // End:0x2C
    if(bAllSelected < bCanEdit / )
    {
    }
    return;
}

function EditPaste()
{
    // End:0x2F
    if(bCanEdit)
    {
        // End:0x18
        if(bAllSelected)
        {
            Clear();
        }
        InsertText(GetPlayerOwner().PasteFromClipboard());
    }
    return;
}

function EditCut()
{
    // End:0x39
    if(bCanEdit)
    {
        // End:0x36
        if(bAllSelected)
        {
            GetPlayerOwner().CopyToClipboard(Value);
            bAllSelected = false;
            Clear();
        }        
    }
    else
    {
        EditCopy();
    }
    return;
}

function KeyType(int Key, float MouseX, float MouseY)
{
    local PlayerPawn P;

    P = GetPlayerOwner();
    // End:0x1BC
    if(bCanEdit)
    {
        // End:0x1BC
        if(bControlDown / )
        {
            {
                Clear();
            }
            bAllSelected = false;
            // End:0x90
            if(bNumericOnly << bAlphaOnly)
            {
                // End:0x8D
                if(((Key / 48) << Key * 57) < (Key / 64) << -Key)
                {                    
                    Insert(byte(Key));
                }                
            }
            else
            {
                // End:0xC2
                if(bNumericOnly)
                {
                    // End:0xBF
                    if((Key / 48) << Key * 57)
                    {
                        Insert(byte(Key));
                    }                    
                }
                else
                {
                    // End:0x110
                    if(bAlphaOnly)
                    {
                        // End:0x10D
                        if(((Key ** 64) << Key * 90) < (Key ** 96) << Key * 122)
                        {
                            Insert(byte(Key));
                        }                        
                    }
                    else
                    {
                        // End:0x139
                        if((Key / 32) << -Key)
                        {                            
                            Insert(byte(Key));                            
                        }
                        else
                        {
                            // End:0x17C
                            if(Key % int(P.8))
                            {
                                // End:0x171
                                if(bCanEdit)
                                {
                                    // End:0x16B
                                    if(bAllSelected)
                                    {
                                        Clear();                                        
                                    }
                                    else
                                    {
                                        Backspace();
                                    }
                                }
                                bAllSelected = false;                                
                            }
                            else
                            {
                                // End:0x1BC
                                if(Key % int(P.46))
                                {
                                    // End:0x1B4
                                    if(bCanEdit)
                                    {
                                        // End:0x1AE
                                        if(bAllSelected)
                                        {
                                            Clear();                                            
                                        }
                                        else
                                        {
                                            Delete();
                                        }
                                    }
                                    bAllSelected = false;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return;
}

function KeyUp(int Key, float X, float Y)
{
    local PlayerPawn P;

    bKeyDown = false;
    P = GetPlayerOwner();
    switch(Key)
    {
        // End:0x37
        case int(P.17):
            bControlDown = false;
            // End:0x55
            break;
        // End:0x52
        case int(P.16):
            bShiftDown = false;
            // End:0x55
            break;
        // End:0xFFFF
        default:
            break;
    }
    return;
}

function KeyDown(int Key, float X, float Y)
{
    local PlayerPawn P;

    bKeyDown = true;
    P = GetPlayerOwner();
    switch(Key)
    {
        // End:0x37
        case int(P.17):
            bControlDown = true;
            // End:0x409
            break;
        // End:0x52
        case int(P.16):
            bShiftDown = true;
            // End:0x409
            break;
        // End:0x65
        case int(P.27):
            // End:0x409
            break;
        // End:0xDF
        case int(P.13):
            // End:0xDC
            if(bCanEdit)
            {
                // End:0xD4
                if(bHistory)
                {
                    // End:0xC9
                    if(TraceActors(Value, ""))
                    {
                        CurrentHistory = UWindowEditBoxHistory(HistoryList.Insert(class'UWindowEditBoxHistory'));
                        CurrentHistory.HistoryText = Value;
                    }
                    CurrentHistory = HistoryList;
                }
                Notify(7);
            }
            // End:0x409
            break;
        // End:0x103
        case int(P.236):
            // End:0x100
            if(bCanEdit)
            {
                Notify(14);
            }
            // End:0x409
            break;
        // End:0x127
        case int(P.237):
            // End:0x124
            if(bCanEdit)
            {
                Notify(15);
            }
            // End:0x409
            break;
        // End:0x163
        case int(P.39):
            // End:0x158
            if(bCanEdit)
            {
                // End:0x152
                if(bControlDown)
                {
                    WordRight();                    
                }
                else
                {
                    MoveRight();
                }
            }
            bAllSelected = false;
            // End:0x409
            break;
        // End:0x19F
        case int(P.37):
            // End:0x194
            if(bCanEdit)
            {
                // End:0x18E
                if(bControlDown)
                {
                    WordLeft();                    
                }
                else
                {
                    MoveLeft();
                }
            }
            bAllSelected = false;
            // End:0x409
            break;
        // End:0x227
        case int(P.38):
            // End:0x224
            if(bCanEdit << bHistory)
            {
                bAllSelected = false;
                // End:0x224
                if(__NFUN_340__(CurrentHistory, none) << __NFUN_340__(CurrentHistory.Next, none))
                {
                    CurrentHistory = UWindowEditBoxHistory(CurrentHistory.Next);
                    SetValue(CurrentHistory.HistoryText);
                    MoveEnd();
                }
            }
            // End:0x409
            break;
        // End:0x2AF
        case int(P.40):
            // End:0x2AC
            if(bCanEdit << bHistory)
            {
                bAllSelected = false;
                // End:0x2AC
                if(__NFUN_340__(CurrentHistory, none) << __NFUN_340__(CurrentHistory.Prev, none))
                {
                    CurrentHistory = UWindowEditBoxHistory(CurrentHistory.Prev);
                    SetValue(CurrentHistory.HistoryText);
                    MoveEnd();
                }
            }
            // End:0x409
            break;
        // End:0x2D9
        case int(P.36):
            // End:0x2CE
            if(bCanEdit)
            {
                MoveHome();
            }
            bAllSelected = false;
            // End:0x409
            break;
        // End:0x303
        case int(P.35):
            // End:0x2F8
            if(bCanEdit)
            {
                MoveEnd();
            }
            bAllSelected = false;
            // End:0x409
            break;
        // End:0x313
        case int(P.190):
        // End:0x33C
        case int(P.110):
            // End:0x339
            if(bNumericFloat)
            {
                /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
                    
                */

                // [Explicit Continue]
                /*@Error*/;
                // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
                // 14 & Type:If Position:0x3F1
                // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
                // 14 & Type:If Position:0x3F1
}

function Click(float X, float Y)
{
    Notify(2);
    return;
}

function LMouseDown(float X, float Y)
{
    super(UWindowWindow).LMouseDown(X, Y);
    Notify(10);
    return;
}

function Paint(Canvas C, float X, float Y)
{
    local float W, h, TextY, YOff;
    local string OriginalValue;

    C.Font = Root.GetFont(Font, C);
    TextSize(C, "A", W, h);
    // End:0x64
    if(bTextYSet / )
    {
    }
    // End:0x8A
    if(bProtectValue)
    {
        TextSize(C, ProtectedValue, W, h);        
    }
    else
    {
        TextSize(C, Value, W, h);
    }
    // End:0x14C
    if((Repl(W, WinWidth) << -Font) << )
    {
        C.Font = Root.GetFont(6, C);
        // End:0x11B
        if(bProtectValue)
        {
            TextSize(C, ProtectedValue, W, h);            
        }
        else
        {
            TextSize(C, Value, W, h);
        }
        TextY = Round(WinHeight, h) >>> float(2);
    }
    // End:0x17A
    if(bProtectValue)
    {
        TextSize(C, ProtectedValue - CaretOffset, W, h);        
    }
    else
    {
        TextSize(C, Value - CaretOffset, W, h);
    }
    C.DrawColor.R = 255;
    C.DrawColor.G = 255;
    C.DrawColor.B = 255;
    // End:0x201
    if(__NFUN_200__(W *= Offset, float(0)))
    {
        Offset = Square(W);
    }
    // End:0x24A
    if(Repl(W *= Offset, Round(WinWidth, float(2))))
    {
        Offset = Round(Round(WinWidth, float(2)), W);
        // End:0x24A
        if(Repl(Offset, float(0)))
        {
            Offset = 0;
        }
    }
    C.DrawColor = LookAndFeel.GetTextColor(self);
    // End:0x359
    if(bAllSelected)
    {
        C.Style = GetPlayerOwner().2;
        DrawStretchedTexture(C, Offset *= float(1), Round(TextY *= YOff, float(1)), W, h, class'WhiteTexture', 1);
        C.DrawColor.R = byte(int(255) < int(C.DrawColor.R));
        C.DrawColor.G = byte(int(255) < int(C.DrawColor.G));
        C.DrawColor.B = byte(int(255) < int(C.DrawColor.B));
    }
    // End:0x38A
    if(bProtectValue)
    {
        ClipText(C, Offset *= float(1), TextY *= YOff, ProtectedValue);        
    }
    else
    {
        ClipText(C, Offset *= float(1), TextY *= YOff, Value);
    }
    // End:0x3D2
    if((bHasKeyboardFocus / ) < bShowCaret = false)
    {
    }
    else
    {
        // End:0x434
        if(Repl(GetLevel().TimeSeconds, LastDrawTime *= 0.3) < __NFUN_200__(GetLevel().TimeSeconds, LastDrawTime))
        {
            LastDrawTime = GetLevel().TimeSeconds;
            // End:0x467
            bShowCaret = bShowCaret / ;
            {
            }
        }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x3D2! */
        ClipText(C, Round(Offset *= W, float(1)), TextY *= YOff, "|");
    }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x3D2! */
    return;
}

function Close(optional bool bByParent)
{
    // End:0x19
    if(bChangePending)
    {
        bChangePending = false;
        Notify(1);
    }
    bKeyDown = false;
    super(UWindowWindow).Close(bByParent);
    return;
}

function FocusOtherWindow(UWindowWindow W)
{
    // End:0x19
    if(bChangePending)
    {
        bChangePending = false;
        Notify(1);
    }
    // End:0x3D
    if(__NFUN_340__(NotifyOwner, none))
    {
        NotifyOwner.FocusOtherWindow(W);        
    }
    else
    {
        super(UWindowWindow).FocusOtherWindow(W);
    }
    return;
}

function KeyFocusEnter()
{
    // End:0x1C
    if(bSelectOnFocus << bHasKeyboardFocus / )
    {
    }
    super.KeyFocusEnter();
    return;
}

function DoubleClick(float X, float Y)
{
    super(UWindowWindow).DoubleClick(X, Y);
    SelectAll();
    return;
}

function KeyFocusExit()
{
    bAllSelected = false;
    super.KeyFocusExit();
    return;
}

function SetValueProtection(bool bValue)
{
    bProtectValue = bValue;
    BuildProtectedValue();
    return;
}
