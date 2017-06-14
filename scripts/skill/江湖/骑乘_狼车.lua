---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/骑乘_狼车.lua
-- 更新时间:	2017/6/1 16:37:42
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/江湖/骑乘_狼车.lua",
		0
	);

	----------------- BUFF相关 -------------------------------------------------
	skill.BindBuff(1, 244, 19);		-- 设置1号位Buff

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围

	skill.nPrepareFrames = 48;				-- 吟唱帧数

	----------------- 武器伤害相关 ---------------------------------------------
	skill.nWeaponDamagePercent = 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	local item = player.GetEquippedHorse()
	if not item then
		return false;
	end
	if player.nMoveState == MOVE_STATE.ON_FLOAT then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(5, 5904), 10)
		return false
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local item = player.GetEquippedHorse()
	if not item then
		return
	end
	if item.dwIndex == 21073 then --狼车
		player.AddBuff(0, 99, 244, 19)
		player.AddBuff(0, 99, 8101, 1, 2)--锁操作
		player.AddBuff(0, 99, 8145, 1)--锁后退
	end

	--马匹属性·监控处理
	player.AddBuff(dwCharacterID, player.nLevel, 8475, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com