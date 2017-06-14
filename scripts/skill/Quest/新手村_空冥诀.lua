function Apply(dwCharacterID)
	local player = GetPlayer(nCharacterID)
	if player then 
		if player.nLevel < 10 then 
		player.AddBuff(0,99,1160,1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com