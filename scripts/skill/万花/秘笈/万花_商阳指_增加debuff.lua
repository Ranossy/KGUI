---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/秘笈/万花_商阳指_增加debuff.lua
-- 更新时间:	2013/5/9 23:26:37
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_商阳指_增加debuff.lua
-- 创建人    :  王洋
-- 创建时间  :  2009-1-20
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  万花秘笈_延
-- 技能效果  :  增加商阳指dot的跳数
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
	if skill.dwSkillID == 189 or skill.dwSkillID == 3037 or skill.dwSkillID == 180 or skill.dwSkillID == 13849 or skill.dwSkillID == 13847 or skill.dwSkillID == 1862 or skill.dwSkillID == 3086 or skill.dwSkillID == 6134 or skill.dwSkillID == 6135  or skill.dwSkillID == 6140 or skill.dwSkillID == 6141 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_BUFF,
			886,
			1
		);
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