------------------------------------------------
-- 文件名    :  万花_好梦_春泥加减伤1.lua
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
	{ nTherapyBase = 417, 	nTherapyRand = 40, 	nCostMana = 104 * 1.2},
};


--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    
  	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- 属性作用模式
  		ATTRIBUTE_TYPE.SKILL_THERAPY,									-- 魔法属性
  		tSkillRecipeData[nRecipeLevel].nTherapyBase,							--属性值1
  		0																--属性值2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- 属性作用模式
  		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,								-- 魔法属性
  		tSkillRecipeData[nRecipeLevel].nTherapyRand ,							--属性值1
  		0																--属性值2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- 属性作用模式
  		ATTRIBUTE_TYPE.CALL_THERAPY,									-- 魔法属性
  		0,																--属性值1
  		0																--属性值2
 		);
     skill.nChannelInterval	= skill.nChannelInterval + 32; 
		skill.SetBuffRecipe(1,49, 1);
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