-- ������    :  kingbeyond	
-- ����ʱ��  :  2008-04-15
-- ��;(ģ��):  ������
-- �书����  :  ��������
-- ����Ч��  :  ��NPC��DEBUFF

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	if(IsPlayer(dwCharacterID)) then
		-- ��������ܶ������Ч
	else
		local npc = GetNpc(dwCharacterID)
		if npc then
			npc.AddBuff(0, 99, 662, 1, 0)
			npc.AddBuff(0, 99, 422, 1, 0)
			npc.Say(GetEditorString(2, 8039))
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
--function UnApply(dwCharacterID)
--end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com