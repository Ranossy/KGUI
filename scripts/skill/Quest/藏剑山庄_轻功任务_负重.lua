function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not (player and IsPlayer(nCharacterID)) then
		return
	end
	
	local nQuestID = 5330
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	if nQuestIndex and nQuestPhase == 2 then
		player.SetQuestFailedFlag(nQuestIndex, true)
		
		if player.bOnHorse then
			player.SendSystemMessage(GetEditorString(2, 8037))
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com