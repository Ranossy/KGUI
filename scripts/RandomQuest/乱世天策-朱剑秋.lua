---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/�������-�콣��.lua
-- ����ʱ��:	2014/7/23 10:20:38
-- �����û�:	zhengfeng4
-- �ű�˵��:
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com