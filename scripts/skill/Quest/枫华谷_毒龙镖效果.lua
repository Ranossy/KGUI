-- ������    :  kingbeyond	
-- ����ʱ��  :  2008-04-15
-- ��;(ģ��):  ������
-- �书����  :  �㻪������
-- ����Ч��  :  ɱ���ض�NPC

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

	if(IsPlayer(dwCharacterID)) then
		-- ��������ܶ������Ч
	else
		local npc = GetNpc(dwCharacterID)
		local dwTemplateID = npc.dwTemplateID
		
		if  dwTemplateID ==  1789 or dwTemplateID ==  1790 or dwTemplateID ==  1791 then
			npc.Die()
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com