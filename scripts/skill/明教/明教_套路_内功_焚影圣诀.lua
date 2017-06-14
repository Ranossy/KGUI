---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_套路_内功_焚影圣诀.lua
-- 更新时间:	2015/8/17 8:36:00
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 114, nAttackPower = 13, nMagicDefence = 1, nPhysicsCri = 5, nHit = 3}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 200, nAttackPower = 21, nMagicDefence = 3, nPhysicsCri = 6, nHit = 5}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 457, nAttackPower = 34, nMagicDefence = 5, nPhysicsCri = 9, nHit = 9}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 661, nAttackPower = 49, nMagicDefence = 6, nPhysicsCri = 11, nHit = 12}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 865, nAttackPower = 64, nMagicDefence = 8, nPhysicsCri = 13, nHit = 15}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 1069, nAttackPower = 77, nMagicDefence = 10, nPhysicsCri = 16, nHit = 18}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 1274, nAttackPower = 91, nMagicDefence = 12, nPhysicsCri = 18, nHit = 22}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 1478, nAttackPower = 107, nMagicDefence = 14, nPhysicsCri = 21, nHit = 25}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 1478, nAttackPower = 119, nMagicDefence = 15, nPhysicsCri = 21, nHit = 28}, --level 9	--90
	{ DecriticalDamagePowerBase = 244, nMP = 1478, nAttackPower = 373, nMagicDefence = 35, nPhysicsCri = 21, nHit = 63}, --level 10	--95
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/明教_套路_内功_焚影圣诀.lua",
		0
	);
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
	--化劲
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DECRITICAL_DAMAGE_POWER_BASE,
		tSkillData[dwSkillLevel].DecriticalDamagePowerBase,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
		0
	);
	--增加 元气-1.9阴阳攻击 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_SOLAR_AND_LUNAR_ATTACK_POWER_COF,
		1946,
		0
	);

	--增加 元气-0.04阴阳会心伤害 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_SOLAR_AND_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		41,
		0
		);
	--元气额外提高0.1会心
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_SOLAR_AND_LUNAR_CRITICAL_STRIKE_COF,
		102,
		0
	);

	--日能最大值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_SUN_ENERGY,
		10000,
		0
	);

	--月能最大值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MOON_ENERGY,
		10000,
		0
	);

	--非战斗下日能每秒衰减值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SUN_ENERGY_FALL_OFF,
		100,
		0
	);

	--非战斗下月能每秒衰减值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MOON_ENERGY_FALL_OFF,
		100,
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
		ATTRIBUTE_TYPE.LUNAR_ATTACK_POWER_BASE,
		tSkillData[dwSkillLevel].nAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SOLAR_ATTACK_POWER_BASE,
		tSkillData[dwSkillLevel].nAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_HIT_VALUE,
		tSkillData[dwSkillLevel].nHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SOLAR_HIT_VALUE,
		tSkillData[dwSkillLevel].nHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  内功防御值
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_PERCENT, -- 内力每秒回复
		1024,
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

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --净世破魔击日判个数
	--ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
	--893,
	--0
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --驱夜断愁背刺
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		912,
		0
	);
	--寒月耀打断事件
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1296,
		1
		);

	--12层大奇穴效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1335,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1336,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1337,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1338,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1339,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1340,
		1
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--	skill.SetNormalCoolDown(1, 565);
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
	if player.dwForceID == 10  and player.GetSkillLevel(10240) < 1 then		--学习镇派套路
		player.LearnSkill(10240)
	end
	--player.LearnSkill(4258);
	player.LearnSkillLevel(4258, dwSkillLevel, player.dwID)
	player.LearnSkill(4259);
	player.LearnSkill(4431);
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/明教/明教_套路_内功_焚影圣诀.lua",0,0)
	end
end


--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(4674,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com