---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/秘笈/雪满天山_外功会心提高3.lua
-- 更新时间:	2013/4/26 10:38:01
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  云飞玉皇_外功会心提高1.lua
-- 创建人    :  zhanghao
-- 创建时间  :  2011-04-01
-- 用途(模块):  武功技能
-- 武功门派  :  藏剑
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  藏剑秘笈
-- 技能效果  :  
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/藏剑/秘笈/雪满天山_外功会心提高3.lua", -- 属性值1
		0														-- 属性值2
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5959) == 1 then
		if player.GetKungfuMount().dwSkillID == 10145 then
			player.AddBuff(dwCharacterID, player.nLevel, 2701, 3, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com