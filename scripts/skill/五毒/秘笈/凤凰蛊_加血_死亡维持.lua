function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	--if player.GetBuff(2313,1) then
	player.AddBuff(player.dwID, player.nLevel,2947,1)
	--end	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com