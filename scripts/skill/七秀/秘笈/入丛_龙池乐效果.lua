------------------------------------------------
-- 文件名    :  七秀_入丛_龙池乐效果.lua
-- 创建人    :  张豪
-- 创建时间  :  2011-04-06
------------------------------------------------


--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
		{nBuffRecipeID = 82},
		{nBuffRecipeID = 83},
};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    local dwSkillLevel = skill.dwLevel;	

	if nRecipeLevel == 1 then 
	
   	skill.AddAttribute(													
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						
 		ATTRIBUTE_TYPE.CALL_BUFF,								
 		3459,												
 		dwSkillLevel										
 		);
		
		skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
		"skill/七秀/秘笈/龙池乐加蓝1.lua",				-- 属性值1
		0														-- 属性值2
		);
	end
	
 	if nRecipeLevel == 2 then 
 		

 		
		skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
		"skill/七秀/秘笈/龙池乐加蓝2.lua",				-- 属性值1
		0														-- 属性值2
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