function Apply(dwCharacterID)
	local tBuffID = {1875, 1876, 1877, 1878}
	local nNum = Random(1, #tBuffID)
	local player = GetPlayer(dwCharacterID)
	
	if player and IsPlayer(dwCharacterID) then
		if player.GetBuff(1875, 3) == nil and player.GetBuff(1876, 3) == nil and player.GetBuff(1877, 3) == nil and player.GetBuff(1878, 3) == nil then
			player.AddBuff(0, 99, tBuffID[nNum], 3)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com