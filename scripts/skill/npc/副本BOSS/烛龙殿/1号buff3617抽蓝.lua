function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	local nMM = tplayer.nMaxMana
	local nCM = tplayer.nCurrentMana
	local scene = tplayer.GetScene()
	if scene.dwMapID == 134 then
		if nCM >= nMM * 0.015 then
			tplayer.nCurrentMana = nCM - nMM * 0.015
		else
			tplayer.nCurrentMana = 0
		end
	elseif scene.dwMapID == 133 then
			if nCM >= nMM * 0.015 then
				tplayer.nCurrentMana = nCM - nMM * 0.015
			else
				tplayer.nCurrentMana = 0
			end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com