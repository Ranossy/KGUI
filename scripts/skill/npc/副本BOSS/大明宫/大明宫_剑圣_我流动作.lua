------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-7-26
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.DoAction(0, 10061)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local tPlayer = scene.GetAllPlayer()
	if tPlayer then
		for i = 1, #tPlayer do
			local player = GetPlayer(tPlayer[i])
			if player then
				if not player.GetBuff(5973, 1) then
					player.AddBuff(0, 99, 6730, 1)
					npc.PlaySfx(442, player.nX, player.nY, player.nZ)
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com