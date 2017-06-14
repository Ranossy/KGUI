---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/天道剑势_天地无极.lua
-- 更新时间:	2013/12/11 10:28:02
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天道剑势_天地无极.lua
-- 创建人    :  kingbeyond	
-- 创建时间  :  2007-12-11
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  外功
-- 武功套路  :  天道剑势
-- 技能名称  :  天地无极
-- 技能效果  :  对目标造成外功伤害。续气一格并使玄一无相和剑冲阴阳立刻生效。
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 36, nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 7}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 118, nDamageRand = 11}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 158, nDamageRand = 15}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 199, nDamageRand = 19}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 240, nDamageRand = 23}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280, nDamageRand = 28}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 321, nDamageRand = 32}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 362, nDamageRand = 36}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 403, nDamageRand = 40}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 443, nDamageRand = 44}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 484, nDamageRand = 48}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 525, nDamageRand = 52}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 565, nDamageRand = 56}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 606, nDamageRand = 60}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 647, nDamageRand = 64}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 687, nDamageRand = 69}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 728, nDamageRand = 73}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 769, nDamageRand = 77}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 810, nDamageRand = 81}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 850, nDamageRand = 85}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 891, nDamageRand = 89}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 932, nDamageRand = 93}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 972, nDamageRand = 97}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1013, nDamageRand = 101}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1054, nDamageRand = 105}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1095, nDamageRand = 110}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1135, nDamageRand = 114}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1176, nDamageRand = 118}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1217, nDamageRand = 122}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1257, nDamageRand = 126}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1298, nDamageRand = 130}, -- Level 32 
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		2592, -- 有双Debuff伤害，并且把玄一无相都加上
		dwSkillLevel
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		902, -- 剑冲阴阳无相buff，无玄一时施展，但是会把玄一无相都加上
		dwSkillLevel
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		903, -- 有玄一、没有无相伤害，但是会把玄一和无相都加上
		dwSkillLevel
	);
        
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		713, -- 无buff伤害，但是会把玄一和无相都加上
		dwSkillLevel
	);  
	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		--337, -- 属性值1
		--1													-- 属性值2
	--);
   	
	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- 魔法属性
		--338, -- 属性值1
		--1													-- 属性值2
	--);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--713, -- 无buff伤害
	--dwSkillLevel
	--);
	--skill.BindBuff(tSkillData[dwSkillLevel].nBuffID, tSkillData[dwSkillLevel].nBuffLevel)
	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 82);	--CD8s
	skill.SetCheckCoolDown(1, 444);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75;	-- 技能消耗的内力
	end

	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;					--技能施放最大半径
	skill.nAngleRange = 128; 									--施放角度
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	--skill.nBreakRate        = 1024;									--打断的概率,默认1024表示一定打断
	--skill.nWeaponDamagePercent		= 1024;					-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
    
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com