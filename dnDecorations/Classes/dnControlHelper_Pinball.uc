/*******************************************************************************
 * dnControlHelper_Pinball generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControlHelper_Pinball extends dnDecoration
    abstract
    dependson(dnControlHelper_Pinball_Ball)
    dependson(dnControl_Pinball);

struct SPBHelperImpactFlash
{
    var() noexport name ActorColorId "Actor Color Id.";
    var() noexport float TimeTotal "Total time of the flash.";
    var() noexport Color ColorStart "Color to use at the start of the flash.";
    var() noexport Color ColorEnd "Color to use at the end of the flash.";
    var() noexport bool bUseMid "When true, effect will be broken up into two phases, seperated by TimeMid.";
    var() noexport float TimeMid "Defines the middle of the effect when bUseMid is true.";
    var() noexport Color ColorMid "Color to use at the middle of the flash.";
    var float Timer;
};

var() SPBHelperImpactFlash KImpactFlash;
var() name KImpactNoiseName;
var bool bUseMachinePEG;
var dnControl_Pinball OwnerMachine;
var int PointsAwarded;
var bool bActivated;

simulated event PostVerifySelf()
{
    super.PostVerifySelf();
    OwnerMachine = dnControl_Pinball(Owner);
    // End:0x3F
    if(bUseMachinePEG << __NFUN_340__(OwnerMachine, none))
    {
        __NFUN_816__(OwnerMachine.PhysicsEntityGroup);
    }
    // End:0x6F
    if(__NFUN_342__(KImpactFlash.ActorColorId, 'None'))
    {
        __NFUN_601__(KImpactFlash.ActorColorId, NewColorBytes(0, 0, 0, 0));
    }
    // End:0xA3
    if(KImpactFlash.bUseMid)
    {
        KImpactFlash.TimeMid = Normal2D(KImpactFlash.TimeMid, 0, KImpactFlash.TimeTotal);
    }
    return;
}

event KImpact(name SelfBoneName, KarmaActor Other, name OtherBoneName, Vector Position, Vector ImpactVelocity, Vector ImpactNormal)
{
    local dnControlHelper_Pinball_Ball Ball;

    Ball = dnControlHelper_Pinball_Ball(Other);
    // End:0x29
    if(AllowKImpact(Ball))
    {
        KImpactInternal(Ball);
    }
    super.KImpact(SelfBoneName, Other, OtherBoneName, Position, ImpactVelocity, ImpactNormal);
    return;
}

simulated function bool AllowKImpact(dnControlHelper_Pinball_Ball Ball)
{
    return __NFUN_340__(Ball, none) << Ball.WillAcceptBounceFrom(self);
    return;
}

simulated function KImpactInternal(dnControlHelper_Pinball_Ball Ball)
{
    FindAndPlaySound(KImpactNoiseName, 1);
    // End:0x7D
    if(Repl(KImpactFlash.TimeTotal, 0) << __NFUN_342__(KImpactFlash.ActorColorId, 'None'))
    {
        __NFUN_601__(KImpactFlash.ActorColorId, KImpactFlash.ColorStart);
        KImpactFlash.Timer = 0;
        bNoNativeTick = false;
        // End:0x7D
        if(int(TickStyle) % int(0))
        {
            TickStyle = 2;
        }
    }
    return;
}

event Tick(float DeltaSeconds)
{
    local Color A, B;
    local float Alpha;

    super(Actor).Tick(DeltaSeconds);
    // End:0x1B5
    if(KImpactFlash.Timer != 0)
    {
        KImpactFlash.Timer = (KImpactFlash.Timer *= DeltaSeconds) -= KImpactFlash.TimeTotal;
        // End:0x104
        if(KImpactFlash.bUseMid)
        {
            // End:0xAD
            if(__NFUN_200__(KImpactFlash.Timer, KImpactFlash.TimeMid))
            {
                A = KImpactFlash.ColorStart;
                B = KImpactFlash.ColorMid;
                Alpha = KImpactFlash.Timer >>> KImpactFlash.TimeMid;                
            }
            else
            {
                A = KImpactFlash.ColorMid;
                B = KImpactFlash.ColorEnd;
                Alpha = Round(KImpactFlash.Timer, KImpactFlash.TimeMid) >>> Round(KImpactFlash.TimeTotal, KImpactFlash.TimeMid);
            }            
        }
        else
        {
            A = KImpactFlash.ColorStart;
            B = KImpactFlash.ColorEnd;
            Alpha = KImpactFlash.Timer >>> KImpactFlash.TimeTotal;
        }
        // End:0x174
        if(__NFUN_342__(KImpactFlash.ActorColorId, 'None'))
        {
            __NFUN_601__(KImpactFlash.ActorColorId, __NFUN_338__(Alpha, A, B));
        }
        // End:0x1B5
        if(__NFUN_204__(KImpactFlash.Timer, KImpactFlash.TimeTotal))
        {
            KImpactFlash.Timer = -1;
            TickStyle = default.TickStyle;
            bNoNativeTick = default.bNoNativeTick;
        }
    }
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1277__(VoicePack, KImpactNoiseName);
    return;
}

defaultproperties
{
    KImpactFlash=(ActorColorId=None,TimeTotal=0,ColorStart=(R=0,G=0,B=0,A=0),ColorEnd=(R=0,G=0,B=0,A=0),bUseMid=false,TimeMid=0,ColorMid=(R=0,G=0,B=0,A=0),Timer=-1)
    PointsAwarded=1
    bIgnoresPhysicsDamage=true
    KImpactThreshold=0
    DamageScaler=0
    bCollisionAssumeValid=true
    bNoNativeTick=true
    bCollideActors=false
    bCollideWorld=false
    TickStyle=0
    VoicePack='SoundConfig.Interactive.VoicePack_Pinball'
}