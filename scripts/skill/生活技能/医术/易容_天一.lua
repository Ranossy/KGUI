function Apply(dwCharacterID)
	local rank = Random(1, 75)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		if rank <= 25 then
			player.SetModelID(960)--天一教杂役
		elseif rank <= 50 then
		
		
			player.SetModelID(960)--天一教杂役
		elseif rank <= 75 then
			player.SetModelID(962)--天一教杂役
		--elseif rank <= 100 then
			--player.SetModelID(962)
		end
	end
end

function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		player.SetModelID(0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com