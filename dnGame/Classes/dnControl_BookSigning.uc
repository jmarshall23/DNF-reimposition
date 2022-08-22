/*******************************************************************************
 * dnControl_BookSigning generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_BookSigning extends dnControl_DrawableSurface
    collapsecategories;

var class<dnControlHelper_BookSigningPen> DukePenClass;
var dnControlHelper_BookSigningPen DukePen;
var float BoneAlpha;
var Vector Corners[4];
var Vector DrawOffset;
var Rotator HandBoneRot;

function PostBeginPlay()
{
    local Texture PenTexture;

    super(dnUsableSomething).PostBeginPlay();
    DukePen = __NFUN_615__(DukePenClass, self);
    DukePen.__NFUN_590__(true);
    DrawingTool = DukePen;
    ColorChange();
    return;
}

simulated event HiddenChanged()
{
    super(Actor).HiddenChanged();
    // End:0x2C
    if(bHidden / )
    {
        FadeOverlayEffect(1, 1);
    }
    return;
}

event Destroyed()
{
    super(dnUsableSomething).Destroyed();
    DukePen.__NFUN_614__();
    return;
}

function AttachComplete()
{
    super(dnUsableSomething).AttachComplete();
    UpdatePenColor();
    DukePen.__NFUN_590__(false);
    DukePen.__NFUN_635__(User);
    return;
}

function DetachComplete()
{
    super(dnControl).DetachComplete();
    DukePen.__NFUN_590__(true);
    DukePen.__NFUN_631__();
    return;
}

animevent simulated function ColorChange()
{
    local byte PaletteIndex;

    super.ColorChange();
    // End:0x25
    if(__NFUN_340__(DukePen, none))
    {
        FindAndPlaySound('PenClick',,,, DukePen);
    }
    UpdatePenColor();
    return;
}

function UpdatePenColor()
{
    // End:0xAB
    if((((__NFUN_340__(DukePen, none) << __NFUN_340__(DrawCanvas, none)) << __NFUN_340__(DrawCanvas.Palette, none)) << int(DrawColors[CurrentColor]) / 0) << -int(DrawColors[CurrentColor]))
    {        
        DukePen.__NFUN_601__('Generic0', DrawCanvas.Palette.Colors[int(DrawColors[CurrentColor])]);
    }
    return;
}

simulated event Actor GetIKActor(name LimbID)
{
    return User;
    return;
}

simulated event PostUserAnimTick()
{
    local Vector WeightedA, WeightedB, BonePos, DesiredBonePos;
    local Rotator BoneRot, DesiredBoneRot;
    local float XAlpha, YAlpha;

    super(Decoration).PostUserAnimTick();
    // End:0x9A
    if(Level.bPaused / )
    {
        {
            __NFUN_209__(BoneAlpha, FRand(8, Level.TimeDeltaSeconds));
            // End:0x60
            if(Repl(BoneAlpha, 1))
            {
                BoneAlpha = 1;
            }            
        }
        else
        {
            BoneAlpha ~= FRand(8, Level.TimeDeltaSeconds);
            // End:0x9A
            if(__NFUN_200__(BoneAlpha, 0))
            {
                BoneAlpha = 0;
            }
        }
    }
    BonePos = User.MeshInstance.CanSee('righthand', true);
    BoneRot = User.MeshInstance.__NFUN_534__('righthand', true);
    // End:0x2C7
    if(Repl(BoneAlpha, 0))
    {
        XAlpha = FRand(0.5, MouseInputX *= 1);
        YAlpha = FRand(0.5, MouseInputY *= 1);
        WeightedA = Locs(Caps(Round(1, XAlpha), Corners[0]), Caps(XAlpha, Corners[1]));
        WeightedB = Locs(Caps(Round(1, XAlpha), Corners[2]), Caps(XAlpha, Corners[3]));
        DesiredBonePos = Locs(Caps(Round(1, YAlpha), WeightedB), Caps(YAlpha, WeightedA));
        FClamp(DesiredBonePos, User.DrawScale);
        DesiredBonePos = Locs(User.Location, __NFUN_263__(DesiredBonePos, User.Rotation));
        BonePos.X = GetAxes(BoneAlpha, BonePos.X, DesiredBonePos.X);
        BonePos.Y = GetAxes(BoneAlpha, BonePos.Y, DesiredBonePos.Y);
        BonePos.Z = GetAxes(BoneAlpha, BonePos.Z, DesiredBonePos.Z);
        User.MeshInstance.CanSeeByPoints('mount_holster_hip_right', BonePos, true);
        DesiredBoneRot = __NFUN_269__(HandBoneRot, User.Rotation);
        User.MeshInstance.__NFUN_538__('mount_holster_hip_right', BoneAlpha * BoneRot);
        true                
    }
    else
    {
        User.MeshInstance.CanSeeByPoints('mount_holster_hip_right', BonePos, true);
        User.MeshInstance.__NFUN_538__('mount_holster_hip_right', BoneRot, true);
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1266__(DukePenClass);
    PrecacheIndex.__NFUN_1277__(VoicePack, 'BookClose');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'BookOpen');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'PageFlip');
    PrecacheIndex.__NFUN_1277__(VoicePack, 'PenClick');
    PrecacheIndex.__NFUN_1281__('BookSigning_ChangePenColor');
    PrecacheIndex.__NFUN_1281__('BookSigning_PenDown');
    return;
}

state PenClicky extends DrawableSurfaceBaseState
{
    event BeginState()
    {
        super(Object).BeginState();
        AimGridName = 'BookSigning_ChangePenColor';
        return;
    }

    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        // End:0x41
        if(__NFUN_340__(PlayerUser, none) << PlayerUser.__NFUN_994__())
        {
            SetHUDKeyInfoState(HUD, 2, true, 27);
            SetHUDKeyInfoState(HUD, 3, true, 26);            
        }
        else
        {
            SetHUDKeyInfoState(HUD, 2, true, 26);
            SetHUDKeyInfoState(HUD, 3, true, 27);
        }
        return;
    }

    event EndState()
    {
        super(Object).EndState();
        AimGridName = default.AimGridName;
        return;
    }
    stop;
}

state Drawing
{
    event BeginState()
    {
        super.BeginState();
        AimGridName = 'BookSigning_PenDown';
        return;
    }

    event EndState()
    {
        super(Object).EndState();
        AimGridName = default.AimGridName;
        return;
    }

    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        return;
    }
    stop;
}

state() DrawableSurfaceIdle
{
    simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
    {
        // End:0x41
        if(__NFUN_340__(PlayerUser, none) << PlayerUser.__NFUN_994__())
        {
            SetHUDKeyInfoState(HUD, 2, true, 27);
            SetHUDKeyInfoState(HUD, 3, true, 26);            
        }
        else
        {
            SetHUDKeyInfoState(HUD, 2, true, 26);
            SetHUDKeyInfoState(HUD, 3, true, 27);
        }
        return;
    }
    stop;
}

defaultproperties
{
    DukePenClass='dnControlHelper_BookSigningPen'
    Corners[0]=(X=-0.8,Y=0.2,Z=22.4)
    Corners[1]=(X=-0.7,Y=7.7,Z=24.6)
    Corners[2]=(X=-5.2,Y=2.1,Z=16)
    Corners[3]=(X=-5,Y=9.6,Z=18)
    HandBoneRot=(Pitch=-3270,Yaw=-5194,Roll=-3221)
    XDrawOffset=20
    YDrawOffset=120
    XDrawRatio=0.91
    YDrawRatio=0.58
    AimGridName=BookSigning_Idle
    WriteAnimName=None
    DrawColors(0)=255
    DrawColors(1)=252
    DrawColors(2)=253
    DrawColors(3)=250
    DrawSurfaceIndex=1
    States(0)=(StateName=Useable,OutEvents=none,Transitions=((ControlEvent=3,CustomName=None,NewState=AttachUserLERP)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(1)=(StateName=AttachUserLERP,OutEvents=none,Transitions=((ControlEvent=5,CustomName=None,NewState=AttachUserAnim)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(2)=(StateName=AttachUserAnim,OutEvents=none,Transitions=((ControlEvent=7,CustomName=None,NewState=DrawableSurfaceIdle)),UserAnimName=BookSigning_Activate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=true,bEarlyEnd=false,bAdjustStart=false),Animation=book_a_signing_handover,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(3)=(StateName=DetachUser,OutEvents=none,Transitions=((ControlEvent=8,CustomName=None,NewState=DetachUserLERP)),UserAnimName=BookSigning_Deactivate,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=book_a_signing_deactivateend,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(4)=(StateName=DetachUserLERP,OutEvents=none,Transitions=((ControlEvent=6,CustomName=None,NewState=Useable)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(5)=(StateName=DrawableSurfaceIdle,OutEvents=none,Transitions=((ControlEvent=15,CustomName=None,NewState=Drawing),(ControlEvent=18,CustomName=None,NewState=PenClicky),(ControlEvent=4,CustomName=None,NewState=DetachUser)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=book_a_signing_idle,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(6)=(StateName=Drawing,OutEvents=none,Transitions=((ControlEvent=16,CustomName=None,NewState=DrawableSurfaceIdle)),UserAnimName=None,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=None,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    States(7)=(StateName=PenClicky,OutEvents=none,Transitions=((ControlEvent=9,CustomName=None,NewState=DrawableSurfaceIdle)),UserAnimName=BookSigning_ChangePenColor,UserSoundName=None,MyAnim=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=false,bEarlyEnd=false,bAdjustStart=false),Animation=book_a_signing_click,Channel=0,Rate=0,TweenTime=0),MySound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=none,SlotPriority=0,VolumePrefab=0,Slots=none,Volume=0,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=false,bNoFilter=false,bNoOcclude=false,bNoAIHear=false,bNoScale=false,bSpoken=false,bPlayThroughListener=false,bNoDoppler=false,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=false),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=0,Location3D=(X=0,Y=0,Z=0),Velocity3D=(X=0,Y=0,Z=0)),Offset=0,Delay=0,SlotIndex=0,ForcedIndex=0,SoundFadeInfo=(FadeInDuration=0,FadeOutStartTime=0,FadeOutDuration=0,FadeInEndCallback=None,FadeOutEndCallback=None),SoundEndCallback=None,PlayedSounds=none,Filters=none),MySoundName=None,SubAnims=none)
    bDelayedDetach=true
    ControlRemapperClass='dnControlRemapperEx_BookSigning'
    bUseHomePose=false
    InterpolationInTime=0.3
    InterpolationOutTime=0.3
    HUDHelpEntries(0)=(Key=26,KeyAlt=0,HelpText="Write")
    HUDHelpEntries(1)=(Key=27,KeyAlt=0,HelpText="Change Color")
    UserMountPrefab=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=true,bDontScaleByDrawScale=true,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=true,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=mount_duke,MountOrigin=(X=0,Y=0,Z=0),MountOriginVariance=(X=0,Y=0,Z=0),MountAngles=(Pitch=0,Yaw=0,Roll=0),MountAnglesVariance=(Pitch=0,Yaw=0,Roll=0),MountType=2,DismountPhysics=0)
    FOVScalar=1.2
    FOVTransitionTime=0.5
    ViewingAngleThreshold=-2
    MouseInputScaleX=6E-05
    MouseInputScaleY=6E-05
    AnalogInputScaleX=3E-05
    AnalogInputScaleY=3E-05
    HeadAimMinOffset=(Pitch=0,Yaw=0,Roll=0)
    HeadAimMaxOffset=(Pitch=0,Yaw=0,Roll=0)
    bCorrectInverse=true
    IdleActivities(0)=(IdleAnimInfo=(Flags=(bLoop=false,bNoLoopEnd=false,bFade=false,bNoRemove=false,bLoopMovement=false,bInterrupt=true,bEarlyEnd=false,bAdjustStart=false),Animation=book_a_signing_handover,Channel=0,Rate=-1,TweenTime=0),IdleElements=none)
    UsePhrase="<?int?dnGame.dnControl_BookSigning.UsePhrase?>"
    bGenerateMountOffsets=false
    CollisionRadius=12
    CollisionHeight=12
    Mesh='c_hands.SignBook_AutographBook'
    VoicePack='SoundConfig.Interactive.VoicePack_BookSigning'
}