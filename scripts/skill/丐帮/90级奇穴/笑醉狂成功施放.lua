
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nBuff = player.GetBuff(6375, 1)
	if not nBuff then
		return
	end
	if nBuff.nStackNum == 5 then
		if player.GetSkillLevel(6828) == 1 then
			--player.ClearCDTime(602)
			player.nCurrentMana = player.nMaxMana
		end
		if player.GetSkillLevel(6829) == 1 then
			--player.ClearCDTime(600)
			player.nCurrentLife = player.nMaxLife
		end
	end	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com