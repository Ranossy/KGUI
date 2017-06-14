---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/秘笈/七秀_双鸾_翔鸾舞柳效果.lua
-- 更新时间:	2013/5/11 12:22:50
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_双鸾_翔鸾舞柳效果.lua
-- 创建人    :  zhanghao
-- 创建时间  :  2011-04-16
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
	{nTherapy = 40 * 0.95, nTherapyRand = 40 * 0.1, nTherapyPowerPercent = 51 * 2}, 
	{nTherapy = 64 * 0.95, nTherapyRand = 64 * 0.1, nTherapyPowerPercent = 102 * 2}, 
	{nTherapy = 86 * 0.95, nTherapyRand = 86 * 0.1, nTherapyPowerPercent = 153 * 2}, 
	{nTherapy = 109 * 0.95, nTherapyRand = 109 * 0.1, nTherapyPowerPercent = 108 * 2},
	{nTherapy = 132 * 0.95, nTherapyRand = 132 * 0.1, nTherapyPowerPercent = 129 * 2},
	{nTherapy = 156 * 0.95, nTherapyRand = 156 * 0.1, nTherapyPowerPercent = 149 * 2},
	{nTherapy = 178 * 0.95, nTherapyRand = 178 * 0.1, nTherapyPowerPercent = 170 * 2},
};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6249,
		3
	);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_THERAPY,						-- 治疗基础值
	--tSkillRecipeData[dwSkillLevel].nTherapy, 
	--0
	--);
		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,					-- 治疗浮动值
	--tSkillRecipeData[dwSkillLevel].nTherapyRand, 
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	--ATTRIBUTE_TYPE.CALL_THERAPY,						-- Call治疗
	--0, 
	--0
	--);
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