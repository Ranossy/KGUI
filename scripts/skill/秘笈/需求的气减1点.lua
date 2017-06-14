---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/秘笈/需求的气减1点.lua
-- 更新时间:	2013/9/9 16:10:25
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  秘笈-增加命中2分.lua
-- 创建人    :  CBG
-- 创建时间  :  2009-08-04
-- 用途(模块):  武功技能
-- 武功门派  :  通用
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  增加命中2%
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{	
	{ HitPecent = 200}, --2%

};

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local nRecipeLevel = SkillRecipeLevel;
	skill.nNeedAccumulateCount = skill.nNeedAccumulateCount - 2;
		
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