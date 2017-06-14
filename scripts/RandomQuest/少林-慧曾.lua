---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/少林-慧曾.lua
-- 更新时间:	2014/7/9 11:18:53
-- 更新用户:	zhengfeng4
-- 脚本说明:
----------------------------------------------------------------------<
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	if not player.GetQuestIndex(9830) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 6891), 3)
		player.SendSystemMessage(GetEditorString(6, 6891))
		return 0
	end
	return 1
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com