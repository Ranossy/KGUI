---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/唐门_内功_箭弩.lua
-- 更新时间:	2015/8/17 10:05:45
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nNeHit = 3, nPhysicsOvercome = 4, nPhysicsAttackPower = 10}, --15级
	{DecriticalDamagePowerBase = 22, nNeHit = 6, nPhysicsOvercome = 7, nPhysicsAttackPower = 16}, --20级
	{DecriticalDamagePowerBase = 35, nNeHit = 10, nPhysicsOvercome = 11, nPhysicsAttackPower = 26}, --30级
	{DecriticalDamagePowerBase = 47, nNeHit = 13, nPhysicsOvercome = 15, nPhysicsAttackPower = 37}, --40级
	{DecriticalDamagePowerBase = 60, nNeHit = 17, nPhysicsOvercome = 19, nPhysicsAttackPower = 48}, --50级
	{DecriticalDamagePowerBase = 72, nNeHit = 21, nPhysicsOvercome = 23, nPhysicsAttackPower = 58}, --60级
	{DecriticalDamagePowerBase = 85, nNeHit = 24, nPhysicsOvercome = 27, nPhysicsAttackPower = 69}, --70级
	{DecriticalDamagePowerBase = 98, nNeHit = 28, nPhysicsOvercome = 31, nPhysicsAttackPower = 81}, --80级
	{DecriticalDamagePowerBase = 110, nNeHit = 31, nPhysicsOvercome = 35, nPhysicsAttackPower = 90}, --90级
	{DecriticalDamagePowerBase = 244, nNeHit = 70, nPhysicsOvercome = 77, nPhysicsAttackPower = 281}, --95级
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
		"skill/唐门/唐门_内功_箭弩.lua",
		0
	);
	--增加 力道-外功AP 加成
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
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		936,
		2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		937,
		2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		938,
		2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		939,
		2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		940,
		2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		941,
		2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		942,
		2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
		);
	--力道提高1.45外功AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_ATTACK_POWER_COF,
		1485,
		0
		);
	--力道提高0.24会心
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_CRITICAL_STRIKE_COF,
		246,
		0
	);

	--增加 力道-0.08外功会心伤害 加成
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_CRITICAL_DAMAGE_POWER_COF,
		82,
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
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_HIT_VALUE, --外功命中
		tSkillData[nSkillLevel].nNeHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_OVERCOME_BASE, --  外功破防
		tSkillData[nSkillLevel].nPhysicsOvercome,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --外功AP
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_BASE,
		tSkillData[nSkillLevel].nPhysicsAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_ENERGY,
		100,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ENERGY_REPLENISH,
		10,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --梅花针打断后沉默内功
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		580,
		1
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

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD,SetNormalCoolDown(posi, id)设置技能CD,其中posi为CoolDown位(共3位),id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 493);
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

--对技能执行的特殊条件检查,该函数可以在开始施放技能的时候被调用,以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果,注意,最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态,以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数,参数skill为升级后的skill,第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end
	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 7 and player.GetSkillLevel(10230) < 1 then		--学习镇派套路
		player.LearnSkill(10230)
	end
	if player.GetSkillLevel(3373) < 1 then				--制造
		player.LearnSkill(3373)
	end
	if player.GetSkillLevel(3374) < 1 then
		player.LearnSkill(3374)
	end
	--player.LearnSkill(3204);
	player.LearnSkillLevel(3204, dwSkillLevel, player.dwID)
	player.LearnSkill(3210);
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/唐门/唐门_内功_箭弩.lua",0,0)
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
		player.CastSkill(3216,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com