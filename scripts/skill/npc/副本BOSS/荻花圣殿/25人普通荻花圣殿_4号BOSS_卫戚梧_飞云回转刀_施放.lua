------------------------------------------------
-- ������   :  �ź�		
-- ����ʱ��	:  2010-9-20
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
local tDirection = {}
	tDirection[1] = npc.nFaceDirection
	tDirection[2] = npc.nFaceDirection - 60 % 256
	tDirection[3] = npc.nFaceDirection + 60 % 256

		local nY = npc.nY + math.floor(math.sin(tDirection[1] / 128 * math.pi) * 40 * 64)
		local nX = npc.nX + math.floor(math.cos(tDirection[1] / 128 * math.pi) * 40 * 64)
		local scene = npc.GetScene()
		if not scene then
			return
		end
		local npcYb = scene.CreateNpc(13472, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, -1)
		if npcYb then
			npcYb.RunTo(nX, nY)
		end


end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com