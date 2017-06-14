
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
	local npcBossA = scene.GetNpcByNickName("Boss_4_Assassin")
	local npcBossB = scene.GetNpcByNickName("Boss_4_Hero")
	if nLeftFrame ~= 0 then
		if npcBossA and npcBossA.nCurrentLife ~= 0 then
			scene.SetCustomBoolean(SCENE_CUSTOM_VALUE_NAME.LONGYUANZE.ChengJiu_2065, true)
		end
		if npcBossB and npcBossB.nCurrentLife ~= 0 then
			scene.SetCustomBoolean(SCENE_CUSTOM_VALUE_NAME.LONGYUANZE.ChengJiu_2065, true)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com