------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-6-1
-- 效果备注	:  默认的技能脚本
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
	local nRecipeLevel = SkillRecipeLevel;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
		"skill/五毒/90级奇穴/蛇影AOE.lua",				-- 属性值1
		0														-- 属性值2
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
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSrcID)
	local cPlayer = GetPlayer(dwSrcID)
	if not cPlayer then
		return
	end
	local tPlayer = GetPlayer(dwCharacterID)
	if tPlayer then
		if tPlayer.GetBuff(2307, 1) or tPlayer.GetBuff(10118, 1) then
			cPlayer.CastSkill(6631,1)
		end
	end
	local npc = GetNpc(dwCharacterID)
	if npc then
		if npc.GetBuff(2307, 1) or npc.GetBuff(10118, 1) then
			cPlayer.CastSkill(6631,1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com