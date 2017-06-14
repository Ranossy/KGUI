---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Default.lua
-- 更新时间:	2013/9/9 16:05:17
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  王洋	
-- 创建时间	:  2007-12-11
-- 效果备注	:  默认的技能脚本
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

	skill.nBaseThreat = skill.dwLevel * 200;

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