----------------------------------------------
-- �ű��ļ�����ˮ��\skill\ͨ������_��.lua
----------------------------------------------
-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
--function Apply(dwCharacterID)
--end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if IsPlayer(nCharacterID) then
		if nLeftFrame == 0 then
		else
			local nQuestID = 1709
			local player = GetPlayer(nCharacterID)
			if player then
				if player.GetQuestPhase(nQuestID) == 1 then
					local nQuestIndex = player.GetQuestIndex(nQuestID)
					if player.GetQuestValue(nQuestIndex, 0) ~= 1 then
						if not player.GetQuestFailedFlag(nQuestIndex) then
							player.SetQuestFailedFlag(nQuestIndex, 1)
						end
					end
				end
			end
		end
	end
end	

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com