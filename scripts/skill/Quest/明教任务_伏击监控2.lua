---------------------------------------------------------------------->
-- �ű�����:	G:/zhugan/client/scripts/skill/Quest/��������_�������2.lua
-- ����ʱ��:	2012-11-12 20:16:21
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetQuestPhase(9364) == 1 then 
		player.SetQuestFailedFlag(player.GetQuestIndex(9364), true)
	end 
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com