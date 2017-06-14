---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_龙爪功_捕风式正常伤害.lua
-- 更新时间:	2015/9/28 15:09:08
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--附加仇恨暂定和技能伤害相等
tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, nDamageRand = 5}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55, nDamageRand = 6}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, nDamageRand = 7}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 67, nDamageRand = 7}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, nDamageRand = 8}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 79, nDamageRand = 9}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, nDamageRand = 9}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 91, nDamageRand = 10}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 97, nDamageRand = 10}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 103, nDamageRand = 11}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 109, nDamageRand = 12}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115, nDamageRand = 12}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 121, nDamageRand = 13}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 127, nDamageRand = 14}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133, nDamageRand = 14}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139, nDamageRand = 15}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, nDamageRand = 15}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 151, nDamageRand = 16}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 157, nDamageRand = 17}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 163, nDamageRand = 17}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 169, nDamageRand = 18}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 175, nDamageRand = 18}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 181, nDamageRand = 19}, -- Level 23
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase / 3,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand / 3,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
--加一点反击值
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		854,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/少林/少林_龙爪功_捕风式正常伤害.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD1秒
	--skill.SetNormalCoolDown(1, 73);
	--skill.SetCheckCoolDown(1, 444);
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 15; 				-- 通道技间隔时间
	--skill.nChannelInterval		= 48;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024

	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 25 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	skill.nWeaponDamagePercent = 0;
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 36*1.5*1.15*1.5;
	elseif dwSkillLevel < 23 then
		skill.nChannelInterval = (36 + (dwSkillLevel - 9) * 2)*1.5*1.15*1.5
	else
		skill.nChannelInterval = 77*1.5*1.15*1.5;     -- 通道技间隔时间
	end

	--skill.nChannelInterval = 77;
	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

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
function Apply(dwCharacterID, dwSkillSrcID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com