---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/秘笈/《霓裳羽衣·上元点鬟》人偶图断篇.lua
-- 更新时间:	2013/5/11 14:01:06
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
	--skill.SetBuffRecipe(1, 10, 1);--增加治疗效果7%
	skill.nChannelInterval = skill.nChannelInterval * 1.07 ; 	
    

	
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