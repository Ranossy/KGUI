function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	if not tplayer then
		return
	end
	
	local scene = tplayer.GetScene()
	scene.CreateNpc(17763, tplayer.nX, tplayer.nY, tplayer.nZ, 0, 96)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com