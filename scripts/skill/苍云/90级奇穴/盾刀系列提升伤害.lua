---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/90级奇穴/无视目标30%外防.lua
-- 更新时间:	2015/9/25 9:18:10
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;

	if skill.dwSkillID == 13044 then
		skill.nChannelInterval = skill.nChannelInterval * 1.05
	elseif skill.dwSkillID == 13244 then
		skill.nChannelInterval = skill.nChannelInterval * 1.1
	elseif skill.dwSkillID == 13060 then
		skill.nChannelInterval = skill.nChannelInterval * 1.15
	elseif skill.dwSkillID == 13119 then
		skill.nChannelInterval = skill.nChannelInterval * 1.2
	end
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com