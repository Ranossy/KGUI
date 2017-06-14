---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/天道剑势_剑飞惊天.lua
-- 更新时间:	2016/5/11 20:49:44
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天道剑势_剑飞惊天.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  天道剑势
-- 技能名称  :  剑飞惊天
-- 技能效果  :  飞舞长剑，使目标直接受到外功伤害.
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 56, nDamageRand = 28, nCostMana = 130},
	{ nDamageBase = 70, nDamageRand = 35, nCostMana = 165},
	{ nDamageBase = 83, nDamageRand = 41, nCostMana = 200},
	{ nDamageBase = 96, nDamageRand = 48, nCostMana = 235},
	{ nDamageBase = 109, nDamageRand = 54, nCostMana = 270},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 5

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/纯阳/天道剑势_剑飞惊天.lua",
		0
	);

	skill.BindBuff(1, 1097, 1);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 86);
	skill.SetCheckCoolDown(1, 444)
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 119;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒

	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;		-- 技能被打断的概率.基数1024
	skill.nBreakRate = PERCENT_BASE;					-- 打断目标施法的概率,基数1024
	skill.nDismountingRate = PERCENT_BASE;					-- 将目标击落下马几率,基数1024，默认0

	skill.nWeaponDamagePercent = 0;					-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

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
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	ModityCDToUI(player, 310, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com