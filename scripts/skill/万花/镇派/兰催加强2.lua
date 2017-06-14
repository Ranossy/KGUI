------------------------------------------------
-- 文件名    :  万花_兰摧玉折_增加跳数.lua
-- 创建人    :  王洋
-- 创建时间  :  2009-1-20
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  万花秘笈_延
-- 技能效果  :  增加商阳指dot的跳数
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
        "skill/万花/镇派/兰催加强2.lua", 			
        0
    );
	
    return true;
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
	local Num_Random = Random(1, 100)
	if Num_Random <= 30 then
		local nLevel = player.GetSkillLevel(190)
		if nLevel then
			local targetType, targetID = player.GetSkillTarget()
			if not targetID then
				return
			end
			if GetPlayer(targetID) then
				player.CastSkill(3037,nLevel,TARGET.PLAYER,targetID)
			end
			if GetNpc(targetID) then
				player.CastSkill(3037,nLevel,TARGET.NPC,targetID)
			end	
		end
	end		
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com