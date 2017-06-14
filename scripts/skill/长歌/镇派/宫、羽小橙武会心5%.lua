---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/镇派/宫、羽小橙武会心5%.lua
-- 更新时间:	2015/10/23 16:32:14
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<

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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE_BASE_RATE,
		500,
		0
	);
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