---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/秘籍/1347_《打狗棒法·拨狗朝天》人偶图断篇_会心回内力.lua
-- 更新时间:	2013/6/5 22:40:22
-- 更新用户:	yule
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  zhx
-- 创建时间  :  20121008
-- 技能名称  :  明教秘笈
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
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1082,
		0
	);
   		
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