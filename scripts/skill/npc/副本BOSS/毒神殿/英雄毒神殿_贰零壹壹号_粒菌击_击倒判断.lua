function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		if player.nCurrentLife >= player.nMaxLife*0.9  then
			player.DelBuff(2364, 2) 
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com