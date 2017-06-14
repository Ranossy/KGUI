function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local cP = nil
	if not IsPlayer(nCharacterID) then
        cP = GetNpc(nCharacterID)
    end
	if not cP then
		cP = GetPlayer(nCharacterID)
		if not cP then
			return
		end
	end
    local scene = cP.GetScene()
    if not scene then
    	return
    end
	if nLeftFrame ~= 0 and cP.nCurrentLife ~= 0 then
		scene.SetCustomBoolean(SCENE_CUSTOM_VALUE_NAME.LONGYUANZE.ChengJiu_2058, true)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com