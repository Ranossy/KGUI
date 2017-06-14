function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local tBuff = player.GetBuff(1799, 1)
	if tBuff then
		local nTime = GetCurrentTime()
		local tTime = TimeToDate(nTime)
		local nDayTrue = tBuff.nCustomValue
		if nTime > nDayTrue then
			player.AddBuff(0, 99, 1798, 1)
		else
			player.AddBuff(0, 99, 1806, 1)
		end
	else
		player.AddBuff(0, 99, 1798, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com