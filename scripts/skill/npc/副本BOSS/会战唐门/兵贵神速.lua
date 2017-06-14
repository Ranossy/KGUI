function UnApply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		ctarget = GetNpc(dwCharacterID)
	else
		ctarget = GetPlayer(dwCharacterID)
	end
	if not ctarget then 
	return
	end
	local scene = ctarget.GetScene()
	scene.SetCustomBoolean(89, true)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com