---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/ݶ��ʥ��_��������������ͷ��ʾ.lua
-- ����ʱ��:	2012-8-10 10:52:54
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	if tplayer.GetQuestPhase(8706) == 0 or tplayer.GetQuestPhase(8706) == 1 then
		--tplayer.SendSystemMessage("����ͨ��Ч���������á����Զ����������ر���ʽ��ͷ")
		RemoteCallToClient(tplayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(4, 1088), 3)
		tplayer.SendSystemMessage(GetEditorString(4, 1088))
		tplayer.ForceFinishQuest (8706)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com