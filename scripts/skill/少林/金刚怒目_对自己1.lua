function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	local tlevel = 5
	tplayer.AddBuff(tplayer.dwID,tplayer.nLevel,3885,tlevel,12)

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com