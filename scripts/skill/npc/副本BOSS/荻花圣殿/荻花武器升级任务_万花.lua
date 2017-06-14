function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 7446
	local questIndex = player.GetQuestIndex(nQuestID)
	if player then
		if questIndex then
   			 player.SetQuestFailedFlag(questIndex, true)
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com