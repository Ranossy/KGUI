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

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com