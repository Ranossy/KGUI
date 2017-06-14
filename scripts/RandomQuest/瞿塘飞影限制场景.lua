---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/瞿塘飞影限制场景.lua
-- 更新时间:	2015/11/27 15:14:00
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<
local tMapList = {
	[6] = true,
	[8] = true,
	[13] = true,
	[15] = true,
	[108] = true,
	[35] = true,
	[153] = true,
	[194] = true,
}
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	if not tMapList[player.GetMapID()] then
		return 0
	end
	local nHour = GetCurrentHour()
	local nWeekday = GetCurrentWeekDay()
	if nHour < 7 then--不到7点算前一天
		nWeekday = nWeekday - 1
		if nWeekday < 0 then
			nWeekday = 6
		end
	end
	if nWeekday == 3 or nWeekday == 5 or nWeekday == 6 or nWeekday == 0 then
		return 1
	end
	return 0
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com