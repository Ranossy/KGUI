---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/江湖·蹑云逐月.lua
-- 更新时间:	08/08/09 16:34:59
-- 更新用户:	suntao
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player)
    local nSkillLevel = player.GetSkillLevel(9003)
        
	if nSkillLevel == 0 then
	   player.LearnSkill(9003)
	   player.LearnSkill(9003)
	   player.LearnSkill(9003)
	   return false, true
	end
	if nSkillLevel == 1 then
		player.LearnSkill(9003)
		player.LearnSkill(9003)
		return false, true
	end
	
	if nSkillLevel == 2 then
	    player.LearnSkill(9003)
	    return false, true
	end
	
	if nSkillLevel >= 3 then
		player.SendSystemMessage(SKILL_STRING_TABLE[21109])
	   return false, false
	end
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com