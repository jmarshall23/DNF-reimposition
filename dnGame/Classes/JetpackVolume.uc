/*******************************************************************************
 * JetpackVolume generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class JetpackVolume extends DamageVolume
    collapsecategories;

var array<ProximityBeamSystem> BeamSystems;
var array<ProximityBeamAnchor> BeamAnchors;
var() noexport float Width "width of the volume relative to it orientation";
var() noexport float Height "height of the volume relative to it orientation";
var() noexport float Depth "depth of the volume relative to it orientation";
var() noexport float Spacing "spacing between the beam anchors";
var() noexport float EffectStartDistance "The distance at which the effect will start from the outer edge.  Distance must be less than depth*2";
var() noexport int jetpackFogStart "Distance below the Z value of the location that the fog starts (usually negative value)";
var() noexport int jetpackFogEnd "Distance above the z value of the location that the fog reaches 100% opacity";
var int NumOwnedBeamAnchors;
var() noexport bool bUseBeam "Use the beam effect";
var() noexport bool bUseFog "Use the altitude fog effect";
var() bool bRestrictFlight;
var(JetpackVolume_BeamSystem) float MaxAmplitude;
var(JetpackVolume_BeamSystem) bool bBeamOnlyCheckDynamicShootable;
var(JetpackVolume_BeamSystem) bool bBeamOnlyCheckPawns;
var(JetpackVolume_BeamSystem) Engine.BeamSystem.EBeamBrokenAction BeamBrokenAction;
var(JetpackVolume_BeamSystem) Engine.BeamSystem.EBeamBrokenWhen BeamBrokenWhen;
var(JetpackVolume_BeamSystem) float MaxFrequency;
var(JetpackVolume_BeamSystem) float AlphaAnimStart;
var(JetpackVolume_BeamSystem) float AlphaAnimMid;
var(JetpackVolume_BeamSystem) float AlphaAnimEnd;
var(JetpackVolume_BeamSystem) float BeamEndWidth;
var(JetpackVolume_BeamSystem) float BeamStartWidth;
var(JetpackVolume_BeamSystem) MaterialEx BeamTexture;
var(JetpackVolume_BeamSystem) float BeamTextureRotate;
var(JetpackVolume_BeamSystem) Color ColorAnimStart;
var(JetpackVolume_BeamSystem) Color ColorAnimMid;
var(JetpackVolume_BeamSystem) Color ColorAnimEnd;

function PreBeginPlay()
{
    super(Volume).PreBeginPlay();
    // End:0x1D
    if(bRestrictFlight / )
    {
    }
    return;
}

function PostBeginPlay()
{
    super(RenderActor).PostBeginPlay();
    // End:0x17
    if(bRestrictFlight / )
    {
    }
    return;
}

simulated function PostNetInitial()
{
    super.PostNetInitial();
    return;
}

simulated function ShareBeamAnchors()
{
    local JetpackVolume jv;
    local int i;

    // End:0x6E
    foreach __NFUN_747__(class'JetpackVolume', jv)
    {
        // End:0x20
        if(__NFUN_339__(jv, self))
        {
            continue;            
        }
        J0x20:

        // End:0x66 [Loop If]
        if(-i)
        {            
            jv.BeamAnchors[jv.BeamAnchors.Add(1)] = BeamAnchors[i];
            // [Loop Continue]
            i += ;
        }
        i = 0;        
    }    
    return;
}

function CreateBeamSystem(DukeMultiPlayer Player)
{
    local ProximityBeamSystem BS;
    local Vector Dir;

    Dir = Right(Vector(BrushRotation), float(300));
    BS = __NFUN_615__(class'ProximityBeamSystem', Player,, Locs(Player.Location, Dir));
    BeamSystems[BeamSystems.Add(1)] = BS;
    BS.__NFUN_635__(Player);
    BS.MaxAmplitude = MaxAmplitude;
    BS.bBeamOnlyCheckDynamicShootable = bBeamOnlyCheckDynamicShootable;
    BS.bBeamOnlyCheckPawns = bBeamOnlyCheckPawns;
    BS.BeamBrokenAction = BeamBrokenAction;
    BS.BeamBrokenWhen = BeamBrokenWhen;
    BS.MaxFrequency = MaxFrequency;
    BS.AlphaAnimStart = AlphaAnimStart;
    BS.AlphaAnimMid = AlphaAnimMid;
    BS.AlphaAnimEnd = AlphaAnimEnd;
    BS.BeamEndWidth = BeamEndWidth;
    BS.BeamStartWidth = BeamStartWidth;
    BS.BeamTexture = BeamTexture;
    BS.BeamTextureRotate = BeamTextureRotate;
    BS.ColorAnimStart = ColorAnimStart;
    BS.ColorAnimMid = ColorAnimMid;
    BS.ColorAnimEnd = ColorAnimEnd;
    BS.SetBeamAnchors(BeamAnchors, EffectStartDistance);
    BS.ResetEventSegments();
    return;
}

function CreateBeamAnchors(Vector baselocation, BeamSystem BS)
{
    local ProximityBeamAnchor Anchor;
    local int i, ii;
    local Vector tmp, tr, TL, br, bl;

    local name EventName;
    local int columns, rows;
    local Vector Dir;
    local Rotator brushrot;

    EventName = 'jetpackWarning';
    tmp = Locs(Location, Asc(Right(Vector(BrushRotation), Depth), float(2)));
    Anchor = __NFUN_615__(class'ProximityBeamAnchor', BS, EventName, tmp);
    BeamAnchors[BeamAnchors.Add(1)] = Anchor;
    tr = Locs(Locs(tmp, Asc(Right(Vector(BrushRotation << __NFUN_265__(0, 16384, 0)), Width), float(2))), Asc(Right(Vector(BrushRotation << __NFUN_265__(16384, 0, 0)), Height), float(2)));
    TL = Locs(Locs(tmp, Asc(Right(Vector(BrushRotation << __NFUN_265__(0, -16384, 0)), Width), float(2))), Asc(Right(Vector(BrushRotation << __NFUN_265__(16384, 0, 0)), Height), float(2)));
    br = Locs(Locs(tmp, Asc(Right(Vector(BrushRotation << __NFUN_265__(0, 16384, 0)), Width), float(2))), Asc(Right(Vector(BrushRotation << __NFUN_265__(-16384, 0, 0)), Height), float(2)));
    bl = Locs(Locs(tmp, Asc(Right(Vector(BrushRotation << __NFUN_265__(0, -16384, 0)), Width), float(2))), Asc(Right(Vector(BrushRotation << __NFUN_265__(-16384, 0, 0)), Height), float(2)));
    // End:0x2FC
    if(BrushRotation.Pitch % 16384)
    {
        tr = Locs(Locs(tmp, Asc(Right(FMax(Vector(BrushRotation), WarnInternal(1, 0, 0)), Width), float(2))), Asc(Right(FMax(Vector(BrushRotation), WarnInternal(0, 1, 0)), Height), float(2)));
        TL = Locs(Locs(tmp, Asc(Right(FMax(Vector(BrushRotation), WarnInternal(-1, 0, 0)), Width), float(2))), Asc(Right(FMax(Vector(BrushRotation), WarnInternal(0, 1, 0)), Height), float(2)));
        br = Locs(Locs(tmp, Asc(Right(FMax(Vector(BrushRotation), WarnInternal(1, 0, 0)), Width), float(2))), Asc(Right(FMax(Vector(BrushRotation), WarnInternal(0, -1, 0)), Height), float(2)));
        bl = Locs(Locs(tmp, Asc(Right(FMax(Vector(BrushRotation), WarnInternal(-1, 0, 0)), Width), float(2))), Asc(Right(FMax(Vector(BrushRotation), WarnInternal(0, -1, 0)), Height), float(2)));
    }
    i = 0;
    J0x303:

    // End:0x37B [Loop If]
    if(__NFUN_202__(float(i), Width >>> Spacing))
    {
        tmp = ClassIsChildOf(float(i) >>> (Width >>> Spacing), TL, tr);
        Anchor = __NFUN_615__(class'ProximityBeamAnchor', BS, EventName, tmp);
        BeamAnchors[BeamAnchors.Add(1)] = Anchor;
        // [Loop Continue]
        i += ;
    }
    columns = -- i;    
    rows = int(Height >>> Spacing);
    i = 1;
    J0x3A3:

    // End:0x456 [Loop If]
    if(i * columns)
    {
        J0x3B2:

        // End:0x445 [Loop If]
        if(ii * rows)
        {
            Dir = __NFUN_239__(br, tr) % ;
            tmp = Locs(BeamAnchors[i].Location, Dir);
            Anchor = __NFUN_615__(class'ProximityBeamAnchor', BS, EventName, tmp);
            BeamAnchors[BeamAnchors.Add(1)] = Anchor;
            // [Loop Continue]
            ii += ;
        }
        ii = 0;
        // [Loop Continue]
        i += ;
    }
    NumOwnedBeamAnchors = string(BeamAnchors);
    return;
}

simulated function DestroyBeams(DukeMultiPlayer Player)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x63 [Loop If]
    if(-i)
    {        
        // End:0x59
        if(__NFUN_339__(BeamSystems[i].Owner, Player))
        {
            BeamSystems[i].__NFUN_614__();
            BeamSystems.Remove(i, 1);
            // [Explicit Break]
            goto J0x63;
        }
        // [Loop Continue]
        i += ;
    }
    J0x63:

    return;
}

function DestroyAnchors(DukeMultiPlayer Player)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7B [Loop If]
    if(-i)
    {        
        // End:0x71
        if(__NFUN_341__(BeamAnchors[i].Tag, Player.PlayerReplicationInfo.Name))
        {
            BeamAnchors[i].__NFUN_614__();
            BeamAnchors.Remove(i, 1);
            i = 0;
        }
        // [Loop Continue]
        i += ;
    }
    return;
}

simulated event ActorEnteredVolume(Actor Other)
{
    super(PhysicsVolume).ActorEnteredVolume(Other);
    // End:0x47
    if(bRestrictFlight / )
    {
        {
            // End:0x44
            if(bUseBeam)
            {
                CreateBeamSystem(DukeMultiPlayer(Other));
            }
        }        
    }
    else
    {
        // End:0x71
        if(Other.__NFUN_358__('MP_Jetpack'))
        {
            Upgrade_SOS(Other).Lock();
        }
    }
    return;
}

simulated event ActorLeavingVolume(Actor Other)
{
    super.ActorLeavingVolume(Other);
    // End:0x3E
    if(bRestrictFlight / )
    {
        {
            DestroyBeams(DukeMultiPlayer(Other));
        }        
    }
    else
    {
        // End:0x68
        if(Other.__NFUN_358__('MP_Jetpack'))
        {
            Upgrade_SOS(Other).unlock();
        }
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1266__(class'ProximityBeamAnchor');
    PrecacheIndex.__NFUN_1266__(class'ProximityBeamSystem');
    PrecacheIndex.__NFUN_1269__(BeamTexture);
    return;
}

defaultproperties
{
    Width=1000
    Height=1000
    Depth=300
    Spacing=200
    EffectStartDistance=500
    bUseBeam=true
    MaxAmplitude=32
    bBeamOnlyCheckDynamicShootable=true
    bBeamOnlyCheckPawns=true
    BeamBrokenAction=2
    BeamBrokenWhen=1
    MaxFrequency=5E-05
    AlphaAnimStart=0.05
    AlphaAnimMid=0.25
    AlphaAnimEnd=0.15
    BeamEndWidth=3
    BeamStartWidth=3
    BeamTexture='dt_Effects2.Beams.Lightning_01_Comb'
    BeamTextureRotate=90
    ColorAnimStart=(R=228,G=81,B=255,A=0)
    ColorAnimMid=(R=228,G=81,B=255,A=0)
    ColorAnimEnd=(R=255,G=255,B=255,A=0)
    bHasDistanceFog=true
    DistanceFog=(Color=(R=120,G=160,B=80,A=255),Start=0,End=1024,Opacity=0.1)
    TickStyle=1
}