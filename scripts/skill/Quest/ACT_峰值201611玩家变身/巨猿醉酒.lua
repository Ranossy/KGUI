---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/ACT_峰值201611玩家变身/巨猿醉酒.lua
-- 更新时间:	2016/11/18 20:03:57
-- 更新用户:	qinfupi
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/ACT_峰值201611玩家变身/巨猿醉酒.lua", -- 属性值1
		0														-- 属性值2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		512,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		25000,
		0
	);

	skill.nWeaponDamagePercent = 0		--去除武器影响

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetNormalCoolDown(1, 1167);	--CD5秒
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.MIDDLE

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius		= 0											--技能施放最小半径
	skill.nMaxRadius = 6 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 128; 										--施放角度120°

	skill.nAreaRadius = 6 * LENGTH_BASE;							--作用范围
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