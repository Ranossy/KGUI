function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	local nMM = tplayer.nMaxMana
	local nCM = tplayer.nCurrentMana
	if nCM >= nMM * 0.015 then
		tplayer.nCurrentMana = nCM - nMM * 0.015
	else
		tplayer.nCurrentMana = 0
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com