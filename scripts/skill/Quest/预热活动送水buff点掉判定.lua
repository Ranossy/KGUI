function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local tplayer = GetPlayer(nCharacterID)
	local nQuestID = 9481
	local nQuestIndex = tplayer.GetQuestIndex(nQuestID)
	local nQuestPhase = tplayer.GetQuestPhase(nQuestID)
	if not nLeftFrame ~= 0 then
		if tplayer.GetQuestValue(nQuestIndex, 1) == 1 then
			tplayer.CostItem(ITEM_TABLE_TYPE.OTHER, 17685, 1)
		else
			tplayer.CostItem(ITEM_TABLE_TYPE.OTHER, 17685, 1)
			RemoteCallToClient(tplayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "水桶丢失，任务无法继续，请侠士放弃后重接", 4)
			tplayer.SetQuestFailedFlag(nQuestIndex, true)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com