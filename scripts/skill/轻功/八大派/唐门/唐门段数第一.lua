---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/八大派/唐门/唐门段数第一.lua
-- 更新时间:	2016/3/22 22:25:17
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/轻功/八大派/唐门/唐门段数第一.lua",
		0
	);

	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if not player.bSprintFlag then
		nPreResult = false
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)

	local player = GetPlayer(dwCharacterID)
	-------------------------------------------------
	--检查，判断等情况
		--退出滞空
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end

		player.SetPassiveVelocityXY(0)
		player.SetPassiveVelocityZ(0)
		player.UnlockPassiveDirectionXYByFace()
	-------------------------------------------------
	-------------------------------------------------
--	player.SetTarget(TARGET.PLAYER, player.dwID) --强制目标十分不妥当
--	player.CastSkill(15795, 1)--链状技能触发技能，已经改为轻功表表现实现，因此此处废弃，留痕备查BY鱼头 20160421

	--执行子技能触发
	player.CastSkill(15614, 1)--唐门第一执行子技能
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com