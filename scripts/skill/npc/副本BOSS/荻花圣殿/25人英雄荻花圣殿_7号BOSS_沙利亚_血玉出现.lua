function Apply(dwCharacterID)
			local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if scene then
		scene.CreateNpc(14901,player.nX,player.nY,player.nZ,0,480);   
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com