function UnApply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		local ctarget = GetNpc(dwCharacterID)
	else
		local ctarget = GetPlayer(dwCharacterID)
	end
	if not ctarget then 
	return
	end
	local scene = ctarget.GetScene()
	if not scene then
		return
	end
	scene.SetCustomBoolean(87, true)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com