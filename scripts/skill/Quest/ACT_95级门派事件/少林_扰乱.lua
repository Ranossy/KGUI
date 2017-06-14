---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/ACT_95级门派事件/少林_扰乱.lua
-- 更新时间:	2016/1/4 17:10:22
-- 更新用户:	kelin-PC
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/ACT_95级门派事件/少林/include/荡除心魔小剧场.lua")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/ACT_95级门派事件/少林_扰乱.lua",
		0
	);

	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- 属性作用模式
   		ATTRIBUTE_TYPE.nAttributeKey,								-- 魔法属性
   		nAttributeValue1,											-- 属性值1
   		nAttributeValue2											-- 属性值2
   		);
    --]]

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

	-----------------技能施放姿态需求(苍云)----------------------------------------
	--skill.nNeedPoseState = 1    --检查姿态，1为擎刀姿态，2为擎盾姿态

	----------------技能伤害给小队回血------------------------------------------

	--skill.nDamageToLifeForParty = 0	--技能伤害给小队成员百分比回血

	-----------------技能渐变相关-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --技能伤害渐变百分比，1024为100%，正数为增加，负数为减少。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --对第一个搜索到的目标施放子技能。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --对第二个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --对第三个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --对第四个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --对第五个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --对第六个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --对第七个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --对第八个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --对第九个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --对第十个搜索到的目标施放子技能。

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 1017);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能是否可在吟唱中施放 -------------------------------------------------
	--skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
	--skill.nCostManaBasePercent = 0;							-- 技能消耗的内力百分比
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 这里为true时,表示全部消耗豆点
	--skill.nNeedAccumulateCount = 0;				-- 技能需要气点的个数，当skill.bIsAccumulate	= true时生效
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius		= 5 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame	= -1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
	--skill.bInstantChannel = false;				-- 通道技能是否立刻造成一次伤害
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=

	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent = 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)

	local player = GetPlayer(dwSkillSrcID)
	
	tAction = {
		{ GetEditorString(9, 3029), "" .. player.szName .. GetEditorString(9, 3511), "" .. player.szName .. GetEditorString(9, 3512), 10154 },
		{ GetEditorString(9, 3032), "" .. player.szName .. GetEditorString(9, 3513), "" .. player.szName .. GetEditorString(9, 3514), 10151 },
		{ GetEditorString(9, 3035), "" .. player.szName .. GetEditorString(9, 3515), "" .. player.szName .. GetEditorString(9, 3516), 10150 },
		{ GetEditorString(9, 3038), "" .. player.szName .. GetEditorString(9, 3517), "" .. player.szName .. GetEditorString(9, 3518), 10150 },
		{ GetEditorString(2, 378), "" .. player.szName .. GetEditorString(9, 3519), "" .. player.szName .. GetEditorString(9, 3520), 10150 },
		{ GetEditorString(9, 3043), "" .. player.szName .. GetEditorString(9, 3521), "" .. player.szName .. GetEditorString(9, 3522), 10153 },
		{ GetEditorString(9, 3046), "" .. player.szName .. GetEditorString(9, 3523), "" .. player.szName .. GetEditorString(9, 3524), 10152 },
		{ GetEditorString(9, 3049), "" .. player.szName .. GetEditorString(9, 3525), "" .. player.szName .. GetEditorString(9, 3526), 10156 },
		{ GetEditorString(9, 3052), "" .. player.szName .. GetEditorString(9, 3527), "" .. player.szName .. GetEditorString(9, 3528), 10157 },
		{ GetEditorString(9, 3055), "" .. player.szName .. GetEditorString(9, 3529), "" .. player.szName .. GetEditorString(9, 3530), 10155 },
		{ GetEditorString(9, 3058), "" .. player.szName .. GetEditorString(9, 3531), "" .. player.szName .. GetEditorString(9, 3532), 40001 },
		{ GetEditorString(9, 3061), "" .. player.szName .. GetEditorString(9, 3533), "" .. player.szName .. GetEditorString(9, 3534), 10158 },
		{ GetEditorString(9, 3064), "" .. player.szName .. GetEditorString(9, 3535), "" .. player.szName .. GetEditorString(9, 3536), 10159 },
		{ GetEditorString(9, 3067), "" .. player.szName .. GetEditorString(9, 3537), "" .. player.szName .. GetEditorString(9, 3538), 10160 },
		{ GetEditorString(9, 3070), "" .. player.szName .. GetEditorString(9, 3539), "" .. player.szName .. GetEditorString(9, 3540), 10161 },
		{ GetEditorString(9, 3073), "" .. player.szName .. GetEditorString(9, 3541), "" .. player.szName .. GetEditorString(9, 3542), 20922 },
		{ GetEditorString(9, 3076), "" .. player.szName .. GetEditorString(9, 3543), "" .. player.szName .. GetEditorString(9, 3544), 10925 },
		{ GetEditorString(0, 7257), "" .. player.szName .. GetEditorString(9, 3545), "" .. player.szName .. GetEditorString(9, 3546), 10924 },
		{ GetEditorString(9, 3081), "" .. player.szName .. GetEditorString(9, 3547), "" .. player.szName .. GetEditorString(9, 3548), 10923 },
		{ GetEditorString(0, 5768), "" .. player.szName .. GetEditorString(9, 3549), "" .. player.szName .. GetEditorString(9, 3550), 40002 },
		{ GetEditorString(9, 3086), "" .. player.szName .. GetEditorString(9, 3551), "" .. player.szName .. GetEditorString(9, 3552), 10927 },
		{ GetEditorString(4, 2800), "" .. player.szName .. GetEditorString(9, 3553), "" .. player.szName .. GetEditorString(9, 3554), 10931 },
		{ GetEditorString(9, 3091), "" .. player.szName .. GetEditorString(9, 3555), "" .. player.szName .. GetEditorString(9, 3556), 10949 },
		{ GetEditorString(9, 3094), "" .. player.szName .. GetEditorString(9, 3557), "" .. player.szName .. GetEditorString(9, 3558), 40003 },
		{ GetEditorString(9, 3097), "" .. player.szName .. GetEditorString(9, 3559), "" .. player.szName .. GetEditorString(9, 3560), 10936 },
		{ GetEditorString(9, 3100), "" .. player.szName .. GetEditorString(9, 3561), "" .. player.szName .. GetEditorString(9, 3562), 10938 },
		{ GetEditorString(9, 3103), "" .. player.szName .. GetEditorString(9, 3563), "" .. player.szName .. GetEditorString(9, 3564), 10935 },
		{ GetEditorString(9, 3106), "" .. player.szName .. GetEditorString(9, 3565), "" .. player.szName .. GetEditorString(9, 3566), 10937 },
		{ GetEditorString(9, 3109), "" .. player.szName .. GetEditorString(9, 3567), "" .. player.szName .. GetEditorString(9, 3568), 10939 },
		{ GetEditorString(9, 3112), "" .. player.szName .. GetEditorString(9, 3569), "" .. player.szName .. GetEditorString(9, 3570), 10940 },
		{ GetEditorString(9, 3115), "" .. player.szName .. GetEditorString(9, 3571), "" .. player.szName .. GetEditorString(9, 3572), 10941 },
		{ GetEditorString(9, 3118), "" .. player.szName .. GetEditorString(9, 3573), "" .. player.szName .. GetEditorString(9, 3574), 10942 },
		{ GetEditorString(9, 3121), "" .. player.szName .. GetEditorString(9, 3575), "" .. player.szName .. GetEditorString(9, 3576), 10946 },
		{ GetEditorString(9, 3124), "" .. player.szName .. GetEditorString(9, 3577), "" .. player.szName .. GetEditorString(9, 3578), 10947 },
		{ GetEditorString(9, 3127), "" .. player.szName .. GetEditorString(9, 3579), "" .. player.szName .. GetEditorString(9, 3580), 10948 },
		{ GetEditorString(9, 3130), "" .. player.szName .. GetEditorString(9, 3581), "" .. player.szName .. GetEditorString(9, 3582), 10950 },
		{ GetEditorString(5, 964), "" .. player.szName .. GetEditorString(9, 3583), "" .. player.szName .. GetEditorString(9, 3584), 10951 },
		{ GetEditorString(9, 3135), "" .. player.szName .. GetEditorString(9, 3585), "" .. player.szName .. GetEditorString(9, 3586), 10954 },
		{ GetEditorString(9, 3138), "" .. player.szName .. GetEditorString(9, 3587), "" .. player.szName .. GetEditorString(9, 3588), 40008 },
		{GetEditorString(9, 3141), "" .. player.szName .. GetEditorString(9, 3589), "" .. player.szName .. GetEditorString(9, 3590), },
		{GetEditorString(9, 3144), "" .. player.szName .. GetEditorString(9, 3591), "" .. player.szName .. GetEditorString(9, 3592) .. player.szName .. GetEditorString(9, 3593), },
		{GetEditorString(9, 3147), "" .. player.szName .. GetEditorString(9, 3594), "" .. player.szName .. GetEditorString(9, 3595), },
		{GetEditorString(9, 3150), "" .. player.szName .. GetEditorString(9, 3596), "" .. player.szName .. GetEditorString(9, 3597), },
		{GetEditorString(9, 3153), "" .. player.szName .. GetEditorString(9, 3598), "" .. player.szName .. GetEditorString(9, 3599), },
		{GetEditorString(9, 3156), GetEditorString(9, 3600) .. player.szName .. GetEditorString(9, 3601), GetEditorString(9, 3602) .. player.szName .. GetEditorString(9, 3603), },
		{GetEditorString(9, 3159), "" .. player.szName .. GetEditorString(9, 3604), "" .. player.szName .. GetEditorString(9, 3605), },
		{GetEditorString(9, 3162), "" .. player.szName .. GetEditorString(9, 3606), "" .. player.szName .. GetEditorString(9, 3607), },
		{GetEditorString(9, 3165), "" .. player.szName .. GetEditorString(9, 3608), "" .. player.szName .. GetEditorString(9, 3609), },
		{GetEditorString(9, 3168), "" .. player.szName .. GetEditorString(9, 3610), "" .. player.szName .. GetEditorString(9, 3611), },
		{GetEditorString(0, 5768), "" .. player.szName .. GetEditorString(9, 3612), "" .. player.szName .. GetEditorString(9, 3613), },
		{GetEditorString(9, 3173), "" .. player.szName .. GetEditorString(9, 3614), "" .. player.szName .. GetEditorString(9, 3615), },
		{GetEditorString(9, 3176), "" .. player.szName .. GetEditorString(9, 3616), "" .. player.szName .. GetEditorString(9, 3617), },
		{GetEditorString(9, 3179), "" .. player.szName .. GetEditorString(9, 3618), "" .. player.szName .. GetEditorString(9, 3619), },
		{GetEditorString(1, 5430), "" .. player.szName .. GetEditorString(9, 3620), "" .. player.szName .. GetEditorString(9, 3621), },
		{GetEditorString(9, 3184), "" .. player.szName .. GetEditorString(9, 3622), "" .. player.szName .. GetEditorString(9, 3623), },
		{GetEditorString(9, 3187), "" .. player.szName .. GetEditorString(9, 3624), "" .. player.szName .. GetEditorString(9, 3625), },
		{GetEditorString(9, 3190), "" .. player.szName .. GetEditorString(9, 3626), "" .. player.szName .. GetEditorString(9, 3627), },
		{GetEditorString(9, 3193), "" .. player.szName .. GetEditorString(9, 3628), GetEditorString(9, 3629) .. player.szName .. GetEditorString(9, 3630), },
		{GetEditorString(9, 3196), "" .. player.szName .. GetEditorString(9, 3631), "" .. player.szName .. GetEditorString(9, 3632), },
		{GetEditorString(9, 3199), "" .. player.szName .. GetEditorString(9, 3633), "" .. player.szName .. GetEditorString(9, 3634), },
		{GetEditorString(9, 3202), "" .. player.szName .. GetEditorString(9, 3635), "" .. player.szName .. GetEditorString(9, 3636), },
		{GetEditorString(9, 3205), "" .. player.szName .. GetEditorString(9, 3637), "" .. player.szName .. GetEditorString(9, 3638), },
		{GetEditorString(9, 3208), "" .. player.szName .. GetEditorString(9, 3639), "" .. player.szName .. GetEditorString(9, 3640), },
		{GetEditorString(9, 3211), "" .. player.szName .. GetEditorString(9, 3641), "" .. player.szName .. GetEditorString(9, 3642), },
		{GetEditorString(9, 3214), "" .. player.szName .. GetEditorString(9, 3643), "" .. player.szName .. GetEditorString(9, 3644), },
		{GetEditorString(9, 3217), "" .. player.szName .. GetEditorString(9, 3645), "" .. player.szName .. GetEditorString(9, 3646), },
		{GetEditorString(9, 3220), "" .. player.szName .. GetEditorString(9, 3647), "" .. player.szName .. GetEditorString(9, 3648), },
		{GetEditorString(9, 3223), "" .. player.szName .. GetEditorString(9, 3649), "" .. player.szName .. GetEditorString(9, 3650), },
		{GetEditorString(9, 3226), "" .. player.szName .. GetEditorString(9, 3651), "" .. player.szName .. GetEditorString(9, 3652), },
		{GetEditorString(9, 3229), "" .. player.szName .. GetEditorString(9, 3653), "" .. player.szName .. GetEditorString(9, 3654), },
		{GetEditorString(9, 3232), "" .. player.szName .. GetEditorString(9, 3655), "" .. player.szName .. GetEditorString(9, 3656), },
		{GetEditorString(9, 3235), "" .. player.szName .. GetEditorString(9, 3657), "" .. player.szName .. GetEditorString(9, 3658), },
		{GetEditorString(2, 9807), "" .. player.szName .. GetEditorString(9, 3659), "" .. player.szName .. GetEditorString(9, 3660), },
		{GetEditorString(9, 3240), "" .. player.szName .. GetEditorString(9, 3661), "" .. player.szName .. GetEditorString(9, 3662), },
		{GetEditorString(9, 3243), "" .. player.szName .. GetEditorString(9, 3663), "" .. player.szName .. GetEditorString(9, 3664), },
		{GetEditorString(9, 3246), "" .. player.szName .. GetEditorString(9, 3665), "" .. player.szName .. GetEditorString(9, 3666), },
		{GetEditorString(9, 3249), "" .. player.szName .. GetEditorString(9, 3667), "" .. player.szName .. GetEditorString(9, 3668), },
		{GetEditorString(2, 379), "" .. player.szName .. GetEditorString(9, 3669), "" .. player.szName .. GetEditorString(9, 3670), },
		{GetEditorString(9, 3254), "" .. player.szName .. GetEditorString(9, 3671), "" .. player.szName .. GetEditorString(9, 3672), },
		{GetEditorString(9, 3257), "" .. player.szName .. GetEditorString(9, 3673), "" .. player.szName .. GetEditorString(9, 3674), },
		{GetEditorString(9, 3260), "" .. player.szName .. GetEditorString(9, 3675), "" .. player.szName .. GetEditorString(9, 3676), },
		{GetEditorString(9, 3263), "" .. player.szName .. GetEditorString(9, 3677), "" .. player.szName .. GetEditorString(9, 3678), },
		{GetEditorString(2, 375), "" .. player.szName .. GetEditorString(9, 3679), "" .. player.szName .. GetEditorString(9, 3680), },
		{GetEditorString(6, 1668), "" .. player.szName .. GetEditorString(9, 3681), "" .. player.szName .. GetEditorString(9, 3682), },
		{GetEditorString(4, 3385), "" .. player.szName .. GetEditorString(9, 3683), "" .. player.szName .. GetEditorString(9, 3684), },
		{GetEditorString(9, 3272), "" .. player.szName .. GetEditorString(9, 3685), "" .. player.szName .. GetEditorString(9, 3686) .. player.szName .. GetEditorString(9, 3687), },
		{GetEditorString(9, 3275), "" .. player.szName .. GetEditorString(9, 3688), "" .. player.szName .. GetEditorString(9, 3689), },
		{GetEditorString(9, 3061), "" .. player.szName .. GetEditorString(9, 3690), "" .. player.szName .. GetEditorString(9, 3691), },
		{GetEditorString(9, 3280), "" .. player.szName .. GetEditorString(9, 3692), "" .. player.szName .. GetEditorString(9, 3693), },
		{GetEditorString(9, 3283), "" .. player.szName .. GetEditorString(9, 3694), "" .. player.szName .. GetEditorString(9, 3695), },
		{GetEditorString(9, 3286), "" .. player.szName .. GetEditorString(9, 3696), "" .. player.szName .. GetEditorString(9, 3697), },
		{GetEditorString(9, 3289), "" .. player.szName .. GetEditorString(9, 3698), "" .. player.szName .. GetEditorString(9, 3699), },
		{GetEditorString(5, 8062), "" .. player.szName .. GetEditorString(9, 3700), "" .. player.szName .. GetEditorString(9, 3701), },
		{GetEditorString(9, 3294), "" .. player.szName .. GetEditorString(9, 3702), "" .. player.szName .. GetEditorString(9, 3703), },
		{GetEditorString(9, 3297), "" .. player.szName .. GetEditorString(9, 3704), "" .. player.szName .. GetEditorString(9, 3705), },
		{GetEditorString(9, 3300), "" .. player.szName .. GetEditorString(9, 3706), "" .. player.szName .. GetEditorString(9, 3707), },
		{GetEditorString(4, 7937), "" .. player.szName .. GetEditorString(9, 3708), "" .. player.szName .. GetEditorString(9, 3709), },
		{GetEditorString(9, 3305), "" .. player.szName .. GetEditorString(9, 3710), "" .. player.szName .. GetEditorString(9, 3711), },
		{GetEditorString(9, 3308), "" .. player.szName .. GetEditorString(9, 3712), "" .. player.szName .. GetEditorString(9, 3713), },
		{GetEditorString(9, 3311), "" .. player.szName .. GetEditorString(9, 3714), "" .. player.szName .. GetEditorString(9, 3715), },
		{GetEditorString(9, 3314), "" .. player.szName .. GetEditorString(9, 3716), "" .. player.szName .. GetEditorString(9, 3717), },
		{GetEditorString(9, 3109), "" .. player.szName .. GetEditorString(9, 3718), "" .. player.szName .. GetEditorString(9, 3719), },
		{GetEditorString(2, 3254), "" .. player.szName .. GetEditorString(9, 3720), "" .. player.szName .. GetEditorString(9, 3721), },
		{GetEditorString(9, 3321), "" .. player.szName .. GetEditorString(9, 3722), "" .. player.szName .. GetEditorString(9, 3723), },
		{GetEditorString(9, 3324), "" .. player.szName .. GetEditorString(9, 3724), "" .. player.szName .. GetEditorString(9, 3725), },
		{GetEditorString(9, 3327), "" .. player.szName .. GetEditorString(9, 3726), "" .. player.szName .. GetEditorString(9, 3727), },
		{GetEditorString(9, 3330), "" .. player.szName .. GetEditorString(9, 3728), "" .. player.szName .. GetEditorString(9, 3729), },
		{GetEditorString(9, 3333), "" .. player.szName .. GetEditorString(9, 3730), "" .. player.szName .. GetEditorString(9, 3731), },
		{GetEditorString(9, 3336), "" .. player.szName .. GetEditorString(9, 3732), "" .. player.szName .. GetEditorString(9, 3733), },
		{GetEditorString(9, 3339), "" .. player.szName .. GetEditorString(9, 3734), "" .. player.szName .. GetEditorString(9, 3735), },
		{GetEditorString(1, 3894), "" .. player.szName .. GetEditorString(9, 3736), "" .. player.szName .. GetEditorString(9, 3737), },
		{GetEditorString(9, 3344), "" .. player.szName .. GetEditorString(9, 3738), "" .. player.szName .. GetEditorString(9, 3739), },
		{GetEditorString(9, 3347), "" .. player.szName .. GetEditorString(9, 3740), "" .. player.szName .. GetEditorString(9, 3741), },
		{GetEditorString(9, 3350), "" .. player.szName .. GetEditorString(9, 3742), "" .. player.szName .. GetEditorString(9, 3743), },
		{GetEditorString(9, 3353), "" .. player.szName .. GetEditorString(9, 3744), "" .. player.szName .. GetEditorString(9, 3745), },
		{GetEditorString(9, 3356), "" .. player.szName .. GetEditorString(9, 3746), "" .. player.szName .. GetEditorString(9, 3747), },
		{GetEditorString(5, 5155), "" .. player.szName .. GetEditorString(9, 3527), "" .. player.szName .. GetEditorString(9, 3748), },
		{GetEditorString(9, 3360), "" .. player.szName .. GetEditorString(9, 3749) .. player.szName .. GetEditorString(9, 3750), "" .. player.szName .. GetEditorString(9, 3751), },
		{GetEditorString(4, 3404), "" .. player.szName .. GetEditorString(9, 3752), "" .. player.szName .. GetEditorString(9, 3753), },
		{GetEditorString(0, 773), "" .. player.szName .. GetEditorString(9, 3754) .. player.szName .. GetEditorString(9, 3755), "" .. player.szName .. GetEditorString(9, 3756), },
		{GetEditorString(9, 3367), "" .. player.szName .. GetEditorString(9, 3757), "" .. player.szName .. GetEditorString(9, 3758), },
		{GetEditorString(9, 3370), "" .. player.szName .. GetEditorString(9, 3759), "" .. player.szName .. GetEditorString(9, 3760), },
		{GetEditorString(9, 3373), "" .. player.szName .. GetEditorString(9, 3761), "" .. player.szName .. GetEditorString(9, 3762), },
		{GetEditorString(0, 7904), "" .. player.szName .. GetEditorString(9, 3763), "" .. player.szName .. GetEditorString(9, 3764) .. player.szName .. GetEditorString(9, 3765), },
		{GetEditorString(9, 3378), "" .. player.szName .. GetEditorString(9, 3766), "" .. player.szName .. GetEditorString(9, 3767), },
		{GetEditorString(0, 1149), "" .. player.szName .. GetEditorString(9, 3768), "" .. player.szName .. GetEditorString(9, 3534), },
		{GetEditorString(9, 3382), "" .. player.szName .. GetEditorString(9, 3769), "" .. player.szName .. GetEditorString(9, 3770), },
		{GetEditorString(9, 3385), "" .. player.szName .. GetEditorString(9, 3771), "" .. player.szName .. GetEditorString(9, 3772), },
		{GetEditorString(9, 3388), "" .. player.szName .. GetEditorString(9, 3773), "" .. player.szName .. GetEditorString(9, 3774), },
		{GetEditorString(0, 9334), "" .. player.szName .. GetEditorString(9, 3775), "" .. player.szName .. GetEditorString(9, 3776), },
		{GetEditorString(9, 3393), "" .. player.szName .. GetEditorString(9, 3777), "" .. player.szName .. GetEditorString(9, 3778), },
		{GetEditorString(0, 8653), "" .. player.szName .. GetEditorString(9, 3779), "" .. player.szName .. GetEditorString(9, 3780), },
		{GetEditorString(9, 3398), "" .. player.szName .. GetEditorString(9, 3781), "" .. player.szName .. GetEditorString(9, 3782), },
		{GetEditorString(9, 3401), "" .. player.szName .. GetEditorString(9, 3783), "" .. player.szName .. GetEditorString(9, 3784), },
		{GetEditorString(7, 4962), "" .. player.szName .. GetEditorString(9, 3785), "" .. player.szName .. GetEditorString(9, 3786), },
		{GetEditorString(9, 3406), "" .. player.szName .. GetEditorString(9, 3787), "" .. player.szName .. GetEditorString(9, 3788), },
		{GetEditorString(2, 9715), "" .. player.szName .. GetEditorString(9, 3789), "" .. player.szName .. GetEditorString(9, 3790), },
		{GetEditorString(9, 3411), "" .. player.szName .. GetEditorString(9, 3791), "" .. player.szName .. GetEditorString(9, 3792), },
		{GetEditorString(2, 9697), "" .. player.szName .. GetEditorString(9, 3793), "" .. player.szName .. GetEditorString(9, 3794), },
		{GetEditorString(9, 3416), "" .. player.szName .. GetEditorString(9, 3795), "" .. player.szName .. GetEditorString(9, 3796), },
		{GetEditorString(9, 3419), "" .. player.szName .. GetEditorString(9, 3797), "" .. player.szName .. GetEditorString(9, 3798), },
		{GetEditorString(9, 3422), "" .. player.szName .. GetEditorString(9, 3799), "" .. player.szName .. GetEditorString(9, 3800), },
		{GetEditorString(9, 3425), "" .. player.szName .. GetEditorString(9, 3801), "" .. player.szName .. GetEditorString(9, 3802), },
		{GetEditorString(9, 3428), "" .. player.szName .. GetEditorString(9, 3803), "" .. player.szName .. GetEditorString(9, 3804), },
		{GetEditorString(9, 3431), "" .. player.szName .. GetEditorString(9, 3805), "" .. player.szName .. GetEditorString(9, 3806), },
		{GetEditorString(9, 3434), "" .. player.szName .. GetEditorString(9, 3807), "" .. player.szName .. GetEditorString(9, 3808), },
		{GetEditorString(9, 3437), "" .. player.szName .. GetEditorString(9, 3809), "" .. player.szName .. GetEditorString(9, 3810), },
		{GetEditorString(9, 3440), "" .. player.szName .. GetEditorString(9, 3811), "" .. player.szName .. GetEditorString(9, 3812), },
		{GetEditorString(9, 3443), "" .. player.szName .. GetEditorString(9, 3813), "" .. player.szName .. GetEditorString(9, 3814), },
		{GetEditorString(9, 3446), GetEditorString(9, 3815) .. player.szName .. GetEditorString(9, 3816), "" .. player.szName .. GetEditorString(9, 3817), },
		{GetEditorString(9, 3449), "" .. player.szName .. GetEditorString(9, 3818), GetEditorString(9, 3819) .. player.szName .. GetEditorString(9, 3820), },
		{GetEditorString(1, 7235), "" .. player.szName .. GetEditorString(9, 3821), "" .. player.szName .. GetEditorString(9, 3822), },
		{GetEditorString(9, 3454), "" .. player.szName .. GetEditorString(9, 3823), "" .. player.szName .. GetEditorString(9, 3824), },
		{GetEditorString(9, 3457), "" .. player.szName .. GetEditorString(9, 3825), "" .. player.szName .. GetEditorString(9, 3826), },
		{GetEditorString(9, 3460), GetEditorString(9, 3461), "" .. player.szName .. GetEditorString(9, 3827), },
		{GetEditorString(6, 2052), "" .. player.szName .. GetEditorString(9, 3828), "" .. player.szName .. GetEditorString(9, 3829), },
		{GetEditorString(9, 3465), "" .. player.szName .. GetEditorString(9, 3830), "" .. player.szName .. GetEditorString(9, 3831), },
		{GetEditorString(0, 4229), "" .. player.szName .. GetEditorString(9, 3832), "" .. player.szName .. GetEditorString(9, 3833), },
		{GetEditorString(9, 3470), "" .. player.szName .. GetEditorString(9, 3834), "" .. player.szName .. GetEditorString(9, 3835), },
		{GetEditorString(9, 3473), "" .. player.szName .. GetEditorString(9, 3836), "" .. player.szName .. GetEditorString(9, 3837), },
		{GetEditorString(8, 4452), "" .. player.szName .. GetEditorString(9, 3838), "" .. player.szName .. GetEditorString(9, 3839), },
		{GetEditorString(9, 3478), "" .. player.szName .. GetEditorString(9, 3840), "" .. player.szName .. GetEditorString(9, 3841), },
		{GetEditorString(9, 3481), "" .. player.szName .. GetEditorString(9, 3842), "" .. player.szName .. GetEditorString(9, 3843), },
		{GetEditorString(9, 3484), "" .. player.szName .. GetEditorString(9, 3844), "" .. player.szName .. GetEditorString(9, 3845), },
		{GetEditorString(9, 3487), "" .. player.szName .. GetEditorString(9, 3846), "" .. player.szName .. GetEditorString(9, 3847), },
		{GetEditorString(9, 3490), "" .. player.szName .. GetEditorString(9, 3848), "" .. player.szName .. GetEditorString(9, 3849), },
		{GetEditorString(9, 3493), "" .. player.szName .. GetEditorString(9, 3850), "" .. player.szName .. GetEditorString(9, 3851), },
		{GetEditorString(9, 3496), "" .. player.szName .. GetEditorString(9, 3852), "" .. player.szName .. GetEditorString(9, 3853), },
		{GetEditorString(9, 3499), "" .. player.szName .. GetEditorString(9, 3854), "" .. player.szName .. GetEditorString(9, 3855), },
		{GetEditorString(9, 3502), "" .. player.szName .. GetEditorString(9, 3856), "" .. player.szName .. GetEditorString(9, 3857), },
		{GetEditorString(9, 3505), "" .. player.szName .. GetEditorString(9, 3858), "" .. player.szName .. GetEditorString(9, 3859), },
	}

	local npc = GetNpc(dwCharacterID) --目标仲虚念
	if not npc then
		return
	end
	local scene = npc.GetScene()
	local ChanJing = scene.GetNpcByNickName("PQ_SL_CWJL_CJ")--判断禅斗NPC在不在
	if not ChanJing then
		player.SendSystemMessage(GetEditorString(9, 3508))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(9, 3508), 4)
		return
	end
	if npc.dwTemplateID ~= 50447 then
		player.SendSystemMessage(GetEditorString(9, 3509))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(9, 3509), 4)
		return
	end
	
	--玩家说话和做动作
	local nAction_Random = Random(1, #tAction)
	local nDialogue_Random = Random(2, 3)
	if tAction[nAction_Random][nDialogue_Random] then
		player.Talk(tAction[nAction_Random][nDialogue_Random])
	end
	if tAction[nAction_Random][4] then
		player.DoAction(0, tAction[nAction_Random][4])
	end
	if tAction[nAction_Random][1] then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(9, 3510) .. tAction[nAction_Random][1] .. GetEditorString(0, 1767), 4)
	end

--仲虚念当前血量大于80%,则扣血
	if npc.nCurrentLife > npc.nMaxLife * 0.8 then		
		npc.nCurrentLife = npc.nCurrentLife - 768000
	end
	CommonPQ_AddPlayerPQValueTips(player, 88, 20)
--如果没完成成就,则添加成就
	if not player.IsAchievementAcquired(5251) then
		player.AcquireAchievement(5251)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end



 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com