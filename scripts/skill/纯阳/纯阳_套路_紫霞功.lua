---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/纯阳_套路_紫霞功.lua
-- 更新时间:	2015/8/17 9:34:27
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nMaxMana = 316, nSpunkAttackPower = 11, nNeutralHit = 3, nNeutralCritical = 2, nMagicDefence = 2}, -- level1
	{DecriticalDamagePowerBase = 22, nMaxMana = 1923, nSpunkAttackPower = 18, nNeutralHit = 6, nNeutralCritical = 3, nMagicDefence = 3},
	{DecriticalDamagePowerBase = 35, nMaxMana = 2868, nSpunkAttackPower = 29, nNeutralHit = 10, nNeutralCritical = 6, nMagicDefence = 6},
	{DecriticalDamagePowerBase = 47, nMaxMana = 3814, nSpunkAttackPower = 42, nNeutralHit = 13, nNeutralCritical = 8, nMagicDefence = 8},
	{DecriticalDamagePowerBase = 60, nMaxMana = 4760, nSpunkAttackPower = 55, nNeutralHit = 17, nNeutralCritical = 10, nMagicDefence = 10},
	{DecriticalDamagePowerBase = 72, nMaxMana = 5705, nSpunkAttackPower = 66, nNeutralHit = 21, nNeutralCritical = 12, nMagicDefence = 12},
	{DecriticalDamagePowerBase = 85, nMaxMana = 6651, nSpunkAttackPower = 78, nNeutralHit = 24, nNeutralCritical = 14, nMagicDefence = 14}, -- level7
	{DecriticalDamagePowerBase = 98, nMaxMana = 13010, nSpunkAttackPower = 92, nNeutralHit = 28, nNeutralCritical = 16, nMagicDefence = 16}, -- level7
	{DecriticalDamagePowerBase = 110, nMaxMana = 22212, nSpunkAttackPower = 102, nNeutralHit = 31, nNeutralCritical = 19, nMagicDefence = 19}, -- level7
	{DecriticalDamagePowerBase = 244, nMaxMana = 30145, nSpunkAttackPower = 320, nNeutralHit = 70, nNeutralCritical = 42, nMagicDefence = 42}, -- level7
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
	);
	--普通攻击放大器
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DROP_DEFENCE,
		250,
		0
	);
	--化劲
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DECRITICAL_DAMAGE_POWER_BASE,
		tSkillData[dwSkillLevel].DecriticalDamagePowerBase,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMaxMana / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMaxMana / 1200,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		974,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		975,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		976,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		977,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
		);
	--根骨提高1.75内功AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_NEUTRAL_ATTACK_POWER_COF,
		1792,
		0
	);
	--增加 根骨-0.08混元内功会心伤害 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_NEUTRAL_CRITICAL_DAMAGE_POWER_COF,
		82,
		0
	);

	--增加 根骨-0.23混元会心 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_NEUTRAL_CRITICAL_STRIKE_COF,
		236,
		0
	);
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		1536,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-819,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE, -- 内力最大值
		tSkillData[nSkillLevel].nMaxMana,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.NEUTRAL_HIT_VALUE, -- 混元性内功命中值
		tSkillData[nSkillLevel].nNeutralHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_ATTACK_POWER_BASE, -- 内功AP
		tSkillData[nSkillLevel].nSpunkAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE, -- 混元性内功会心值
		tSkillData[nSkillLevel].nNeutralCritical,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  内功防御值
		tSkillData[nSkillLevel].nMagicDefence,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- 技能事件228：放气未命中则回气
		228,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- 八卦洞玄打断
		354,
		0
	);
	-- 默认属性，每3秒回气 及 放气暴击后回气
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 为了调下面的apply，而再把这个脚本运行一遍。
		"skill/纯阳/纯阳_套路_紫霞功.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- 八卦洞玄打断
		89,
		0
	);

--添加探梅、蛊惑众生技能事件  2011-12-8
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		639,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		640,
		0
	);
	--切2内删除剑舞
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 为了调下面的apply，而再把这个脚本运行一遍。
	--"skill/七秀/90级奇穴/切二内删除剑舞.lua",
	--0
	--);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 154);
	--skill.SetNormalCoolDown(2, 152);

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= 0;

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius		= 0											--技能施放最小半径
	--skill.nMaxRadius        = 2 * LENGTH_BASE;							--技能施放最大半径
	--skill.nAngleRange       = 128; 										--施放角度

	--skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒

	--skill.nBulletVelocity   = 12;										--子弹速度,点/帧

	--skill.nBreakRate        = 1024;									--被打断的概率,默认1024表示一定被打断

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end

	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 4 and player.GetSkillLevel(10199) < 1 then		--学习镇派套路
		player.LearnSkill(10199)
	end
	--player.LearnSkill(345);
	player.LearnSkillLevel(345, dwSkillLevel, player.dwID)
	player.LearnSkill(484)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)			--624buff——3秒回一点气
	if player then
		player.AddBuff(player.dwID, player.nLevel, 624, 1)
		player.AddBuff(player.dwID, player.nLevel, 6094, 1)
		player.AddBuff(player.dwID, player.nLevel, 6095, 1)
		player.SetTimer(16,"scripts/skill/纯阳/纯阳_套路_紫霞功.lua",0,0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)

	if player then
		player.DelBuff(624, 1)
		player.DelBuff(6094, 1)
		--player.DelBuff(5860, 1)
		player.DelBuff(6095, 1)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(347,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com