---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/95级声望相关/阴山大草原_摔跤比试_回风落叶.lua
-- 更新时间:	2015/10/15 17:05:40
-- 更新用户:	jiangzhefei1
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = {
	{nDamageBase = 10000, nDamageRand = 3000, nCostMana = 0}, --level 1
	{nDamageBase = 16181, nDamageRand = 4854, nCostMana = 0}, --level 2
	{nDamageBase = 22361, nDamageRand = 6708, nCostMana = 0}, --level 3
	{nDamageBase = 28542, nDamageRand = 8563, nCostMana = 0}, --level 4
	{nDamageBase = 34722, nDamageRand = 10417, nCostMana = 0}, --level 5
	{nDamageBase = 40903, nDamageRand = 12271, nCostMana = 0}, --level 6
	{nDamageBase = 47083, nDamageRand = 14125, nCostMana = 0}, --level 7
	{nDamageBase = 53264, nDamageRand = 15979, nCostMana = 0}, --level 8
	{nDamageBase = 59444, nDamageRand = 17833, nCostMana = 0}, --level 9
	{nDamageBase = 65625, nDamageRand = 19688, nCostMana = 0}, --level 10
	{nDamageBase = 131250, nDamageRand = 39375, nCostMana = 0}, --level 11
}

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		--ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		---1024,
		--0
	--);

	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		--ATTRIBUTE_TYPE.PHYSICS_OVERCOME_PERCENT,
		---1024,
		--0
	--);

	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		--10159,
		--2
	--);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DAMAGE_TO_LIFE_FOR_SELF,
		-1024,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);

	-- 击退目标
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_REPULSED,
	--tSkillData[dwSkillLevel].nTime, -- 时间
	--0
	--);

	skill.nWeaponDamagePercent = 0		--去除武器影响

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD
	--skill.SetNormalCoolDown(1, 929);	--CD5秒
	--skill.SetNormalCoolDown(1, 116);				--自身CD25秒
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.MIDDLE

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 85; 										--施放角度120°

	--skill.nAreaRadius 		= 4 * LENGTH_BASE;							--作用范围
	--skill.nTargetCountLimit = 8											--最多8个单位

	--skill.nPrepareFrames  = 0;										--吟唱帧数,16帧等于1秒

	--skill.nBulletVelocity = 12;										--子弹速度,点/帧

	--skill.nBreakRate      = 1024;										--被打断的概率,默认1024表示一定被打断

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
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com