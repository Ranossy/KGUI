------------------------------------------------
-- ������   :  �ź�		
-- ����ʱ��	:  2010-9-20
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

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
		for i = 1, 10 do
			local npcTemp = scene.GetNpcByNickName("minghualianwu_" .. i)
			if not npcTemp then
				scene.CreateNpc(13540, npc.nX, npc.nY, npc.nZ, 0, 1920, "minghualianwu_" .. i)
				break
			end
		end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com