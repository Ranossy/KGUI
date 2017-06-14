---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_套路_洗髓经.lua
-- 更新时间:	2015/8/17 9:14:02
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLife = 307, nMana = 272, nMagicDefence = 7, nDuck = 4, nPhysicDefence = 4},
	{nLife = 523, nMana = 1659, nMagicDefence = 12, nDuck = 7, nPhysicDefence = 7},
	{nLife = 1112, nMana = 2475, nMagicDefence = 19, nDuck = 11, nPhysicDefence = 11},
	{nLife = 1604, nMana = 3291, nMagicDefence = 26, nDuck = 15, nPhysicDefence = 15},
	{nLife = 2096, nMana = 4107, nMagicDefence = 33, nDuck = 20, nPhysicDefence = 20},
	{nLife = 2588, nMana = 4923, nMagicDefence = 39, nDuck = 24, nPhysicDefence = 24},
	{nLife = 3080, nMana = 5738, nMagicDefence = 46, nDuck = 28, nPhysicDefence = 28},
	{nLife = 7071, nMana = 11224, nMagicDefence = 53, nDuck = 32, nPhysicDefence = 32},
	{nLife = 7071, nMana = 19163, nMagicDefence = 60, nDuck = 36, nPhysicDefence = 36},
	{nLife = 7071, nMana = 26007, nMagicDefence = 133, nDuck = 80, nPhysicDefence = 80},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	--提高普通攻击伤害
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
	);
	--普渡仇恨
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1760,
		1
	);
	--韦陀仇恨
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1761,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1762,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1757,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1780,
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
	--体质提高2.5HP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_LIFE_COF,
		2560,
		0
		);
	--体质提高0.1内防
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAGIC_SHIELD_COF,
		102,
		0
	);
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		768,
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
		(35 + 2 * dwSkillLevel) / 100 * 1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE, --  内力最大值
		tSkillData[nSkillLevel].nMana,
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
		ATTRIBUTE_TYPE.PHYSICS_REFLECTION, --  外功反弹
		tSkillData[nSkillLevel].nDuck,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.POISON_MAGIC_REFLECTION, --  毒反弹
		tSkillData[nSkillLevel].nDuck,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SOLAR_MAGIC_REFLECTION, --  阳性内功反弹
		tSkillData[nSkillLevel].nDuck,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.NEUTRAL_MAGIC_REFLECTION, --  混元反弹
		tSkillData[nSkillLevel].nDuck,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_MAGIC_REFLECTION, --  阴反弹
		tSkillData[nSkillLevel].nDuck,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_BASE, --  外功防御
		tSkillData[nSkillLevel].nPhysicDefence,
		0
	);

--添加 洗髓心法的仇恨效果提升50%   2011/6/27
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		512
	);

	--各类技能事件
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, --  技能事件87：被所有伤害技能攻击100%触发339技能，增加一点反击值，一秒CD
		87,
		0
	);

	-- 每3秒回禅拿
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 为了调下面的apply，而再把这个脚本运行一遍。
		"skill/少林/少林_套路_洗髓经.lua",
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
	--skill.SetNormalCoolDown(1, 156);
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
	--player.LearnSkill(578);
	player.LearnSkillLevel(578, dwSkillLevel, player.dwID)
	player.LearnSkill(579)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)			--624buff——3秒回一点气
	if player then
		player.AddBuff(player.dwID, player.nLevel, 1157, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 6204, 1)
		player.SetTimer(16,"scripts/skill/少林/少林_套路_洗髓经.lua",0,0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)

	if player then
		player.DelBuff(1157, 1)
		player.DelBuff(6204, 1)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(740,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com