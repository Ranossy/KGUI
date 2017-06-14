---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/秘笈/回蓝600.lua
-- 更新时间:	2013/9/3 14:31:45
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_掠如火_迫.lua
-- 创建人    :  张奇
-- 创建时间  :  2008-08-30
-- 用途(模块):  武功技能
-- 武功门派  :  少林
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  
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

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	--skill.BindBuff(2,884,1)---HOT
	if skill.dwSkillID ~= 565 and skill.dwSkillID ~= 2707 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
			8020,
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