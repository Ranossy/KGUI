---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/���ִ�_����buff��ʧ����ʧ��.lua
-- ����ʱ��:	2014/7/14 22:39:26
-- �����û�:	zhangtianhui1
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nQuest = 844
	local nQuestIndex = player.GetQuestIndex(nQuest)
	local nQuestPhase = player.GetQuestPhase(nQuest)
	if nQuestPhase == 1 then
		player.SetQuestFailedFlag(nQuestIndex, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com