function Apply(dwCharacterID)
	local tModelID = {5345, 5346, 5338}	-- ������дģ��ID
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com