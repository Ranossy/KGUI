function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
			local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if scene then
		scene.CreateNpc(8829,player.nX,player.nY,player.nZ,0,2560);   
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com