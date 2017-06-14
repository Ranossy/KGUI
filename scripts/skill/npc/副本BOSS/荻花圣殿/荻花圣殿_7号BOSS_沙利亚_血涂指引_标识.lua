function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
			local player = GetPlayer(dwCharacterID)
	if player then
		player.Stop()
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com