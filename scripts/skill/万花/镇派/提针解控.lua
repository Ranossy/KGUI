---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/镇派/提针解控.lua
-- 更新时间:	2013/6/7 23:02:53
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_好梦_春泥加减伤3.lua
-- 创建人    :  zhanghao
-- 创建时间  :  2011-04-05
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  万花秘笈
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF, -- 魔法属性
		4, -- 属性值1
		10000															-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF, -- 魔法属性
		6, -- 属性值1
		10000															-- 属性值2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF, -- 魔法属性
		8, -- 属性值1
		10000															-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF, -- 魔法属性
		10, -- 属性值1
		10000															-- 属性值2
	);   	
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.DETACH_SINGLE_BUFF, -- 魔法属性
		12, -- 属性值1
		10000															-- 属性值2
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	player.CastSkill(6713, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com