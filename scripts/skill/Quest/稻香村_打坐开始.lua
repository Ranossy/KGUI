--周期性地检查玩家是否在打坐。如果在任务状态，并打坐，则完成任务。\
function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	local nQuestID = 803
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex and player.nCurrentLife >= player.nMaxLife then
		local buff = player.GetBuff(103, 0)
		if buff and (not player.GetQuestFailedFlag(nQuestIndex)) then
			player.SetQuestValue(nQuestIndex, 0, 1)
			player.DelBuff(482, 1)
		end
	end
end
		
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com