----------------------------------------------
-- �ű��ļ���client\scripts\skill\Quest\�򻨹�_ȫ�����.lua
----------------------------------------------

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
		if IsPlayer(nCharacterID) then
				local player = GetPlayer(nCharacterID)
				if player then
					local nQuestID = 3019
					local nQuestIndex = player.GetQuestIndex(nQuestID)
					if player.GetQuestPhase(nQuestID) == 1 and nQuestIndex and player.nCurrentLife == 1 then
						player.SetQuestFailedFlag(nQuestIndex, 1)
					end
				end
		end		
end	

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com