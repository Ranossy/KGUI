---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/秘笈/烽火_破风加仇恨.lua
-- 更新时间:	2013/6/8 15:54:57
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  烽火_破风加仇恨.lua
-- 创建人    :  zhanghao
-- 创建时间  :  2011-04-10
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  天策秘笈
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 259    }, -- Level 1
	{nThreat = 389    }, -- Level 2
	{nThreat = 518    }, -- Level 3
	{nThreat = 648    }, -- Level 4
	{nThreat = 778    }, -- Level 5
	{nThreat = 907    }, -- Level 6
	{nThreat = 1037   }, -- Level 7
	{nThreat = 1166   }, -- Level 8
	{nThreat = 1296   }, -- Level 9
	{nThreat = 1426   }, -- Level 10
	{nThreat = 1705   }, -- Level 11	
	{nThreat = 1705   }, -- Level 12	
};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	local dwSkillLevel = skill.dwLevel
	if nRecipeLevel == 1 then
		skill.nBaseThreat = skill.dwLevel * 100;
	elseif nRecipeLevel == 2 then
		skill.nBaseThreat = skill.dwLevel * 200;
	elseif nRecipeLevel == 3 then
		skill.nBaseThreat = skill.dwLevel * 192;
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