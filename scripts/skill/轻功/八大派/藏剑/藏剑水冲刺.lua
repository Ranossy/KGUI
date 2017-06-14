---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/八大派/藏剑/藏剑水冲刺.lua
-- 更新时间:	2016/5/17 20:42:26
-- 更新用户:	zhangyan-pc
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
		"skill/轻功/八大派/藏剑/藏剑水冲刺.lua",
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
	------------------------------------------------
	local buff = player.GetBuff(10191, 1)--CD
	if buff then
		return
	end
	player.AddBuff(0, 99, 10191, 1, 3)
	------------------------------------------------
	------------------------------------------------
	--清理时间轴
	local buff = player.GetBuff(10555, 1)
	if buff then
		for i = 1, buff.nStackNum do
			player.DelBuff(10555, 1)
		end
	end
	--添加时间轴判断
	player.AddBuff(0, 99, 10555, 1)
	-------------------------------------------------
	---------
	local nNumValue = 50 * 100--一次性消耗
	---------
	--执行子技能触发
	local nSkillid = 15923--藏剑水冲刺执行子技能
	local nSkilllv = 1		
	----------
	local nNumPoint = player.nSprintPower
	if nNumPoint ~= 0 then
		if nNumPoint > nNumValue then
			if not (player.nDisableSprintPowerCost > 0) then
				player.SetSprintPower(0, nNumPoint - nNumValue)--扣减气力值 0代表人,1代表马
			end
			player.CastSkill(nSkillid, nSkilllv)
		else
			if not (player.nDisableSprintPowerCost > 0) then
				player.SetSprintPower(0, 0)
			end	
			player.CastSkill(nSkillid, nSkilllv)
		end
	end	
	----------
	-------------------------------------------------
	--执行子技能触发
	--player.CastSkill(15923, 1)--藏剑水冲刺执行子技能
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com