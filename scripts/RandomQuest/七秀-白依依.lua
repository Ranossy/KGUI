---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/����-������.lua
-- ����ʱ��:	2014/7/9 11:07:48
-- �����û�:	zhengfeng4
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)
	if not player.GetQuestIndex(9825) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 6889), 3)
		player.SendSystemMessage(GetEditorString(6, 6889))
		return 0
	end
	return 1
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com