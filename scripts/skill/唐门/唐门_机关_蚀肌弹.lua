---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/唐门_机关_蚀肌弹.lua
-- 更新时间:	2017/3/29 12:00:51
-- 更新用户:	chenchen6-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪
-- 创建时间	:  2011-8-16
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 20, nDamageRand = 5, nCostMana = 0}, --level 1
	{nDamageBase = 25, nDamageRand = 5, nCostMana = 0}, --level 2
	{nDamageBase = 30, nDamageRand = 5, nCostMana = 0}, --level 3
	{nDamageBase = 35, nDamageRand = 5, nCostMana = 0}, --level 4
	{nDamageBase = 40, nDamageRand = 5, nCostMana = 0}, --level 5
	{nDamageBase = 45, nDamageRand = 5, nCostMana = 0}, --level 6
	{nDamageBase = 50, nDamageRand = 5, nCostMana = 0}, --level 7
	{nDamageBase = 55, nDamageRand = 10, nCostMana = 0}, --level 8
	{nDamageBase = 60, nDamageRand = 10, nCostMana = 0}, --level 9
	{nDamageBase = 65, nDamageRand = 10, nCostMana = 0}, --level 10
	{nDamageBase = 70, nDamageRand = 10, nCostMana = 0}, --level 11
	{nDamageBase = 75, nDamageRand = 10, nCostMana = 0}, --level 12
	{nDamageBase = 80, nDamageRand = 10, nCostMana = 0}, --level 13
	{nDamageBase = 85, nDamageRand = 10, nCostMana = 0}, --level 14
	{nDamageBase = 90, nDamageRand = 15, nCostMana = 0}, --level 15
	{nDamageBase = 95, nDamageRand = 15, nCostMana = 0}, --level 16
	{nDamageBase = 100, nDamageRand = 15, nCostMana = 0}, --level 17
	{nDamageBase = 105, nDamageRand = 15, nCostMana = 0}, --level 18
	{nDamageBase = 110, nDamageRand = 15, nCostMana = 0}, --level 19
	{nDamageBase = 115, nDamageRand = 15, nCostMana = 0}, --level 20
	{nDamageBase = 120, nDamageRand = 20, nCostMana = 0}, --level 21
	{nDamageBase = 125, nDamageRand = 20, nCostMana = 0}, --level 22
	{nDamageBase = 130, nDamageRand = 20, nCostMana = 0}, --level 23
	{nDamageBase = 140, nDamageRand = 20, nCostMana = 0}, --level 24
	{nDamageBase = 150, nDamageRand = 20, nCostMana = 0}, --level 25
	{nDamageBase = 160, nDamageRand = 20, nCostMana = 0}, --level 26
	{nDamageBase = 180, nDamageRand = 20, nCostMana = 0}, --level 27
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
 - 1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/唐门/唐门_机关_蚀肌弹.lua",
		0
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 466);	--技能普通CD
	skill.SetCheckCoolDown(1, 444);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	skill.nCostEnergy = 25;							-- 技能消耗的能量
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 28;				-- 吟唱帧数

	if dwSkillLevel < 10 then
		skill.nChannelInterval = 16 * 1.2 * 1.1 * 1.05;
	elseif dwSkillLevel < 27 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 9) * 4) * 1.2 * 1.1 * 1.05
	else
		skill.nChannelInterval = 108 * 1.2 * 1.1 * 1.05;     -- 通道技间隔时间
	end
	--skill.nChannelInterval = 88; 				-- 通道技间隔时间
	skill.nMinPrepareFrames = 1;
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 120;				-- 子弹速度，单位 点/帧

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
	skill.nWeaponDamagePercent = 1024;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(2713)
	end
	-- if player.IsAchievementAcquired(2709) and player.IsAchievementAcquired(2710) and player.IsAchievementAcquired(2711) and player.IsAchievementAcquired(2712) and player.IsAchievementAcquired(2713) and player.IsAchievementAcquired(2714) then
	-- player.AcquireAchievement(2715)
	-- end
	--满级新手指引任务
	local nQuestIndex = player.GetQuestIndex(13256)
	local nQuestPhase = player.GetQuestPhase(13256)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--[[
	if player.GetBuff(8517, 1) then
		player.DelBuff(8517, 1)
	end
	--]]
	if player.GetBuff(11838, 1) then
		player.DelBuff(11838, 1)
	elseif
		player.GetBuff(3281, 1) then
		player.DelBuff(3281, 1)
	end

	if player.GetBuff(11766, 1) then
		local buff = player.GetBuff(11766, 1)
		local nCount = buff.nLeftActiveCount
		player.DelBuff(11766, 1)
		player.AddBuff(player.dwID, player.nLevel, 3281, 1, nCount)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com