------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-11-4
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
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.02
	else
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.02
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com