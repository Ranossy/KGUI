function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then 
		local player = GetPlayer(dwCharacterID)
		player.AddBuff(0,99,4215,1)				-- 20000���⹦�˺� ������
	else
		local npc = GetNpc(dwCharacterID)
		npc.AddBuff(0,99,4215,1)				-- 20000���⹦�˺� ������
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com