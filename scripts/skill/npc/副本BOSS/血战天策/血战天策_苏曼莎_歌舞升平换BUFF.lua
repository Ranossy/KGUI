------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2014-3-10
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 175 then
		npc.AddBuff(0, 99, 6966, 1)
	elseif scene.dwMapID ==176 then
		npc.AddBuff(0, 99, 6966, 2)
	elseif scene.dwMapID == 182 then
		npc.AddBuff(0, 99, 6966, 5)
	elseif scene.dwMapID == 183 then
		npc.AddBuff(0, 99, 6966, 6)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com