function UnApply(dwCharacterID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	target.Stop()
	target.AddBuff(0,99,4005,1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com