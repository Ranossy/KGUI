------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2009-03-24
-- Ч����ע	:  �򻨳����õ��߼��ܻص��ű�
------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/Math.lh")
Include("scripts/Include/Npc.lh")

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 176
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	
	local nQuestID1 = 8249
	local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
	local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
	if nQuestIndex then 	
		if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 1 then
			if player.GetQuestValue(nQuestIndex, 1) < 1 then
				player.SetQuestValue(nQuestIndex, 1, 1)
			end
		elseif player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 4 then
			if Random(10) <= 6 then
				if player.GetQuestValue(nQuestIndex, 1) < 1 then
					player.SetQuestValue(nQuestIndex, 1, 1)
				end
			end
		end
	end 
	
	if nQuestIndex1 then 
		if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 1 then
			if player.GetQuestValue(nQuestIndex1, 1) < 1 then
				player.SetQuestValue(nQuestIndex1, 1, 1)
			end
		elseif player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 530) <= 4 then
			if Random(10) <= 6 then
				if player.GetQuestValue(nQuestIndex1, 1) < 1 then
					player.SetQuestValue(nQuestIndex1, 1, 1)
				end
			end
		end
	end 
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com