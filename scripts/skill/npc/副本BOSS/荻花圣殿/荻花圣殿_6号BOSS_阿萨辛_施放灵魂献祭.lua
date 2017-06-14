function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
	end
	if player then
		local scene = player.GetScene()
		if scene then
		scene.CreateNpc(8145,player.nX,player.nY,player.nZ,0,2560, "suolian_"..dwCharacterID);   
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com