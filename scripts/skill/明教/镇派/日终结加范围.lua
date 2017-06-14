---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/镇派/日终结加范围.lua
-- 更新时间:	2013/6/4 10:19:00
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_倾城_剑舞效果.lua
-- 创建人    :  zhanghao
-- 创建时间  :  2011-04-14
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  七秀秘笈
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{
	{nBuffRecipeID = 86},
	{nBuffRecipeID = 87}
};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	--skill.nAreaRadius = skill.nAreaRadius + 4 * LENGTH_BASE
	if skill.dwSkillID == 4037 or skill.dwSkillID == 4483 or skill.dwSkillID == 4484 or skill.dwSkillID == 4485 or skill.dwSkillID == 4486 or skill.dwSkillID == 4487 or skill.dwSkillID == 4488 or skill.dwSkillID == 4488 or skill.dwSkillID == 4489 or skill.dwSkillID == 4490 then
		skill.nAngleRange = math.max(256, skill.nAngleRange)
	end
	if skill.dwSkillID == 4037 or skill.dwSkillID == 14701 or  skill.dwSkillID == 4969  then
		skill.nAreaRadius = math.max(skill.nAreaRadius, 15 * LENGTH_BASE)
		skill.nMaxRadius = math.max(skill.nMaxRadius, 15 * LENGTH_BASE)
		skill.nAngleRange = math.max(256, skill.nAngleRange)
	end
	--skill.SetBuffRecipe(1,tSkillRecipeData[nRecipeLevel].nBuffRecipeID,1);
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