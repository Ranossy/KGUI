---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_套路_易筋经.lua
-- 更新时间:	2015/8/17 9:20:42
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nMana = 315, nMagicDamage = 12, nPhysicDefence = 1, nHit = 2, nMagicDefence = 1}, --15
	{DecriticalDamagePowerBase = 22, nMana = 1921, nMagicDamage = 20, nPhysicDefence = 2, nHit = 3, nMagicDefence = 2}, --20
	{DecriticalDamagePowerBase = 35, nMana = 2866, nMagicDamage = 32, nPhysicDefence = 3, nHit = 6, nMagicDefence = 3}, --30
	{DecriticalDamagePowerBase = 47, nMana = 3811, nMagicDamage = 47, nPhysicDefence = 4, nHit = 8, nMagicDefence = 5}, --40
	{DecriticalDamagePowerBase = 60, nMana = 4755, nMagicDamage = 61, nPhysicDefence = 5, nHit = 10, nMagicDefence = 6}, --50
	{DecriticalDamagePowerBase = 72, nMana = 5700, nMagicDamage = 73, nPhysicDefence = 6, nHit = 12, nMagicDefence = 7}, --60
	{DecriticalDamagePowerBase = 85, nMana = 6645, nMagicDamage = 87, nPhysicDefence = 7, nHit = 14, nMagicDefence = 9}, --70
	{DecriticalDamagePowerBase = 98, nMana = 12997, nMagicDamage = 102, nPhysicDefence = 9, nHit = 16, nMagicDefence = 10}, --80
	{DecriticalDamagePowerBase = 110, nMana = 22190, nMagicDamage = 113, nPhysicDefence = 10, nHit = 19, nMagicDefence = 12}, --90
	{DecriticalDamagePowerBase = 244, nMana = 30115, nMagicDamage = 355, nPhysicDefence = 22, nHit = 42, nMagicDefence = 26}, --95
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DROP_DEFENCE,
		250,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 为了调下面的apply，而再把这个脚本运行一遍。
		"skill/少林/少林_套路_易筋经.lua",
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
		tSkillData[dwSkillLevel].nMana / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMana / 1200,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
		);
	--元气提高1.85内功AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_SOLAR_ATTACK_POWER_COF,
		1894,
		0
		);
	--元气提高0.15会心
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_SOLAR_CRITICAL_STRIKE_COF,
		154,
		0
		);
	--元气提高0.05会效
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_SOLAR_CRITICAL_DAMAGE_POWER_COF,
		51,
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
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 2 + 10) / 100 * 1024,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE, -- 内力最大值
		tSkillData[nSkillLevel].nMana,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_ATTACK_POWER_BASE, -- 内功AP值
		tSkillData[nSkillLevel].nMagicDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_BASE, --  外功防御值
		tSkillData[nSkillLevel].nPhysicDefence,
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
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- 86技能事件：少林-普渡四方100%触发204号技能增加一点反击值
		86,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SOLAR_HIT_VALUE, -- 阳性内功命中值
		tSkillData[nSkillLevel].nHit,
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

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetNormalCoolDown(1, 156);
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

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end
	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 1 and player.GetSkillLevel(10196) < 1 then		--学习镇派套路
		player.LearnSkill(10196)
	end
	--player.LearnSkill(583);
	player.LearnSkillLevel(583, dwSkillLevel, player.dwID)
	player.LearnSkill(584);
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(dwCharacterID, player.nLevel, 6193, 1, 1)
	player.SetTimer(16,"scripts/skill/少林/少林_套路_易筋经.lua",0,0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.DelBuff(6193, 1)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(745,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com