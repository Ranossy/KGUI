--生活技能阅读

function OnReadPage(player)
	local bBookMemorized = player.IsBookMemorized(5, 1)
	if bBookMemorized then
		local nQuestID1 = 3738
		local nQuestID2 = 3741
		local nQuestID3 = 3742
		local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
		local nQuestIndex2 = player.GetQuestIndex(nQuestID2)
		local nQuestIndex3 = player.GetQuestIndex(nQuestID3)
		if nQuestIndex1 then
			player.SetQuestValue(nQuestIndex1, 0, 1)
		end
		if nQuestIndex2 then
			player.SetQuestValue(nQuestIndex2, 0, 1)
		end
		if nQuestIndex3 then
			player.SetQuestValue(nQuestIndex3, 0, 1)
		end
	end
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com