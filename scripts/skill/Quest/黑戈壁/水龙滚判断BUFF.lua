---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�ڸ��/ˮ�����ж�BUFF.lua
-- ����ʱ��:	2015/9/17 16:54:13
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)--���ʱ����һ��
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.bOnHorse then
		player.DownHorse()
	end	
	if player.GetDynamicSkillGroup() == 0 then
		player.SetDynamicSkillGroup(220)		
		player.AddBuff(0, 99, 9820, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)--
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetDynamicSkillGroup() ~= 0 then
		player.SetDynamicSkillGroup(0)		
	end
	local nQuestID = 14546   --ǰ������
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestFailedFlag(nQuestIndex, true)
	end
	player.DelBuff(9820, 1)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com