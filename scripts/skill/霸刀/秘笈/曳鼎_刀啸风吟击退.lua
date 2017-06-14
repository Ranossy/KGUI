---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/霸刀/秘笈/曳鼎_刀啸风吟击退.lua
-- 更新时间:	2016/9/12 20:50:30
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{
	{ CriticalPecent = 200},

};

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)
	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 16610 or skill.dwSkillID == 16611 or skill.dwSkillID == 16612 or skill.dwSkillID == 16613 or skill.dwSkillID == 16614 or skill.dwSkillID == 16811 or skill.dwSkillID == 16913 or skill.dwSkillID == 16914 or skill.dwSkillID == 16915 or skill.dwSkillID == 16916 or skill.dwSkillID == 16917 or skill.dwSkillID == 16918 then
		--print(skill.dwSkillID)
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_REPULSED,
			13, --滑步时间(帧)
			0
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