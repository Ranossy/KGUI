function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	
	local scene = tplayer.GetScene()
	scene.CreateNpc(18448, tplayer.nX, tplayer.nY, tplayer.nZ, 0, 160)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com