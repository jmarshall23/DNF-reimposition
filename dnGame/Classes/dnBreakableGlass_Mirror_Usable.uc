/*******************************************************************************
 * dnBreakableGlass_Mirror_Usable generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnBreakableGlass_Mirror_Usable extends dnBreakableGlass
    collapsecategories;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x17
    if(IsMP())
    {
        bUsable = false;
    }
    return;
}

event Used(Actor Other, Pawn EventInstigator)
{
    super.Used(Other, EventInstigator);
    EventInstigator.FindSoundAndSpeak('MirrorUsed');
    // End:0x4D
    if(__NFUN_340__(DukePlayer(EventInstigator), none))
    {
        DukePlayer(EventInstigator).GivePermanentEgoCapAward(21);
    }
    __NFUN_607__(2, false, 'Reenable');
    bUsable = false;
    return;
}

function Reenable()
{
    bUsable = true;
    return;
}

simulated function GlassCracked()
{
    bUsable = false;
    __NFUN_608__('Reenable');
    super.GlassCracked();
    return;
}

simulated function GlassShattered()
{
    bUsable = false;
    __NFUN_608__('Reenable');
    super.GlassShattered();
    return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
    super.RegisterPrecacheComponents(PrecacheIndex);
    PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'MirrorUsed');
    return;
}

defaultproperties
{
    FallPerSecond1=-50
    ParticleLife=4
    ParticlesToStayPercent=0
    GlassAmbientColor=(R=163,G=167,B=169,A=0)
    GlassAmbientCrackedColor=(R=163,G=167,B=169,A=0)
    GlassAmbientShatteredColor=(R=44,G=44,B=44,A=0)
    BulgeOnBreakAmount=0
    bUsable=true
    ShrunkUseStyle=1
    UsePhrase="<?int?dnGame.dnBreakableGlass_Mirror_Usable.UsePhrase?>"
    bDontReflect=true
    bOneSidedMirror=true
    Skins(0)='dt_masking.GlassMirror_Materials.GlassMirrorDirty1024_FinalBlend'
    Skins(1)='dt_masking.GlassMirror_Materials.BrokenGlassMirror_1024_FinalBlend'
    Skins(2)='dt_masking.GlassMirror_Materials.BrokenGlassMirror_1024_FinalBlend'
    Skins(3)='dt_masking.Glass_Materials.glassdirty1bc_finalblend'
    MirrorRenderTarget='dt_masking.GlassMirror_Materials.glassmirror_rendertarget1024'
}