function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 	
		return
	end
	player.nCurrentLife = player.nMaxLife * 0.15
	player.nCurrentMana = player.nMaxMana * 0.15
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com