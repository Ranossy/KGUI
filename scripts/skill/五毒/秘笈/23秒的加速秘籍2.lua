function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	local tbuff = tplayer.GetBuff(2315,2)
	if tbuff then
		tplayer.AddBuff(0,99,3415,2)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com