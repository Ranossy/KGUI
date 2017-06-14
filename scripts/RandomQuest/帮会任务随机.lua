---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/帮会任务随机.lua
-- 更新时间:	10/14/11 11:55:07
-- 更新用户:	LILIN1-PC
-- 脚本说明:	
----------------------------------------------------------------------<


function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	-- 增删时，需同步scripts/Map/帮会领地/quest/帮会任务通用.lua
	local tQuestList = {	-- 任务NPC为Key，修改任务或任务顺序必须同步修改player.lh中SetPlayerTongRandomQuest()
		[10214] = {11999, 12004, 12005, 12000, 12001}, 	-- 周而复始第一重，小葵击杀任务
		[7725] = {12006, 12009, 12007, 12002, 12003}, 		-- 周而复始第三重，何非悬赏任务
		[10986] = {6570, 6571, 6572, 6573, 6574, 6583}, 	-- 周而复始第四重，恶人谷（击杀浩气BOSS）
		[10217] = {6584, 6576, 6581, 6578, 6579, 11191}, 	-- 周而复始第四重，浩气盟（击杀恶人BOSS）
	}
	
	if not tQuestList[dwNpcTemplateID] or #tQuestList[dwNpcTemplateID] == 0 then
		Log("TongQuestRandomError~!")
		return 0
	end
	
	local nWeekth = OnGetTongRandomWeekth(#tQuestList[dwNpcTemplateID])
	return nWeekth
end

function OnGetTongRandomWeekth(nCount)
	local nDailyOffset = 7 * 3600
	local nCycleOffset = 7 * 24 * 3600
	local nLineTime	 = DateToTime(2011, 10, 10, 0, 0, 0) + nDailyOffset
	local nNowTime	 = GetCurrentTime()	
	local nWeekth = math.floor((nNowTime - nLineTime) / nCycleOffset) % nCount + 1
	
	return math.max(1, nWeekth)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com