---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/五毒_五仙图录_蝎心.lua
-- 更新时间:	2014/6/30 21:23:16
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  CBG
-- 创建时间	:  2010-11-19
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51 / 3 * 0.95, nDamageRand = 51 / 3 * 0.1, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 66 / 3 * 0.95, nDamageRand = 66 / 3 * 0.1, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80 / 3 * 0.95, nDamageRand = 80 / 3 * 0.1, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 95 / 3 * 0.95, nDamageRand = 95 / 3 * 0.1, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 109 / 3 * 0.95, nDamageRand = 109 / 3 * 0.1, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 124 / 3 * 0.95, nDamageRand = 124 / 3 * 0.1, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139 / 3 * 0.95, nDamageRand = 139 / 3 * 0.1, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153 / 3 * 0.95, nDamageRand = 153 / 3 * 0.1, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 168 / 3 * 0.95, nDamageRand = 168 / 3 * 0.1, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 182 / 3 * 0.95, nDamageRand = 182 / 3 * 0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 197 / 3 * 0.95, nDamageRand = 197 / 3 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 212 / 3 * 0.95, nDamageRand = 212 / 3 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 226 / 3 * 0.95, nDamageRand = 226 / 3 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 241 / 3 * 0.95, nDamageRand = 241 / 3 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255 / 3 * 0.95, nDamageRand = 255 / 3 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 270 / 3 * 0.95, nDamageRand = 270 / 3 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 285 / 3 * 0.95, nDamageRand = 285 / 3 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 299 / 3 * 0.95, nDamageRand = 299 / 3 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 314 / 3 * 0.95, nDamageRand = 314 / 3 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 328 / 3 * 0.95, nDamageRand = 328 / 3 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 343 / 3 * 0.95, nDamageRand = 343 / 3 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 358 / 3 * 0.95, nDamageRand = 358 / 3 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 372 / 3 * 0.95, nDamageRand = 372 / 3 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 387 / 3 * 0.95, nDamageRand = 387 / 3 * 0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 401 / 3 * 0.95, nDamageRand = 401 / 3 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 416 / 3 * 0.95, nDamageRand = 416 / 3 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 431 / 3 * 0.95, nDamageRand = 431 / 3 * 0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 445 / 3 * 0.95, nDamageRand = 445 / 3 * 0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 460 / 3 * 0.95, nDamageRand = 460 / 3 * 0.1, }, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 474 / 3 * 0.95, nDamageRand = 474 / 3 * 0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 489 / 3 * 0.95, nDamageRand = 489 / 3 * 0.1, }, -- Level 31
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	--[[
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
	--]]
	skill.AddAttribute(													-- 毒经蝎心伤害
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		9331, --属性值1
		dwSkillLevel										--属性值2
	);

	skill.AddAttribute(													-- 毒经蝎心伤害带回血
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		9332, --属性值1
		dwSkillLevel										--属性值2
		);
	skill.AddAttribute(													-- 补天蝎心伤害
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		9405, --属性值1
		dwSkillLevel										--属性值2
		);
	--[[
	skill.AddAttribute(													-- 夺命蛊触发
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		2455, --属性值1
		dwSkillLevel										--属性值2
	);

	skill.AddAttribute(													-- 迷心蛊触发
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		2460, --属性值1
		dwSkillLevel										--属性值2
	);

	skill.AddAttribute(													-- 枯残蛊触发
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		2465, --属性值1
		dwSkillLevel										--属性值2
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/五毒/五毒_蝎心触发3蛊效果.lua",
		0
		);
	skill.AddAttribute(													-- 五毒攻击阵法第五重效果
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CAST_SKILL, -- 魔法属性
		2490, --属性值1
		1										--属性值2
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_GROUP_BUFF_BY_ID_AND_LEVEL,
		6226,
		1
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/五毒/五毒_五仙图录_蝎心.lua",
		0
		);	
	--]]
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 女娲补天不能用
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);						-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 215*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 215 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 215 * 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 215 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 215;	-- 技能消耗的内力
	end
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
	skill.nMinPrepareFrames = 1;
	skill.nChannelInterval = 104; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

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
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
		player.AcquireAchievement(1743)
	end
	--满级新手指引任务
	local nQuestIndex = player.GetQuestIndex(13255)
	local nQuestPhase = player.GetQuestPhase(13255)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	--附魔蝎心额外伤害
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(9304) == 1 then
		player.CastSkill(9305, 1)	--判定蛇影B_2296
		player.CastSkill(9305, 2)	--判定百足B_2509
		player.CastSkill(9305, 3)	--判定蟾笑B_2295
		
		if player.GetBuff(7982, 1) then
			local nCount = player.GetBuff(7982, 1).nStackNum
			player.CastSkill(9306, nCount)
			player.DelGroupBuff(7982,1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com