------------------------------------------------
-- 文件名    :  《千劫万毒手·百足》真传残页.lua
-- 创建人    :  zhengkaifeng
-- 创建时间  :  2011-05-08
-- 用途(模块):  武功技能
-- 武功门派  :  五毒
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  增加AOE距离
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
    local nRecipeLevel	= SkillRecipeLevel;
	
	if SkillRecipeID == 771 then			-- 残页
		skill.nAreaRadius = skill.nAreaRadius + 64
	elseif SkillRecipeID == 772 then		-- 断篇
		skill.nAreaRadius = skill.nAreaRadius + 128
	elseif SkillRecipeID == 773 then		-- 绝章
		skill.nAreaRadius = skill.nAreaRadius + 64
	end

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