function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
--	player.nCurrentLife = player.nMaxLife 
	player.AddBuff(0, 99, 4969, 1)	--���
	--player.AddBuff(0, 99, 7218, 1,172800)	--antiboss
	--player.SetDynamicSkillGroup(23)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	player.DelBuff(4969, 1)	--���
	--player.DelBuff(7218,1)	--���
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com