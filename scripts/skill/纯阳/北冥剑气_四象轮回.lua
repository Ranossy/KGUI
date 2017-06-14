---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/北冥剑气_四象轮回.lua
-- 更新时间:	2017/3/7 17:59:11
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  北冥剑气_四象轮回.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  北冥剑气
-- 技能名称  :  四象轮回
-- 技能效果  :  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 31, nDamageRand = 3}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 70, nDamageRand = 7}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 11}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 150, nDamageRand = 15}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 189, nDamageRand = 19}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 229, nDamageRand = 23}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 268, nDamageRand = 27}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 308, nDamageRand = 31}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 348, nDamageRand = 35}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 387, nDamageRand = 39}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 427, nDamageRand = 43}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 466, nDamageRand = 47}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 506, nDamageRand = 51}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 546, nDamageRand = 55}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 585, nDamageRand = 59}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 625, nDamageRand = 63}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 664, nDamageRand = 67}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 704, nDamageRand = 71}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 744, nDamageRand = 75}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 783, nDamageRand = 79}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 823, nDamageRand = 82}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 862, nDamageRand = 86}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 902, nDamageRand = 90}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 942, nDamageRand = 94}, -- Level 24
	{nAddRage = 0, nCostRage = 0, nDamageBase = 981, nDamageRand = 98}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1021, nDamageRand = 102}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1060, nDamageRand = 106}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1100, nDamageRand = 110}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1140, nDamageRand = 114}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1179, nDamageRand = 118}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1219, nDamageRand = 122}, -- Level 31
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1258, nDamageRand = 126}, -- Level 32
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1298, nDamageRand = 130}, -- Level 33
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 驱散掉瞬发buff
		999,
		1
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 驱散掉瞬发buff
		"skill/纯阳/北冥剑气_四象轮回.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		896,
		dwSkillLevel
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(6444, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestOwnBuff(6311, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 850, 1);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);
	--skill.SetCheckCoolDown(2, 625);
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 163 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 163 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 163 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 163 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 163;	-- 技能消耗的内力
	end
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0;					-- 技能施放的最小距离
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 2 * GAME_FPS;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 打断相关 -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;		-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
--[[
	if player.GetBuff(8620, 1) then
		player.DelBuff(8620, 1)
	end
--]]
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(66)
	end
	--满级新手指引任务
	local nQuestIndex = player.GetQuestIndex(13252)
	local nQuestPhase = player.GetQuestPhase(13252)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
	-- if player.IsAchievementAcquired(61) and player.IsAchievementAcquired(62) and player.IsAchievementAcquired(63) and player.IsAchievementAcquired(64) and player.IsAchievementAcquired(65) and player.IsAchievementAcquired(66) and player.IsAchievementAcquired(67) then
	-- player.AcquireAchievement(72)
	-- end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	--[[
	if player.GetBuff(9962, 1) then							--伤害提高50%且瞬发（平笃奇穴）
		player.DelBuff(9962, 1)
	--]]
	if player.GetBuff(10078, 1) then							--删除雨集
		--player.DelBuff(10078, 1)
		--print(11111)
	elseif player.GetBuff(999, 1) then						    --删除归元
		player.DelBuff(999, 1)
	elseif player.GetBuff(11261, 1) then						   
		player.DelBuff(11261, 1)
		--print(22222)
	elseif player.GetBuff(8620, 1) then
		local buff = player.GetBuff(8620, 1)
		if buff.nCustomValue == 0 then
			--print(22222)
			player.AddBuff(player.dwID, player.nLevel, 9962, 1)
			buff.nCustomValue = 1
		else
			local nCount = buff.nLeftActiveCount
			player.DelBuff(8620, 1)
			--print(2222222)
			player.AddBuff(player.dwID, player.nLevel, 10078, 1, nCount)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com