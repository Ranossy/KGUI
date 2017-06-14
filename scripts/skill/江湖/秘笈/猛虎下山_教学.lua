------------------------------------------------
-- 文件名    :  猛虎下山_教学.lua
-- 创建人    :  王洋	
-- 创建时间  :  2008-09-28
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  猛虎下山
-- 技能效果  :  调个脚本，教学任务用
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
	
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		"skill/Quest/稻香村_技能教学_猛虎下山.lua",					-- 属性值1
   		0															-- 属性值2
   		);
	
    return true;
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com