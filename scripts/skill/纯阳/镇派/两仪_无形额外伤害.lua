------------------------------------------------
-- 创建人    :  郑海星
-- 创建时间  :  20111111
 
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{

};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    
    ---从1豆到10豆的两仪化形
    if skill.dwSkillID == 317 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3449,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 318 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3450,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 319 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3451,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 320 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3452,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 321 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3453,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 456 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3454,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 457 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3455,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 458 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3456,												
 		nRecipeLevel										
 		);
    end
    if skill.dwSkillID == 459 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3457,												
 		nRecipeLevel										
 		);
    end               
    if skill.dwSkillID == 460 then
  	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								
 		3458,												
 		nRecipeLevel										
 		);
    end       
    return
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