---------------------------------------------------
-- �ű��ļ���scripts\skill\Quest\���˹�_�����Ĵ���һ.lua
---------------------------------------------------

local nQuestID = 191

-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex then
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex then
		player.SetQuestValue(nQuestIndex, 0, 0)
	end	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com