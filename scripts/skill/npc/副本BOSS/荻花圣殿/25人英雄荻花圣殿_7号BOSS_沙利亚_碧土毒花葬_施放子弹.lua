------------------------------------------------
-- ������   :  �ź�		
-- ����ʱ��	:  2011-3-23
-- Ч����ע	:  ݶ��ʥ��Ľ�ݷ��˼��ܣ�ʩ���ӵ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
local tDirection = {}
	tDirection[1] = npc.nFaceDirection
	tDirection[2] = npc.nFaceDirection - 30 % 256
	tDirection[3] = npc.nFaceDirection + 30 % 256
	tDirection[4] = npc.nFaceDirection - 60 % 256
	tDirection[5] = npc.nFaceDirection + 60 % 256
	tDirection[6] = npc.nFaceDirection - 80 % 256
	tDirection[7] = npc.nFaceDirection + 80 % 256
	tDirection[8] = npc.nFaceDirection - 120 % 256
	for	i = 1, 8 do
		local nY = npc.nY + math.floor(math.sin(tDirection[i] / 128 * math.pi) * 40 * 64)
		local nX = npc.nX + math.floor(math.cos(tDirection[i] / 128 * math.pi) * 40 * 64)
		local scene = npc.GetScene()
		if not scene then
			return
		end
		local npcYb = scene.CreateNpc(14961, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, 8 * GLOBAL.GAME_FPS)
		if npcYb then
			npcYb.RunTo(nX, nY)
		end
	end


end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com