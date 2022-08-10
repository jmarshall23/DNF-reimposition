/*******************************************************************************
 * acAssaultTrooper_JetPack generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class acAssaultTrooper_JetPack extends AIAnimationControllerEx;

defaultproperties
{
	bUseSimplePain=true
	PainAnims[0]=(Front=Anim_PainFront,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[1]=(Front=Anim_PainFrontHead,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontHeadBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[2]=(Front=Anim_PainFrontHead,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontHeadBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[3]=(Front=Anim_PainFront,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[4]=(Front=Anim_PainFront,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[5]=(Front=Anim_PainFront,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[6]=(Front=Anim_PainFrontLeft,Back=Anim_PainBackLeft,Left=None,Right=None,FrontBig=Anim_PainFrontLeftBig,BackBig=Anim_PainBackLeftBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[7]=(Front=Anim_PainFrontRight,Back=Anim_PainBackRight,Left=None,Right=None,FrontBig=Anim_PainFrontRightBig,BackBig=Anim_PainBackRightBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[8]=(Front=Anim_PainFrontLeft,Back=Anim_PainBackLeft,Left=None,Right=None,FrontBig=Anim_PainFrontLeftBig,BackBig=Anim_PainBackLeftBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[9]=(Front=Anim_PainFrontRight,Back=Anim_PainBackRight,Left=None,Right=None,FrontBig=Anim_PainFrontRightBig,BackBig=Anim_PainBackRightBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[10]=(Front=Anim_PainFrontLeft,Back=Anim_PainBackLeft,Left=None,Right=None,FrontBig=Anim_PainFrontLeftBig,BackBig=Anim_PainBackLeftBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[11]=(Front=Anim_PainFrontRight,Back=Anim_PainBackRight,Left=None,Right=None,FrontBig=Anim_PainFrontRightBig,BackBig=Anim_PainBackRightBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[12]=(Front=Anim_PainFrontLeftLeg,Back=Anim_PainBackLeft,Left=None,Right=None,FrontBig=Anim_PainFrontLeftLegBig,BackBig=Anim_PainBackLeftBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[13]=(Front=Anim_PainFrontRightLeg,Back=Anim_PainBackRight,Left=None,Right=None,FrontBig=Anim_PainFrontRightLegBig,BackBig=Anim_PainBackRightBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[14]=(Front=Anim_PainFrontLeftLeg,Back=Anim_PainBackLeft,Left=None,Right=None,FrontBig=Anim_PainFrontLeftLegBig,BackBig=Anim_PainBackLeftBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[15]=(Front=Anim_PainFrontRightLeg,Back=Anim_PainBackRight,Left=None,Right=None,FrontBig=Anim_PainFrontRightLegBig,BackBig=Anim_PainBackRightBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[16]=(Front=Anim_PainFrontLeftLeg,Back=Anim_PainBackLeft,Left=None,Right=None,FrontBig=Anim_PainFrontLeftLegBig,BackBig=Anim_PainBackLeftBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[17]=(Front=Anim_PainFrontRightLeg,Back=Anim_PainBackRight,Left=None,Right=None,FrontBig=Anim_PainFrontRightLegBig,BackBig=Anim_PainBackRightBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[18]=(Front=Anim_PainFront,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
	PainAnims[19]=(Front=Anim_PainFrontHead,Back=Anim_PainBack,Left=None,Right=None,FrontBig=Anim_PainFrontHeadBig,BackBig=Anim_PainBackBig,LeftBig=None,RightBig=None,NewAnimCont=0,WoundedPart=0)
}