------------------------------------------------
-- 文件名    :  基础系_减少后翻技能的CD.lua
-- 创建人    :  zhangqi	
-- 创建时间  :  2009-6-6
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  : 
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  基础系_减少后翻技能的CD
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/经脉/基础系/基础系_减少后翻技能的CD.lua",
		0
	);
	
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	local dwSkillLevel = player.GetSkillLevel(89);
	if dwSkillLevel >0 then
		player.AddSkillRecipe(1306,dwSkillLevel);
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	local dwSkillLevel = player.GetSkillLevel(89);
	for i = 1, 10 do 
		if player.IsSkillRecipeExist(1306,i) then
			player.DelSkillRecipe(1306,i);
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com