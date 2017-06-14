function Apply(dwCharacterID)
	local dahan = GetNpc(dwCharacterID)
	if not dahan then
		return
	end
	
	if dahan.dwTemplateID == 17731 then
		dahan.CastSkill(3921, 1)
	elseif dahan.dwTemplateID == 18377 or dahan.dwTemplateID == 18611 then
		dahan.CastSkill(3921, 2)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com