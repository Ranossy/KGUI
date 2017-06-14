---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/霸刀/秘笈/霸刀_沉秋风_增加跳数.lua
-- 更新时间:	2016/8/17 15:01:42
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{

};

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 16096 or skill.dwSkillID == 16387 or skill.dwSkillID == 16438 then
		skill.SetBuffRecipe(1, 126, 1);
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