function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
 		return
 	end
 	player.Stop()
 	player.AddBuff(0,99,2667,1)
 	player.SetPosition(33234, 14713, 1222976)
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com