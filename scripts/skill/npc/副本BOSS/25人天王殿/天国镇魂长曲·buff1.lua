function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if tplayer and IsPlayer(dwCharacterID) then
		if tplayer.nCurrentMana >= tplayer.nMaxMana * 0.025 then
			tplayer.nCurrentMana = tplayer.nCurrentMana - tplayer.nMaxMana * 0.025
		else 
			tplayer.nCurrentMana = 0
		end
		local tbuff = tplayer.GetBuff(2144, 2)
		if tplayer.nCurrentMana  <= 10 and buff == nil then
			tplayer.AddBuff(0, 99, 2144, 2)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com