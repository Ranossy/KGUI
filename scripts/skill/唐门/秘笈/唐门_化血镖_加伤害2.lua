---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/秘笈/唐门_化血镖_加伤害2.lua
-- 更新时间:	2013/5/12 21:28:34
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  唐门秘籍
-- 创建人    :  郑海星
-- 创建时间  :  20110908
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
    
	--if skill.dwSkillID == 3125 or skill.dwSkillID == 3321  then 
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,					
	--352,
	--0
	--);
	--end
	
	--if skill.dwSkillID == 3126 or skill.dwSkillID == 3322 then
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.POISON_ATTACK_POWER_PERCENT,					
	--248,
	--0
	--);
	--end
	skill.nChannelInterval = skill.nChannelInterval * 1.04; 	
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