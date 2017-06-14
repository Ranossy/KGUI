---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_内功_花间游.lua
-- 更新时间:	2015/8/17 9:49:52
-- 更新用户:	mengxiangfei11
-- 脚本说明:
--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nMaxMana = 322, nSpunkAttackPower = 12, nNeHit = 2, nLifeReplenish = 1, nMagicDefence = 1}, --15级
	{DecriticalDamagePowerBase = 22, nMaxMana = 1962, nSpunkAttackPower = 20, nNeHit = 3, nLifeReplenish = 2, nMagicDefence = 2}, --20级
	{DecriticalDamagePowerBase = 35, nMaxMana = 2926, nSpunkAttackPower = 32, nNeHit = 6, nLifeReplenish = 3, nMagicDefence = 4}, --30级
	{DecriticalDamagePowerBase = 47, nMaxMana = 3891, nSpunkAttackPower = 47, nNeHit = 8, nLifeReplenish = 5, nMagicDefence = 5}, --40级
	{DecriticalDamagePowerBase = 60, nMaxMana = 4855, nSpunkAttackPower = 61, nNeHit = 10, nLifeReplenish = 6, nMagicDefence = 6}, --50级
	{DecriticalDamagePowerBase = 72, nMaxMana = 5820, nSpunkAttackPower = 73, nNeHit = 12, nLifeReplenish = 8, nMagicDefence = 8}, --60级
	{DecriticalDamagePowerBase = 85, nMaxMana = 6784, nSpunkAttackPower = 87, nNeHit = 14, nLifeReplenish = 9, nMagicDefence = 9}, --70级
	{DecriticalDamagePowerBase = 98, nMaxMana = 13270, nSpunkAttackPower = 102, nNeHit = 16, nLifeReplenish = 11, nMagicDefence = 11}, --80级
	{DecriticalDamagePowerBase = 110, nMaxMana = 22656, nSpunkAttackPower = 113, nNeHit = 19, nLifeReplenish = 12, nMagicDefence = 12}, --90级
	{DecriticalDamagePowerBase = 244, nMaxMana = 30748, nSpunkAttackPower = 355, nNeHit = 42, nLifeReplenish = 27, nMagicDefence = 28}, --95级
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_内功_花间游.lua",
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
	);
	--增加 元气-1.95混元性内功AP 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_NEUTRAL_ATTACK_POWER_COF,
		1997,
		0
		);
	--元气增加0.09破防
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_NEUTRAL_OVERCOME_COF,
		92,
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
		ATTRIBUTE_TYPE.NEUTRAL_HIT_VALUE, -- 混元性内功命中
		tSkillData[nSkillLevel].nNeHit,
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
		ATTRIBUTE_TYPE.LIFE_REPLENISH_EXT, -- 气血每秒回复
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

	--此处添加厥阴指打断吟唱的技能事件
--	for i = 1, 7 do
--	    skill.AddAttribute(
--	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
--	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,						-- 技能事件153：（所有伤害技能）命中正在运功的目标20%触发598，被击回血1-7级.
--	        152 + i,
--	        0
--	    );
--    end							-- 去掉吟唱被击回血  2009-6-29 CBG

--	if nSkillLevel >= 5 then		--2009.6.29 去掉5级内功限制 CBG
--		skill.AddAttribute(
--			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
--			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,						-- 技能事件162：（万花-阳明指）命中10%触发601-吞噬BUFF：714、666、711、647.
--			162,
--			1
--		);
--	end

	--这里添加 元气回复内力 可在战斗中维持的效果。
--[[	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	ATTRIBUTE_TYPE.MANA_REPLENISH_COEFFICIENT,
	1024,
	0
	);	]]--

--[[	if nSkillLevel >= 2 then		--2009.8.19 增加2级内功被暴击回血
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		260,
		1
	);
end

if nSkillLevel >= 4 then 			--2010.2.26 增加4级内功特殊效果, 减少技能仇恨20%
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-204
	);
end

if nSkillLevel >= 5 then		--2009.6.29 增加5级内功阳明指刷新芙蓉并蒂
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		243, -- 技能事件243：（万花-阳明指）100%几率重置芙蓉并蒂CD
		1
	);
end

if nSkillLevel >= 6 then		-- 2009.6.30新增 玉石俱焚30%几率为目标加定身  需求6级内功 --CBG
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		246, -- 技能事件246：（万花-玉石俱焚）30%几率令目标定身4s
		1
	);
end   ]]--
----------------- 设置CoolDown ---------------------------------------------------------------------
--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
--skill.SetNormalCoolDown(1, 8);
--skill.SetNormalCoolDown(1, 155);
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
	if player.dwForceID == 2 and player.GetSkillLevel(10198) < 1 then		--学习镇派套路
		player.LearnSkill(10198)
	end
	--player.LearnSkill(487);
	player.LearnSkillLevel(487, dwSkillLevel, player.dwID)
	player.LearnSkill(491)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/万花/万花_内功_花间游.lua",0,0)
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
		player.CastSkill(230,1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com