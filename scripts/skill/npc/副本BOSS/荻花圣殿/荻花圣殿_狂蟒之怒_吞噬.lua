function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
 		return
 	end
 	player.Stop()
 	player.AddBuff(0,99,3454,1)
end

function UnApply(dwCharacterID)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com