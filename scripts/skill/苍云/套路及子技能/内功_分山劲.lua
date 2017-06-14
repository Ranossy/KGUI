---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/内功_分山劲.lua
-- 更新时间:	2015/8/16 16:51:19
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nPhysicsAttackPower = 10, nParry = 2, nPhysicsHit = 2, nPhysicsOvercome = 2}, --level 1	--15
	{DecriticalDamagePowerBase = 22, nPhysicsAttackPower = 17, nParry = 4, nPhysicsHit = 3, nPhysicsOvercome = 5}, --level 2	--20
	{DecriticalDamagePowerBase = 35, nPhysicsAttackPower = 28, nParry = 7, nPhysicsHit = 6, nPhysicsOvercome = 8}, --level 3	--30
	{DecriticalDamagePowerBase = 47, nPhysicsAttackPower = 40, nParry = 9, nPhysicsHit = 8, nPhysicsOvercome = 10}, --level 4	--40
	{DecriticalDamagePowerBase = 60, nPhysicsAttackPower = 52, nParry = 12, nPhysicsHit = 10, nPhysicsOvercome = 13}, --level 5	--50
	{DecriticalDamagePowerBase = 72, nPhysicsAttackPower = 62, nParry = 15, nPhysicsHit = 12, nPhysicsOvercome = 16}, --level 6	--60
	{DecriticalDamagePowerBase = 85, nPhysicsAttackPower = 74, nParry = 17, nPhysicsHit = 14, nPhysicsOvercome = 19}, --level 7	--70
	{DecriticalDamagePowerBase = 98, nPhysicsAttackPower = 87, nParry = 20, nPhysicsHit = 16, nPhysicsOvercome = 22}, --level 8	--80
	{DecriticalDamagePowerBase = 110, nPhysicsAttackPower = 97, nParry = 23, nPhysicsHit = 19, nPhysicsOvercome = 25}, --level 9	--90
	{DecriticalDamagePowerBase = 244, nPhysicsAttackPower = 302, nParry = 50, nPhysicsHit = 42, nPhysicsOvercome = 56}, --level 9	--100
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	--抗摔
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

	--全威胁值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
	);

	--设定最大怒气上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_RAGE,
		100,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_ENERGY,
		100,
		0
	);
	--增加 身法-外功1.7AP 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.AGILITY_TO_PHYSICS_ATTACK_POWER_COF,
		1741,
		0
	);
	--增加 身法-招架等级0.1加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.AGILITY_TO_PARRY_COF,
		102,
		0
	);
	--增加 身法-拆招值1加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.AGILITY_TO_PARRY_VALUE_COF,
		1024,
		0
		);
	--气血最大值提升
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
		);
	--[[
	--体质加蓝上限
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		1536,
		0
		);
	--]]
	--外功AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_BASE,
		tSkillData[dwSkillLevel].nPhysicsAttackPower,
		0
	);

	--外功命中
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_HIT_VALUE,
		tSkillData[dwSkillLevel].nPhysicsHit,
		0
	);
	--招架等级提高
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PARRY_BASE,
		tSkillData[dwSkillLevel].nParry,
		0
	);
	--外功破防等级提高(1)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_OVERCOME_BASE, --  外功破防
		tSkillData[dwSkillLevel].nPhysicsOvercome,
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

	skill.AddAttribute( --盾飞打断
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- 技能事件1219打断
		1219,
		0
	);

	--短期禁止怒气自动消耗
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1236,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/苍云/套路及子技能/内功_分山劲.lua",
		0
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 339);
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
	player.LearnSkillLevel(13149, skill.dwLevel, player.dwID)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(player.dwID, player.nLevel, 8454, 1)
	player.SetTimer(16,"scripts/skill/苍云/套路及子技能/内功_分山劲.lua",0,0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(8454, 1) then
		player.DelBuff(8454, 1)
	end

	if player.GetBuff(8395, 1) then
		player.DelBuff(8395, 1)
	end

	if player.GetBuff(8571, 1) then
		player.DelBuff(8571, 1)
	end
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
	if player.IsFormationLeader() then
		player.CastSkill(13275,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com