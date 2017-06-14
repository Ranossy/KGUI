------------------------------------------------
-- 文件名    :  增加会心后伤害
-- 创建人    :  CBG
-- 创建时间  :  2011-03-31
-- 用途(模块):  武功技能
-- 武功门派  :  通用
-- 武功类型  :  秘笈
-- 武功套路  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
	{ CriticalPecent = 200},

};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local nRecipeLevel	= SkillRecipeLevel;

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,				
	66,
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.MAGIC_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,				
	66,
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.PHYSICS_CRITICAL_STRIKE_BASE_RATE,
        333, 
        0
    );

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE,
        333, 
        0
    );
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