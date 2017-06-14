---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/丐帮_内功.lua
-- 更新时间:	2015/8/17 8:49:24
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--疾如风的效果归入傲雪战意,每级AP加成
tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 285, nPhysicsAttackPower = 11, nPhysicsShield = 1, nPhysicsCri = 0, nPhysicsHit = 3}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 1737, nPhysicsAttackPower = 18, nPhysicsShield = 2, nPhysicsCri = 0, nPhysicsHit = 6}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 2591, nPhysicsAttackPower = 28, nPhysicsShield = 3, nPhysicsCri = 0, nPhysicsHit = 10}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 3445, nPhysicsAttackPower = 41, nPhysicsShield = 4, nPhysicsCri = 0, nPhysicsHit = 13}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 4299, nPhysicsAttackPower = 54, nPhysicsShield = 6, nPhysicsCri = 0, nPhysicsHit = 17}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 5153, nPhysicsAttackPower = 64, nPhysicsShield = 7, nPhysicsCri = 0, nPhysicsHit = 21}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 6007, nPhysicsAttackPower = 77, nPhysicsShield = 8, nPhysicsCri = 0, nPhysicsHit = 24}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 11750, nPhysicsAttackPower = 89, nPhysicsShield = 10, nPhysicsCri = 0, nPhysicsHit = 28}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 20062, nPhysicsAttackPower = 100, nPhysicsShield = 11, nPhysicsCri = 0, nPhysicsHit = 31},
	{ DecriticalDamagePowerBase = 244, nMP = 27227, nPhysicsAttackPower = 311, nPhysicsShield = 25, nPhysicsCri = 0, nPhysicsHit = 70},
};
--这里的表是天策_崩_打断成功效果之后的伤害技能事件ID,通过内功不同等级来区别,以此逐级增加伤害.
tSkillEventData =
{
	{nLevel = 1, nEventID = 118 };
	{nLevel = 2, nEventID = 118 };
	{nLevel = 3, nEventID = 118 };	--崩第一次出现在32级-崩-命中正在运功的目标100%触发483，伤害+打断
	{nLevel = 4, nEventID = 145 };	--40
	{nLevel = 5, nEventID = 146 };	--50
	{nLevel = 6, nEventID = 147 };	--60
	{nLevel = 7, nEventID = 148 }	--最后升到70级

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
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
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMP / 1200,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
		);
	--力道转1.5AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_ATTACK_POWER_COF,
		1536,
		0
		);
	--力道0.25破防
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_OVERCOME_COF,
		256,
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MOVE_SPEED_PERCENT,
		105,
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
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nMP,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_BASE,
		tSkillData[dwSkillLevel].nPhysicsAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_BASE,
		tSkillData[dwSkillLevel].nPhysicsShield,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_HIT_VALUE,
		tSkillData[dwSkillLevel].nPhysicsHit,
		0
	);

--这里添加 元气回蓝 可在战斗中维持的效果。
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.MANA_REPLENISH_COEFFICIENT,
	--1024,
	--0
	--);

--这里添加 破坚阵打断施法的技能事件

--龙吟50%几率518SKILL附带540BUFF重伤
--[[	if dwSkillLevel >= 2 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
			144,
			0
		);
	end--]]

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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1127,
		0
	);
--这里添加 傲血战意40级特殊效果, 减少技能仇恨30%
--[[	if dwSkillLevel >= 4 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
			0,
			-303
		);
	end--]]

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetNormalCoolDown(1, 153);
--	skill.SetNormalCoolDown(2, 152);

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

	skill.nWeaponDamagePercent = 0; -- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end

	local dwSkillLevel = skill.dwLevel;
	--if player.dwForceID == 9 and player.GetSkillLevel(10197) < 1 then		--学习镇派套路
	--player.LearnSkill(10197)
	--end
	--player.LearnSkill(5308);
	player.LearnSkillLevel(5308, dwSkillLevel, player.dwID)
	player.LearnSkill(5309)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com