---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/����-����.lua
-- ����ʱ��:	2014/7/9 11:18:53
-- �����û�:	zhengfeng4
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	if not player.GetQuestIndex(9830) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 6891), 3)
		player.SendSystemMessage(GetEditorString(6, 6891))
		return 0
	end
	return 1
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com