------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-3-1
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
	if npc.nCurrentMana > npc.nMaxMana * 0.98 then
		--[[
		if scene.dwMapID == 160 then
			npc.CastSkill(5345, 1)
		else
			npc.CastSkill(5345, 2)
		end
		--]]
		npc.FireAIEvent(2003, 0, 0)
		
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com