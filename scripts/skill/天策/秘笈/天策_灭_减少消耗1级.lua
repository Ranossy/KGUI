------------------------------------------------
-- 文件名    :  秘笈-天策_灭_减少消耗1级.lua
-- 创建人    :  	
-- 创建时间  :  2009-01-17
-- 用途(模块):  武功技能
-- 武功门派  :  通用
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  灭,减少消耗1级
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
	{nCostMana = 0, nDamage = 198*0.8, nDamageRand = 198*0.4, nCostLife = -149*0.05},		-- Level 1	42
	{nCostMana = 0, nDamage = 230*0.8, nDamageRand = 230*0.4, nCostLife = -172*0.05},		-- Level 2  48
	{nCostMana = 0, nDamage = 261*0.8, nDamageRand = 261*0.4, nCostLife = -196*0.05},		-- Level 3  54
	{nCostMana = 0, nDamage = 293*0.8, nDamageRand = 293*0.4, nCostLife = -219*0.05},		-- Level 4  60
	{nCostMana = 0, nDamage = 324*0.8, nDamageRand = 324*0.4, nCostLife = -243*0.05},		-- Level 5  66
};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local nRecipeLevel	= SkillRecipeLevel;
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	local nSkillID	= skill.dwSkillID
--	if nSkillID == 716 or nSkillID == 717 then
--		skill.AddAttribute(
--			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
--			tSkillData[dwSkillLevel].nCostLife, 
--			0
--		);
--	end
	if nSkillID == 716 or nSkillID == 717 then
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.GLOBAL_RESIST_PERCENT,
		51, 
		0
	);
	end


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