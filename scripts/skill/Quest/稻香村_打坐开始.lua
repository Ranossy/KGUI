--�����Եؼ������Ƿ��ڴ��������������״̬�������������������\
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 803
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex and player.nCurrentLife >= player.nMaxLife then
		local buff = player.GetBuff(103, 0)
		if buff and (not player.GetQuestFailedFlag(nQuestIndex)) then
			player.SetQuestValue(nQuestIndex, 0, 1)
			player.DelBuff(482, 1)
		end
	end
end
		
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com