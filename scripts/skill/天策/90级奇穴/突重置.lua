function Apply(dwCharacterID)	
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--player.ResetCD(98)
	player.CastSkill(6550,1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com