--����ڽ�ѧ������ʩ�Żط�ɨҶ����
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nQuestID = 3059
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex then
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
end
		
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com