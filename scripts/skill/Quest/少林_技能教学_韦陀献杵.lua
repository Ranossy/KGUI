--����ڽ�ѧ������ʩ���ͻ���ɽ����
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(780, 1)

	if buff and buff.nStackNum >= 50 then
		local nQuestID = 3105
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		if nQuestIndex and not player.GetQuestFailedFlag(nQuestIndex) then
			player.SetQuestValue(nQuestIndex, 0, 1)
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com