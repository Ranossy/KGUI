----------------------------------------------
-- �ű��ļ������\skill\׽������ʱ�䵽.lua
----------------------------------------------
-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)


end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)

	local nQuestID = 988
	
	
	local player = GetPlayer(dwCharacterID)

	local QuestIndex = player.GetQuestIndex(nQuestID)
	
	player.SetQuestValue(QuestIndex,1,0)
	
end	

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com