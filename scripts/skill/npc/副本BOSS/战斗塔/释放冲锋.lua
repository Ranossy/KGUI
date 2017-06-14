function Apply(dwCharacterID)
	local dahan = GetNpc(dwCharacterID)
	if not dahan then
		return
	end
	
	dahan.CastSkill(4125,1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com