function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	tplayer.Stop()
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com