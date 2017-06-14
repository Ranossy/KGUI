---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明尊_净世破魔击日仇恨.lua
-- 更新时间:	2017/3/19 22:20:59
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :
-- 创建人    :  zhx
-- 创建时间  :  20120924
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

	if skill.dwSkillID == 4483 or  skill.dwSkillID == 4484 or  skill.dwSkillID == 4485 or  skill.dwSkillID == 4486 or  skill.dwSkillID == 4487 or  skill.dwSkillID == 4488 or  skill.dwSkillID == 4489 or  skill.dwSkillID == 4490 then	--日最高9重
		skill.nBaseThreat = 315 + skill.dwLevel * 300 + 824 / 32 * skill.dwLevel;
	end

	if skill.dwSkillID == 4476 then	---月最高9重
		skill.nBaseThreat = 105 + skill.dwLevel * 100 + 824 / 32 * skill.dwLevel;
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