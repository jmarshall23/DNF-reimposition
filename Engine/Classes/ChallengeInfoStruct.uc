struct ChallengeInfoStruct
{
	var int ChallengeID;
	var string ChallObjClass;
	var transient ChallengeObject ChallObj;
	var array<int> ChallDependencies;
	var Object.EMPStatistics StatDependency;
	var string ExtraOptions;
	var string Name;
	var string Description;
	var string HelpText;
	var int EXPBonus;
	var name SearchTag;
	var string AttachMesh;
	var name AttachBone;
	var string image;
	var int LockedImageIdx;
	var Object.EChallengeCustomizeCategory Category;
	var int ShirtColorIdx;
	var int TitleIdx;
	var string AMName;
	var bool IsPurchased;
};