function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		if player.nCurrentLife >= player.nMaxLife*0.95  then
			player.DelBuff(2202, 1) 
			player.DelBuff(2202, 2)
			player.DelBuff(2202, 3)
			player.DelBuff(2202, 4)
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com