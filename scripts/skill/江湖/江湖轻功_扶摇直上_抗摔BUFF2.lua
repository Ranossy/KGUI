function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return	
	end
	player.AddBuff(player.dwID, player.nLevel, 1089, 2)

	if player.GetSkillLevel(9002) >= 8 then
		player.AddBuff(player.dwID, player.nLevel, 9142, 1)
	end
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com