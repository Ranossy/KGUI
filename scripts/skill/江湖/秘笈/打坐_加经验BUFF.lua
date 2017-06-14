------------------------------------------------
-- 文件名    :  打坐_加经验BUFF.lua
-- 创建人    :  CBG
-- 创建时间  :  2009-07-10
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  打坐
-- 技能效果  :  调个脚本，场景组加经验BUFF用
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
   		"Map/天策/skill/打坐_练功房.lua",					-- 属性值1
   		0															-- 属性值2
   		);
	
    return true;
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com