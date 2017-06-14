---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_内功_离经易道.lua
-- 更新时间:	2015/8/17 9:58:19
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nMaxMana = 359, nTherapyPower = 100, nLifeReplenish = 2, nManaReplenish = 1, nMagicDefence = 1},
	{DecriticalDamagePowerBase = 22, nMaxMana = 2185, nTherapyPower = 200, nLifeReplenish = 5, nManaReplenish = 2, nMagicDefence = 3},
	{DecriticalDamagePowerBase = 35, nMaxMana = 3259, nTherapyPower = 300, nLifeReplenish = 7, nManaReplenish = 2, nMagicDefence = 5},
	{DecriticalDamagePowerBase = 47, nMaxMana = 4334, nTherapyPower = 400, nLifeReplenish = 10, nManaReplenish = 3, nMagicDefence = 6},
	{DecriticalDamagePowerBase = 60, nMaxMana = 5408, nTherapyPower = 500, nLifeReplenish = 13, nManaReplenish = 4, nMagicDefence = 8},
	{DecriticalDamagePowerBase = 72, nMaxMana = 6482, nTherapyPower = 600, nLifeReplenish = 16, nManaReplenish = 5, nMagicDefence = 10},
	{DecriticalDamagePowerBase = 85, nMaxMana = 7557, nTherapyPower = 700, nLifeReplenish = 19, nManaReplenish = 5, nMagicDefence = 12},
	{DecriticalDamagePowerBase = 98, nMaxMana = 14780, nTherapyPower = 800, nLifeReplenish = 22, nManaReplenish = 6, nMagicDefence = 14},
	{DecriticalDamagePowerBase = 110, nMaxMana = 25235, nTherapyPower = 900, nLifeReplenish = 25, nManaReplenish = 7, nMagicDefence = 15},
	{DecriticalDamagePowerBase = 244, nMaxMana = 34248, nTherapyPower = 1369, nLifeReplenish = 55, nManaReplenish = 7, nMagicDefence = 35},
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_内功_离经易道.lua",
		0
	);
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
	--根骨提高1.6治疗AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_THERAPY_POWER_COF,
		1638,
		0
	);
	--增加 根骨-0.15混元会心 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_NEUTRAL_CRITICAL_STRIKE_COF,
		154,
		0
		);
	--根骨提高0.05会心效果
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_NEUTRAL_CRITICAL_DAMAGE_POWER_COF,
		51,
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

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- 技能事件100：（万花-打断技能）命中正在运功的目标100%触发144-585BUFF-沉默3秒
		100,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- 技能事件153：（所有伤害技能）命中正在运功的目标20%触发598，被击回血1-7级.
		152 + nSkillLevel,
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

--[[	if nSkillLevel >= 2 then		--2009.8.19 增加2级内功太素九针暴击加目标受治疗量
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
			261,
			1
		);
	end

	if nSkillLevel >= 5 then
	    skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,					-- 技能事件115：（万花-太素九针）使用20%触发292-721BUFF-每秒回3点兰.
	        115,
	        0
	    );

	    skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,					-- 技能事件276：（万花-太素九针）暴击触发1682BUFF-AP提高210点.
	        276,
	        0
	    );
	end

    if nSkillLevel >= 7 then
	    skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,					-- 技能事件116：（万花-太素九针）使用10%触发293-722BUFF-6秒接下来的瞬发技能瞬发
	        116,
	        0
	    );
	end--]]

	--这里添加 元气回复内力 可在战斗中维持的效果。

	--skill.SetNormalCoolDown(1, 155);
	--skill.SetNormalCoolDown(2, 152);

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);

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
	if player.dwForceID == 2 and player.GetSkillLevel(10198) < 1 then		--学习镇派套路
		player.LearnSkill(10198)
	end
	--player.LearnSkill(492);
	player.LearnSkillLevel(492, dwSkillLevel, player.dwID)
	player.LearnSkill(493)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/万花/万花_内功_离经易道.lua",0,0)
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
		player.CastSkill(1020,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com