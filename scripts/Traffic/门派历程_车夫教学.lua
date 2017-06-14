---------------------------------------------------------------------->
-- 脚本名称:	scripts/Traffic/门派历程_车夫教学.lua
-- 更新时间:	2015/6/30 15:30:03
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
function CalcCost(dwplayerID, Route_Node, nTargetCity, nCostMoney)
	--nCostMoney = math.ceil(nCostMoney / 100)
	nCostMoney = 0
	if IsClient() then
		return nCostMoney
	end
	local player = GetPlayer(dwplayerID)
	if not player then
		return nCostMoney
	end
	local tbQuest = {
		[1] = {{12026, 0}},
		[2] = {{8346, 0}, {93, 0}},
		[3] = {{1790, 0}},
		[4] = {{8129, 0}},
		[5] = {{8051, 0}, {2506, 0}},
		[6] = {{6918, 0}},
		[7] = {{7546, 0}},
		[8] = {{5110, 0}},
		[9] = {{10731, 0}},
		[10] = {{9274, 0}},
		[21] = {{12375, 0}, {12386, 0}, {12407, 0}},
		[22] = {{14311, 0, 45564}, {14329, 0, 46167}, {14338, 0, 45563}, {14360, 0, 46162}, {14358, 0, 45562}},
		[23] = {{15841, 0, 52594}},
	}
	local tbQuestSign = {12026, 8346, 93, 1790, 8129, 8051, 2506, 6918, 7546, 5110, 10731, 9274, 12375, 12386, 12407, 14311, 14329, 14338, 14360, 14358, 15841}
	if not tbQuest[player.dwForceID] then
		for _, nQuestId in pairs(tbQuestSign) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			if nQuestIndex then
				player.SetQuestValue(nQuestIndex, 0, 1)
			end
		end
		return nCostMoney
	end
	for _, tQuestInfo in pairs(tbQuest[player.dwForceID]) do
		local nQuestIndex = player.GetQuestIndex(tQuestInfo[1])
		if nQuestIndex then
			player.SetQuestValue(nQuestIndex, tQuestInfo[2], 1)
			if tQuestInfo[3] then
				player.SetNpcEffectInvisible(tQuestInfo[3])
			end
		end
	end
	return nCostMoney
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com