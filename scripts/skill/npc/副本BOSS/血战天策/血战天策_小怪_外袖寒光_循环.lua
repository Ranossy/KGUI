------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-10-15
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------
--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 175 then	
		npc.CastSkill(8357,1)
		npc.CastSkill(8358, 1)
	else
		npc.CastSkill(8357,2)
		npc.CastSkill(8358, 2)		
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com