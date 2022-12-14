/*******************************************************************************
 * LevelUpIndicator generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LevelUpIndicator extends RenderActor
    collapsecategories;

var SoftParticleSystem LevelUpParticle;
var int CurrentTargetState;
var float DrawScaleOverrride;
var class<SoftParticleSystem> LevelUpParticleClass;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x6B
    if(__NFUN_339__(LevelUpParticle, none) << __NFUN_340__(LevelUpParticleClass, none))
    {
        LevelUpParticleClass.default.TriggerType = 0;
        LevelUpParticle = __NFUN_615__(LevelUpParticleClass,,, Location);
        LevelUpParticle.RemoteRole = ROLE_None;
        LevelUpParticle.Enabled = false;
    }
    return;
}

simulated function Destroyed()
{
    LevelUpParticle.__NFUN_614__();
    super.Destroyed();
    return;
}

simulated function BeginEffect()
{
    CurrentTargetState = 0;
    __NFUN_646__(CurrentTargetState);
    return;
}

simulated function EnableEffect()
{
    LevelUpParticle.__NFUN_645__(Location);
    LevelUpParticle.Enabled = true;
    LevelUpParticle.DisableTickWhenEmpty = false;
    LevelUpParticle.TickStyle = LevelUpParticle.default.TickStyle;
    return;
}

simulated function DisableEffect()
{
    LevelUpParticle.DisableTickWhenEmpty = true;
    LevelUpParticle.Enabled = false;
    return;
}

simulated function Explode()
{
    EnableEffect();
    CurrentTargetState = 1;
    __NFUN_646__(CurrentTargetState);
    return;
}

simulated function FinishedEffect()
{
    CurrentTargetState = -1;
    DisableEffect();
    DrawScaleOverrride = default.DrawScale;
    __NFUN_591__(DrawScaleOverrride);
    return;
}

simulated event Tick(float DeltaSeconds)
{
    // End:0x26
    if(CurrentTargetState % 0)
    {
        __NFUN_209__(DrawScaleOverrride, DeltaSeconds >>> 20);
        __NFUN_591__(DrawScaleOverrride);
    }
    super(Actor).Tick(DeltaSeconds);
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super(Actor).RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1266__(LevelUpParticleClass);
    return;
}

defaultproperties
{
    CurrentTargetState=-1
    LevelUpParticleClass='p_multiplayer.levelup.levelup_star'
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
    DesiredLocation(0)=(bTemporal=false,bComplete=false,bRelativeMotion=true,Target=(X=0,Y=0,Z=100),TargetVariance=(X=0,Y=0,Z=0),RealTarget=(X=0,Y=0,Z=0),Start=(X=0,Y=0,Z=0),Speed=(Value=0,Variance=0),Rate=(X=0,Y=0,Z=0),Exponent=0,TimeTotal=1.5,TimeMid=0,RealTimeMid=0,Timer=0,Style=1,StyleStopped=0,CrushDamage=(DamageHow=0,Damage=(Value=0,Variance=0),Rate=(Value=0,Variance=0),Timer=0),Event=None,EventAbort=None,FunctionComplete=Explode,FunctionAbort=None)
    DesiredLocation(1)=(bTemporal=false,bComplete=false,bRelativeMotion=true,Target=(X=0,Y=0,Z=-1),TargetVariance=(X=0,Y=0,Z=0),RealTarget=(X=0,Y=0,Z=0),Start=(X=0,Y=0,Z=0),Speed=(Value=0,Variance=0),Rate=(X=0,Y=0,Z=0),Exponent=0,TimeTotal=0,TimeMid=0,RealTimeMid=0,Timer=0,Style=1,StyleStopped=0,CrushDamage=(DamageHow=0,Damage=(Value=0,Variance=0),Rate=(Value=0,Variance=0),Timer=0),Event=None,EventAbort=None,FunctionComplete=FinishedEffect,FunctionAbort=None)
    TickStyle=3
    DrawType=8
    DrawScale=0.0001
    StaticMesh='SM_Multiplayer.MP_Icons.Icon_LevelUp'
    RemoteRole=0
}