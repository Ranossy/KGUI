function Apply(dwCharacterID)
	local tBuffID = {1875, 1876, 1877, 1878}
	local nNum = Random(1, #tBuffID)
	local player = GetPlayer(dwCharacterID)
	--local scene = player.GetScene()
	if player and IsPlayer(dwCharacterID) then
		local scene = player.GetScene()
	    if scene.dwMapID == 131 then
		    if player.GetBuff(1875, 4) == nil and player.GetBuff(1876, 4) == nil and player.GetBuff(1877, 4) == nil and player.GetBuff(1878, 4) == nil then
			player.AddBuff(0, 99, tBuffID[nNum], 4)
		    end
		elseif scene.dwMapID == 148 then
		    if player.GetBuff(1875, 5) == nil and player.GetBuff(1876, 5) == nil and player.GetBuff(1877, 5) == nil and player.GetBuff(1878, 5) == nil then
			player.AddBuff(0, 99, tBuffID[nNum], 5)
		    end
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com