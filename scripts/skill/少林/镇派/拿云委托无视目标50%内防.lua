------------------------------------------------
-- 创建人    :  CBG
-- 创建时间  :  2011-04-02
-- 用途(模块):  武功技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
	local nRecipeLevel = SkillRecipeLevel;
	if skill.dwSkillID == 3833  or skill.dwSkillID == 3842 or skill.dwSkillID == 3845 or skill.dwSkillID == 3836 or
		skill.dwSkillID == 3843 or skill.dwSkillID == 3846 or skill.dwSkillID == 3839 or skill.dwSkillID == 3844 or
		skill.dwSkillID == 3847 or skill.dwSkillID == 13681 or skill.dwSkillID == 13682 or skill.dwSkillID == 13683 or
		skill.dwSkillID == 13684 or skill.dwSkillID == 13685 or skill.dwSkillID == 13686 or skill.dwSkillID == 3848 or
		skill.dwSkillID ==3849 or skill.dwSkillID ==3850 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SOLAR_MAGIC_SHIELD_PERCENT,
        -512, 
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