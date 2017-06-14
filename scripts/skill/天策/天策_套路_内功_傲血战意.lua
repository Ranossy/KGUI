---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_套路_内功_傲血战意.lua
-- 更新时间:	2014/7/16 20:06:01
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_套路_内功系_傲血战意.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-03-24
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  内功
-- 武功套路  :  是
-- 技能名称  :  内功系
-- 技能效果  :  武功套路，装备后根据增加外功AP,命中值和外功会心值
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--疾如风的效果归入傲雪战意,每级AP加成
tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 283, nPhysicsAttackPower = 11, nPhysicsShield = 1, nPhysicsHit = 3}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 1728, nPhysicsAttackPower = 19, nPhysicsShield = 2, nPhysicsHit = 5}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 2578, nPhysicsAttackPower = 30, nPhysicsShield = 4, nPhysicsHit = 9}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 3428, nPhysicsAttackPower = 43, nPhysicsShield = 6, nPhysicsHit = 12}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 4278, nPhysicsAttackPower = 56, nPhysicsShield = 7, nPhysicsHit = 15}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 5128, nPhysicsAttackPower = 67, nPhysicsShield = 9, nPhysicsHit = 18}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 5977, nPhysicsAttackPower = 80, nPhysicsShield = 11, nPhysicsHit = 22}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 11691, nPhysicsAttackPower = 94, nPhysicsShield = 12, nPhysicsHit = 25}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 19962, nPhysicsAttackPower = 105, nPhysicsShield = 14, nPhysicsHit = 28}, --level 9	--90
	{ DecriticalDamagePowerBase = 244, nMP = 27091, nPhysicsAttackPower = 326, nPhysicsShield = 31, nPhysicsHit = 63},	--level 10	--95
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
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
		"skill/天策/天策_套路_内功_傲血战意.lua",
		0
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
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
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
		-307
		);
	--力道额外提高1.6AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_ATTACK_POWER_COF,
		1638,
		0
		);
	--力道额外提高外功破防
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_OVERCOME_COF,
		123,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
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


	--这里添加 破坚阵打断施法的技能事件
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		114,
		0
	);

	--这里添加 崩打断施法的技能事件,分成5级,以实现伤害不同的效果.
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		148,
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1110,
		2
	);
	--疾默认晕人
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
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

	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 3 and player.GetSkillLevel(10197) < 1 then		--学习镇派套路
		player.LearnSkill(10197)
	end
	--player.LearnSkill(520);
	player.LearnSkillLevel(520, dwSkillLevel, player.dwID)
	player.LearnSkill(521)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/天策/天策_套路_内功_傲血战意.lua",0,0)
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
		player.CastSkill(754,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com