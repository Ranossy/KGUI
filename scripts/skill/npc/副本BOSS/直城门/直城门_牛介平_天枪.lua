------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-8-21
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if not npc.GetBuff(6565, 1) then
		return
	end
	if npc.GetBuff(6565, 1).nStackNum == 5 then
		npc.DelGroupBuff(6565, 1)
		npc.AddBuff(0,99,6567,1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com