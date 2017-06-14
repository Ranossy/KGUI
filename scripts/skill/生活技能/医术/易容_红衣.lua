function Apply(dwCharacterID)
	local tModelID = {5343, 5344, 5341}	-- 这里填写模型ID
	local nRandomID = tModelID[Random(1, #tModelID)]
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		if player then
			player.SetModelID(nRandomID)
		end
	end
end

function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		if player then
			player.SetModelID(0)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com