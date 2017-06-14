function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	
	local scene = tplayer.GetScene()
	if scene then
		if scene.dwMapID == 134 then
			tplayer.AddBuff(0, 99, 3984, 1)
		elseif scene.dwMapID == 133 then
			tplayer.AddBuff(0, 99, 3984, 2)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com