---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/乱世天策-朱剑秋.lua
-- 更新时间:	2014/7/23 10:20:38
-- 更新用户:	zhengfeng4
-- 脚本说明:
----------------------------------------------------------------------<
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	if not player.GetQuestIndex(11185) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 6882), 3)
		player.SendSystemMessage(GetEditorString(6, 6882))
		return 0
	end
	local nCount = OnGetRandom(player, 4)
	return nCount
end

function OnGetRandom(player, nCount)
	local n = player.GetRandomDailyQuestFinishedCount(329) + 1
	if n >= nCount then
		n = nCount
	end
	return math.max(1, n)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com