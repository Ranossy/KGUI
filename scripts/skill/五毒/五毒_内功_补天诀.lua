---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/五毒_内功_补天诀.lua
-- 更新时间:	2015/8/17 8:22:09
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nMaxMana = 345, nTherapyPower = 100, nLifeReplenish = 2, nManaReplenish = 2, nMagicDefence = 1},
	{DecriticalDamagePowerBase = 22, nMaxMana = 2100, nTherapyPower = 200, nLifeReplenish = 4, nManaReplenish = 2, nMagicDefence = 3},
	{DecriticalDamagePowerBase = 35, nMaxMana = 3132, nTherapyPower = 300, nLifeReplenish = 6, nManaReplenish = 3, nMagicDefence = 5},
	{DecriticalDamagePowerBase = 47, nMaxMana = 4166, nTherapyPower = 400, nLifeReplenish = 9, nManaReplenish = 4, nMagicDefence = 6},
	{DecriticalDamagePowerBase = 60, nMaxMana = 5198, nTherapyPower = 500, nLifeReplenish = 11, nManaReplenish = 5, nMagicDefence = 8},
	{DecriticalDamagePowerBase = 72, nMaxMana = 6231, nTherapyPower = 600, nLifeReplenish = 13, nManaReplenish = 6, nMagicDefence = 10},
	{DecriticalDamagePowerBase = 85, nMaxMana = 7263, nTherapyPower = 700, nLifeReplenish = 16, nManaReplenish = 7, nMagicDefence = 12},
	{DecriticalDamagePowerBase = 98, nMaxMana = 14206, nTherapyPower = 800, nLifeReplenish = 18, nManaReplenish = 8, nMagicDefence = 14},
	{DecriticalDamagePowerBase = 110, nMaxMana = 24255, nTherapyPower = 900, nLifeReplenish = 21, nManaReplenish = 9, nMagicDefence = 15},
	{DecriticalDamagePowerBase = 244, nMaxMana = 32918, nTherapyPower = 1432, nLifeReplenish = 46, nManaReplenish = 9, nMagicDefence = 35},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	--增加 根骨-治疗AP 加成
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
		688,
		3
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		489,
		0
		);
	--根骨提高1.75治疗效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_THERAPY_POWER_COF,
		1792,
		0
	);
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		2304,
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
		ATTRIBUTE_TYPE.MAX_MANA_BASE, --  内力最大值
		tSkillData[nSkillLevel].nMaxMana,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_BASE, --  治疗能力
		tSkillData[nSkillLevel].nTherapyPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LIFE_REPLENISH_EXT, --  气血每秒回复
		tSkillData[nSkillLevel].nLifeReplenish,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  内功防御值
		tSkillData[nSkillLevel].nMagicDefence,
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

	--切换内功时删除之前的宠物
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/五毒/五毒_内功_补天诀.lua",
		0
	);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 452);
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
	if player.dwForceID == 6 and player.GetSkillLevel(10210) < 1 then		--学习镇派套路
		player.LearnSkill(10210)
	end
	--player.LearnSkill(2244);
	player.LearnSkillLevel(2244, dwSkillLevel, player.dwID)
	player.LearnSkill(2245);
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetTimer(16,"scripts/skill/五毒/五毒_内功_补天诀.lua",0,0)
	local scene = player.GetScene()
	if not scene then
		return
	end

	local npc = GetNpc(player.dwPetID)
	if npc then
		scene.DestroyNpc(npc.dwID)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	local npc = GetNpc(player.dwPetID)
	if npc then
		scene.DestroyNpc(npc.dwID)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(2481,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com