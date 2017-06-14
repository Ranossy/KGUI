---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/镇派_太虚剑意_剑冲阴阳.lua
-- 更新时间:	2016/5/11 20:54:04
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  镇派_太虚剑意_剑冲阴阳.lua
-- 创建人    :  CBG
-- 创建时间  :  2011-04-11
-- 用途(模块):  武功技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 34, nCostMana = 63, nDashSpeed = 120}, -- Level 1 Dash速度单位 点/帧
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

--	skill.AddAttribute(										--突解除锁足效果  2010.11.16 CBG
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
--		7,
--		9999
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		2801,
		1
	);--添加换动作用隐藏Buff

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3050,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/镇派_太虚剑意_剑冲阴阳奇穴.lua", -- 属性值1
		0														-- 属性值2
	);

	skill.AddSlowCheckDestBuff(2291, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求目标Buff
	--skill.BindBuff(1, 2780, 1);		-- 设置1号位Buff
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 384);
	skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 153;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius	= 0* LENGTH_BASE;					--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度,全角256
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	-- if skill.dwLevel == 6 then
	-- player.AcquireAchievement(41)
	-- end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
	-- player.AcquireAchievement(68)
	-- end
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)

	player.DelMultiGroupBuffByFunctionType(4);
	player.DelMultiGroupBuffByFunctionType(6);
	player.DelMultiGroupBuffByFunctionType(8);
	player.DelMultiGroupBuffByFunctionType(7);
	
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com