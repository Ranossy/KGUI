function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	local tbuff = tplayer.GetBuff(562,1)
	if not tbuff then
		return
	else
		tplayer.AddBuff(0,99,2291,1,1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com