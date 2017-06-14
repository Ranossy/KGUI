---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/镇派/战八方蓝耗降低50%.lua
-- 更新时间:	2013/9/25 10:19:19
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  攻击_惊神.lua
-- 创建人    :  CBG
-- 创建时间  :  2011-04-03
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/include/skillcheck.lh")
tSkillData = 
{
	{nValue1 = -51, nValue2 = 1537}, --level 1
	{nValue1 = -102, nValue2 = 3072}, --level 2
	{nValue1 = -102, nValue2 = 3072}, --level 2
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = 3;
    	
	----------------- 魔法属性 -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1227,
		1
	);	
	--]]
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.CHANGE_SKILL_ICON,
	--427,
	--6520
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 为了调下面的apply，而再把这个脚本运行一遍。
		"skill/天策/镇派/战八方蓝耗降低50%.lua",
		0
		);
	--战八方伤害提高10%
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		2364,
		1
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff

	--skill.BindBuff(1, 1715, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
    
	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius = 50 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 30;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
	
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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	local lv = player.GetSkillLevel(427)
	player.ForgetSkill(427)
	--player.LearnSkill(6520)
	player.LearnSkillLevel(6520, lv, dwCharacterID)
	RecipeCopy(427, lv, player, 6520)
	RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 427, 6520, lv)
	--]]

	if player.GetSkillLevel(427) ~= 0 then
		local lv = player.GetSkillLevel(427)
		local nSkill = player.GetKungfuMount()
		if player.GetSkillLevel(9437) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10026 then
			--傲雪下有附魔效果
			player.ForgetSkill(427)
			player.LearnSkillLevel(9441, lv, player.dwID)
			RecipeCopy(427, lv, player, 9441)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 427, 9441, lv)
		else
			--不是傲雪或者没有新附魔
			player.ForgetSkill(427)
			player.LearnSkillLevel(6520, lv, player.dwID)
			RecipeCopy(427, lv, player, 6520)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 427, 6520, lv)
		end
	elseif player.GetSkillLevel(9440) ~= 0 then
		local lv = player.GetSkillLevel(9440)
		if player.GetSkillLevel(9437) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10026 then
			--傲雪下有附魔效果
			player.ForgetSkill(9440)
			player.LearnSkillLevel(9441, lv, player.dwID)
			RecipeCopy(9440, lv, player, 9441)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 9440, 9441, lv)
		else
			--不是傲雪或者没有新附魔,其实这种情况不存在
			player.ForgetSkill(9440)
			player.LearnSkillLevel(6520, lv, player.dwID)
			RecipeCopy(9440, lv, player, 6520)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 9440, 6520, lv)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	local lv = player.GetSkillLevel(6520)
	player.ForgetSkill(6520)
	--player.LearnSkill(427)
	player.LearnSkillLevel(427, lv, dwCharacterID)
	RecipeCopy(6520, lv, player, 427)
	RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 6520, 427, lv)
	--]]
	if player.GetSkillLevel(6520) ~= 0 then
		local lv = player.GetSkillLevel(6520)
		player.ForgetSkill(6520)
		player.LearnSkillLevel(427, lv, player.dwID)
		RecipeCopy(6520, lv, player, 427)
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 6520, 427, lv)
	elseif player.GetSkillLevel(9441) ~= 0 then
		local lv = player.GetSkillLevel(9441)
		player.ForgetSkill(9441)
		player.LearnSkillLevel(9440, lv, player.dwID)
		RecipeCopy(9441, lv, player, 9440)
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 9441, 9440, lv)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com