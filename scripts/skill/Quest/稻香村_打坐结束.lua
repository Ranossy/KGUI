-- buff����ʧʱ��ִ�еĽű�
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 803
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestPhase == 1 then
		player.SetQuestFailedFlag(nQuestIndex, true)
	end
	player.SendSystemMessage(GetEditorString(2, 8038))
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com