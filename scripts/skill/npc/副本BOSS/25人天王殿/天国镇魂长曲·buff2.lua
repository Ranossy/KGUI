function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if tplayer and IsPlayer(dwCharacterID) then
		if tplayer.nCurrentMana >= tplayer.nMaxMana * 0.025 then
			tplayer.nCurrentMana = tplayer.nCurrentMana - tplayer.nMaxMana * 0.025
		else 
			tplayer.nCurrentMana = 0
		end
		local tbuff = tplayer.GetBuff(2144, 3)
		if tplayer.nCurrentMana  <= 10 and buff == nil then
			tplayer.AddBuff(0, 99, 2144, 3)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com