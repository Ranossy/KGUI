function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.bHuntingFlag then
		player.SetFakeNameState(FAKE_NAME_STATE.HUNTER)
		player.AddBuff(0,99,4958,1)
	else
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_YELLOW", GetEditorString(5, 3850), 3)
		player.ClearCDTime(566)
	end	
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com