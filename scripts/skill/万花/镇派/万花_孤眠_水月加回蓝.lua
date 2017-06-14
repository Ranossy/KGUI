------------------------------------------------
-- 文件名    :  万花_自怨_长针加AP1.lua
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

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;

	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        	 ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        	"skill/万花/镇派/万花_孤眠_水月加回蓝.lua", 
        	0
    );

    return true
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

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
 if not IsPlayer(dwCharacterID) then
    return
 end
 local player = GetPlayer(dwCharacterID)
 	if player.GetSkillLevel(2639) == 1 then
 		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 5 / 100
  elseif player.GetSkillLevel(2639) == 2 then
 		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 10 / 100
  elseif player.GetSkillLevel(2639) == 3 then
 		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 15 / 100
 	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com