function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local tBuff = player.GetBuff(1799, 1)
	local nTime = GetCurrentTime()
	local tTime = TimeToDate(nTime)
	local nNextDay = DateToTime(tTime.year, tTime.month, tTime.day + 1, 0, 0, 0)
	if tBuff then
		local nDayTrue = tBuff.nCustomValue
		if nTime > nDayTrue then
			player.AddBuff(0, 99, 1799, 1)
			tBuff = player.GetBuff(1799, 1)
			if tBuff then
				tBuff.nCustomValue = nNextDay
			end
			player.AddBuff(0, 99, 1806, 1)
		else
			player.AddBuff(0, 99, 1806, 1)
		end
	else
		player.AddBuff(0, 99, 1799, 1)
		tBuff = player.GetBuff(1799, 1)
		if tBuff then
			tBuff.nCustomValue = nNextDay
		end
		player.AddBuff(0, 99, 1806, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com