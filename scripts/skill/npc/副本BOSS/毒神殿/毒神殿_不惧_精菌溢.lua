function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
        return
    end
    local player = GetPlayer(nCharacterID)
    if not player then
    	return
    end
    local scene = player.GetScene()
    if not scene then
    	return
    end
	if nLeftFrame ~= 0 and player.nCurrentLife ~= 0 then
		scene.SetCustomBoolean(SCENE_CUSTOM_VALUE_NAME.DUSHENDIAN.BuJu_JingYunYi, true)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com