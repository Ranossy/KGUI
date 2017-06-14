------------------------------------------------
-- 文件名    :  基础系_减少后翻技能的CD.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2009-6-6
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  : 
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  基础系_减少后翻技能的CD
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = -7, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamage = -14, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamage = -21, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamage = -28, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamage = -35, nDamageRand = 0, nCostMana = 0},		--level 5	

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ADD_SPRINT_POWER_COST_ON_WALL,
		tSkillData[dwSkillLevel].nDamage,
		0
	);
	
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com