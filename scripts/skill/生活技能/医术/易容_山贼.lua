function Apply(dwCharacterID)
	local rank = Random(1, 125)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		if rank <= 25 then
			player.SetModelID(1061)--连珠寨山贼
		elseif rank <= 50 then
			player.SetModelID(9)--香山山贼
		elseif rank <= 75 then
			player.SetModelID(154)--山贼小头目
		elseif rank <= 100 then
			player.SetModelID(275)--强大的龙剑山山贼
		elseif rank <= 125 then
			player.SetModelID(274)--龙剑山山贼
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