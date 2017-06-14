---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/七秀_内功_冰心诀.lua
-- 更新时间:	2015/8/16 17:34:29
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nManaAdd = 313, nLunarAPAdd = 12, nDodge = 2, nLunarHit = 2, nMagicDefence = 2},
	{DecriticalDamagePowerBase = 22, nManaAdd = 1904, nLunarAPAdd = 20, nDodge = 3, nLunarHit = 3, nMagicDefence = 5},
	{DecriticalDamagePowerBase = 35, nManaAdd = 2840, nLunarAPAdd = 32, nDodge = 6, nLunarHit = 6, nMagicDefence = 8},
	{DecriticalDamagePowerBase = 47, nManaAdd = 3776, nLunarAPAdd = 47, nDodge = 8, nLunarHit = 8, nMagicDefence = 10},
	{DecriticalDamagePowerBase = 60, nManaAdd = 4713, nLunarAPAdd = 61, nDodge = 10, nLunarHit = 10, nMagicDefence = 13},
	{DecriticalDamagePowerBase = 72, nManaAdd = 5648, nLunarAPAdd = 73, nDodge = 12, nLunarHit = 12, nMagicDefence = 16},
	{DecriticalDamagePowerBase = 85, nManaAdd = 6585, nLunarAPAdd = 87, nDodge = 14, nLunarHit = 14, nMagicDefence = 19},
	{DecriticalDamagePowerBase = 98, nManaAdd = 12880, nLunarAPAdd = 102, nDodge = 16, nLunarHit = 16, nMagicDefence = 22},
	{DecriticalDamagePowerBase = 110, nManaAdd = 21990, nLunarAPAdd = 113, nDodge = 19, nLunarHit = 19, nMagicDefence = 25},
	{DecriticalDamagePowerBase = 244, nManaAdd = 29844, nLunarAPAdd = 355, nDodge = 42, nLunarHit = 42, nMagicDefence = 56},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
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
		"skill/七秀/七秀_内功_冰心诀.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		680,
		2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		681,
		2
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
		tSkillData[dwSkillLevel].nManaAdd / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nManaAdd / 1200,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-512
		);
	
	--增加 根骨-阴性内功AP 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_ATTACK_POWER_COF,
		1946,
		0
	);
	--增加 根骨-阴性内功会心值 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_STRIKE_COF,
		102,
		0
		);
	--根骨转会效
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		41,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-819,
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --生命上限
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --内力
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nManaAdd,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --阴性内功攻击力
		ATTRIBUTE_TYPE.LUNAR_ATTACK_POWER_BASE,
		tSkillData[dwSkillLevel].nLunarAPAdd,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --闪避
		ATTRIBUTE_TYPE.DODGE,
		tSkillData[dwSkillLevel].nDodge,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --阴性内功命中
		ATTRIBUTE_TYPE.LUNAR_HIT_VALUE,
		tSkillData[dwSkillLevel].nLunarHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  内功防御值
		tSkillData[dwSkillLevel].nMagicDefence,
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

	-- 40级属性做在剑舞buff上

	-- 50级属性做在碟弄足技能上

	--60级属性：使用鹊踏枝后闪避外功技能后反击造成伤害，坐在鹊踏枝buff上

	--[[  if dwSkillLevel >= 7 then
    	skill.AddAttribute(
		    ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,          --70级属性：江海凝光爆击有一定几率清除剑气长江CD
	    	ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
	    	180,
	    	0
		);
    end--]]

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 157);
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
	if player.dwForceID == 5 and player.GetSkillLevel(10200) < 1 then		--学习镇派套路
		player.LearnSkill(10200)
	end
	--player.LearnSkill(542);
	player.LearnSkillLevel(542, dwSkillLevel, player.dwID)
	player.LearnSkill(560);
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.AddBuff(player.dwID, player.nLevel, 6176, 1)
		player.SetTimer(16,"scripts/skill/七秀/七秀_内功_冰心诀.lua",0,0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.DelBuff(6176, 1)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
		if player.IsFormationLeader() then
		player.CastSkill(781,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com