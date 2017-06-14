---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/个人贸易时间控制.lua
-- 更新时间:	2014/4/22 15:04:00
-- 更新用户:	lilin-kingsoft
-- 脚本说明:
----------------------------------------------------------------------<

function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)	
	--[[local nTime = GetCurrentTime()
	local tTime = TimeToDate(nTime)
	if tTime.hour < 2 or tTime.hour >= 10 then
		return 1
	end
	
	return 0--]]
	return 1
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com