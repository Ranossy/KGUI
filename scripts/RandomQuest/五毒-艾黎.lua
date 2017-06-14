---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/�嶾-����.lua
-- ����ʱ��:	2014/7/9 11:14:18
-- �����û�:	zhengfeng4
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	if not player.GetQuestIndex(9829) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 6890), 3)
		player.SendSystemMessage(GetEditorString(6, 6890))
		return 0
	end
	local nCount = OnGetRandom(player, 5)
	return nCount
end

function OnGetRandom(player, nCount)
	local n = player.GetRandomDailyQuestFinishedCount(275) + 1
	if n >= nCount then
		n = nCount
	end
	return math.max(1, n)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com