---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ɽ����_����Ӥ��.lua
-- ����ʱ��:	2012-7-9 16:41:05
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    : ֣����
-- ����ʱ��  :  20111202
-- ��; 		 :  ��ɽ����
------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local nIndex = player.GetQuestIndex(7734)
	local nPhase = player.GetQuestPhase(7734)
	if nIndex and nPhase < 2 then
    player.SetQuestFailedFlag(nIndex, ture)
		player.SendSystemMessage(GetEditorString(4, 327))
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com