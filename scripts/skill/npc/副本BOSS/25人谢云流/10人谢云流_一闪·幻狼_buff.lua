--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local nBuff_ID = 2082
	local nBuff_Level = 1
	local player = GetPlayer(dwCharacterID)
	--local scene = player.GetScene()
	--local nCount = scene.GetCustomInteger1(15)																--ȡ�ô���NPC����
	if player and IsPlayer(dwCharacterID) then
		local scene = player.GetScene()
		local nCount = scene.GetCustomInteger1(15)
		local nBuff = 0
		if nCount >= 1 then
			for i = 1, nCount do
				if scene.GetNpcByNickName("Thr_sword_" .. i) then											--���֮ǰ��NPC���ھ�buff����+1
					nBuff = nBuff + 1
				end
			end
		end
		nCount = nCount + 1																					--����һ���µ�NPC
		scene.CreateNpc(7671,player.nX,player.nY,player.nZ,0,9999, "Thr_sword_" .. nCount)
		scene.SetCustomInteger1(15, nCount)
		for i = 1, nCount do																				--��buff
			local npc = scene.GetNpcByNickName("Thr_sword_" .. i)
			if npc then
				npc.DelBuff(nBuff_ID, nBuff_Level)
				for i = 1, nBuff do			
					npc.AddBuff(0, 99, nBuff_ID, nBuff_Level)
				end
			end
		end
		player.Die()
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com