function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	if cPlayer.nCurrentMana <= cPlayer.nMaxMana * 0.3 then
		cPlayer.nCurrentMana = cPlayer.nCurrentMana - cPlayer.nMaxMana * 0.09
		cPlayer.DelBuff(3229,1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com