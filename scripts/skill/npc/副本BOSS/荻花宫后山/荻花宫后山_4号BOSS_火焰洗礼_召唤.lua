function Apply(dwCharacterID)
			local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if scene then
		scene.CreateNpc(8828,player.nX,player.nY,player.nZ,0,2560);   
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com