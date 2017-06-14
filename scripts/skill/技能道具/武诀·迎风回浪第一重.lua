---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/武诀·迎风回浪第一重.lua
-- 更新时间:	08/09/09 18:34:58
-- 更新用户:	wujuan
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player)
	local nSkillLevel = player.GetSkillLevel(9004)
	
	if nSkillLevel == 0 then
		player.LearnSkill(9004)
		return false, true
	end
	if nSkillLevel >= 1 then
		player.SendSystemMessage(SKILL_STRING_TABLE[21111])
		return false, false
	end
	return false, false
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com