---------------------------------------------------------------------->
-- 脚本名称:	scripts/Traffic/满级指引_车夫教学.lua
-- 更新时间:	2015/6/30 10:14:11
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Traffic/Include/WorldTraffic.lua")

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
	local tbQuestId = {13031, 15013, 15127, 1384, 15176, 8567, 1729}
	for _, nQuestId in pairs(tbQuestId) do
		local nQuestIndex = player.GetQuestIndex(nQuestId)
		local nQuestPhase = player.GetQuestPhase(nQuestId)
		if nQuestIndex and nQuestPhase == 1 then
			player.SetQuestValue(nQuestIndex, 0, 1)
		end
	end
	return nCostMoney
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com