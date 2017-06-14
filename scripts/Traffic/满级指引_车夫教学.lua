---------------------------------------------------------------------->
-- �ű�����:	scripts/Traffic/����ָ��_�����ѧ.lua
-- ����ʱ��:	2015/6/30 10:14:11
-- �����û�:	zhangtianhui1
-- �ű�˵��:
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

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com