---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/ǧ����/������_������.lua
-- ����ʱ��:	2015/8/8 17:32:25
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<

function Apply(dwCharacterID)

end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)

	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local nQuestID = 14020 --������
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestFailedFlag(nQuestIndex, true)
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 6697), 3)
		player.SendSystemMessage(GetEditorString(8, 6698))
	end
	--player.SetModelID(0)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com