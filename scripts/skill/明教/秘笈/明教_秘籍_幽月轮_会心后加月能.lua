------------------------------------------------
-- 文件名    :  纯阳秘笈.lua
-- 创建人    :  王洋
-- 创建时间  :  2009-01-21
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  纯阳秘笈
-- 技能效果  :  
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
	
	if skill.dwSkillID == 4024 then
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		763,															
		1
			);
	end
	
	if skill.dwSkillID == 4025 then	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		764,															
		1
			);
	end
	
	if skill.dwSkillID == 4026 then	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		765,															
		1
			);
	end

	if skill.dwSkillID == 13663 then
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1240,															
		1
			);
	end
	
	if skill.dwSkillID == 13664 then	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1241,															
		1
			);
	end
	
	if skill.dwSkillID == 13665 then	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1242,															
		1
			);
	end
	if skill.dwSkillID == 13666 then
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1243,															
		1
			);
	end
	
	if skill.dwSkillID == 13667 then	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1244,															
		1
			);
	end
	
	if skill.dwSkillID == 13668 then	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1245,															
		1
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