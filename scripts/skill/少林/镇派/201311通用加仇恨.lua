---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/镇派/201311通用加仇恨.lua
-- 更新时间:	2013/11/20 11:50:45
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  韦陀献杵倒地.lua
-- 创建人    :  CBG
-- 创建时间  :  2011-04-02
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
	local nPDLevel = skill.dwLevel
	if skill.dwSkillID == 232 then
		skill.nBaseThreat = skill.nBaseThreat + 6000;
	end
	if skill.dwSkillID == 233 then
		skill.nBaseThreat = skill.nBaseThreat + 12000
	end
	if skill.dwSkillID == 211 then
		skill.nBaseThreat = skill.nBaseThreat + 3000
	end
	if skill.dwSkillID == 212 then
		skill.nBaseThreat = skill.nBaseThreat + 6000
	end
	if skill.dwSkillID == 213 then
		skill.nBaseThreat = skill.nBaseThreat + 9000
	end
	if skill.dwSkillID == 235 then
		skill.nBaseThreat = skill.nBaseThreat + 15000
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