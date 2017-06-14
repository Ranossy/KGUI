---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/霸刀/霸刀_套路_内功_输出心法.lua
-- 更新时间:	2016/6/28 17:04:20
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 283, nPhysicsAttackPower = 11, nPhysicsShield = 2, nPhysicsHit = 4}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 1728, nPhysicsAttackPower = 18, nPhysicsShield = 3, nPhysicsHit = 6}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 2578, nPhysicsAttackPower = 29, nPhysicsShield = 4, nPhysicsHit = 10}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 3428, nPhysicsAttackPower = 42, nPhysicsShield = 6, nPhysicsHit = 14}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 4278, nPhysicsAttackPower = 55, nPhysicsShield = 7, nPhysicsHit = 17}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 5128, nPhysicsAttackPower = 66, nPhysicsShield = 9, nPhysicsHit = 21}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 5977, nPhysicsAttackPower = 79, nPhysicsShield = 10, nPhysicsHit = 25}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 11691, nPhysicsAttackPower = 92, nPhysicsShield = 12, nPhysicsHit = 28}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 19962, nPhysicsAttackPower = 103, nPhysicsShield = 13, nPhysicsHit = 32}, --level 9	--90
	{ DecriticalDamagePowerBase = 244, nMP = 27091, nPhysicsAttackPower = 320, nPhysicsShield = 30, nPhysicsHit = 71}, --level 10	--95
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/霸刀/霸刀_套路_内功_输出心法.lua",
		0
	);
	--设定最大狂意上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_RAGE,
		100,
		0
	);
	--设定最大刀魂上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_ENERGY,
		100,
		0
	);

	--日能停止转换
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STOP_MAKE_SUN_POWER,
		0,
		0
	);

	--日能最大值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_SUN_ENERGY,
		100,
		0
	);
	
	--心法抗摔
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
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMP / 1200,
		0
	);
	--全仇恨降低
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
 		- 512
	);
	--力道额外提高1.55AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_ATTACK_POWER_COF,
		1587,
		0
	);
	--力道额外提高0.19外功破防
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_OVERCOME_COF,
		195,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
 		- 819,
		0
	);
	--体质加蓝上限
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		1536,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nMP,
		0
	);
	--]]
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

	--普通攻击是否带特效判定
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1427,
		0
	);
	
	--Miss触发碎江天
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1429,
		0
		);


	--秘籍触发碎江天
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1441,
		0
		);

	--项王击鼎会心回复5点怒气
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1446,
		0
		);

	--刀啸风吟会心回能量
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1435,
		0
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 153);
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

function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end
	player.LearnSkillLevel(16023, skill.dwLevel, player.dwID)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	player.DelBuff(10814, 1) --双刀
	player.DelBuff(10815, 1) --大刀
	player.DelBuff(10816, 1) --鞘刀 
	player.AddBuff(player.dwID, player.nLevel, 11157, 1)
	--]]
	player.AddBuff(player.dwID, player.nLevel, 10919, 1)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	player.DelBuff(10919, 1) --姿态监控
	--[[
	player.DelBuff(10814, 1) --双刀
	player.DelBuff(10815, 1) --大刀
	player.DelBuff(10816, 1) --鞘刀 
	player.DelBuff(11157, 1) --无姿态
	--]]
end

function OnTimer(player, nparam1, nparam2)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com