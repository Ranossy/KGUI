function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		print("no player")
		return
	end

	
	
	
	if nLeftFrame < 3 then
		---完成任务
		local nQuestId_15336 = 15336
		local nQuestIndex_15336 = player.GetQuestIndex(nQuestId_15336)
		local nQuestPhase_15336 = player.GetQuestPhase(nQuestId_15336)
		if nQuestIndex_15336 and nQuestPhase_15336 == 1 then
			player.SetQuestValue(nQuestIndex_15336, 0, 1)
		end
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 157), 4)
	else
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 158), 4)
	end
end


function Apply(dwCharacterID)
	
	local player = GetPlayer(dwCharacterID)
	
	if player then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 147), 4)
	else
		print("no pplayerrrrr")
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com