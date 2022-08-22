/*******************************************************************************
 * SmackerTextureInstance generated by Eliot.UELib using UE Explorer.exe.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class SmackerTextureInstance extends MaterialExInstance
    native;

cpptext
{
// Stripped
}

var() SSmackerState State;
var private const bool bDefaultInstance;
var private const transient bool bFilenameDirty;
var private const transient bool bAudioDirty;
var private const int SavedNewFrame;

// Export USmackerTextureInstance::execSetFilename(FFrame&, void* const)
native(1261) final function SetFilename(string NewFilename);

// Export USmackerTextureInstance::execSetFrame(FFrame&, void* const)
native(1262) final function SetFrame(int NewCurrentFrame);

// Export USmackerTextureInstance::execSetVolume(FFrame&, void* const)
native(1263) final function SetVolume(float NewVolume);

// Export USmackerTextureInstance::execSetPause(FFrame&, void* const)
native(1264) final function SetPause(bool bNewPause);

// Export USmackerTextureInstance::execGetFrameCount(FFrame&, void* const)
native(1265) final function int GetFrameCount();
