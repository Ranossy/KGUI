function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
        return
    end
    local player = GetPlayer(nCharacterID)
    if not player then
    	return
    end
 	local nQuestID = 7448
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nLeftFrame > 0 then
		if questIndex and nQuestPhase ~= 2 then
   			 player.SetQuestFailedFlag(questIndex, true)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com