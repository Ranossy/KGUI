---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/阴山大草原/quest/侠者帮人帮到底.lua
-- 更新时间:	2015/9/3 17:39:04
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
--function OnInit(QuestInfo)
	--QuestInfo.SetMaxStageGoalCount(1)
	--QuestInfo.SetNeedItemByStage(0, 0, 5, 23905, 6)
--end

function OnAcceptQuest(player, dwQuestTemplateID)
end

-- 在玩家实际交了任务的时候触发(交任务, 不是任务目标达成)
function OnFinishQuest(player, nPresentChoice1, nPresentChoice2, dwQuestTemplateID)
	local nAmount1 = player.GetItemAmountInAllPackages(5, 23905)
	if nAmount1 >= 1 then
		player.CostItemInAllPackage(5, 23905, nAmount1)
	end
	local nAmount2 = player.GetItemAmountInAllPackages(5, 23906)
	if nAmount2 >= 1 then
		player.CostItemInAllPackage(5, 23906, nAmount2)
	end
end

-- 在玩家实际删除任务的时候触发
function OnCancelQuest(player, dwQuestTemplateID)
	local nAmount1 = player.GetItemAmountInAllPackages(5, 23905)
	if nAmount1 >= 1 then
		player.CostItemInAllPackage(5, 23905, nAmount1)
	end
	local nAmount2 = player.GetItemAmountInAllPackages(5, 23906)
	if nAmount2 >= 1 then
		player.CostItemInAllPackage(5, 23906, nAmount2)
	end
end

-- QUEST脚本, 团队任务开始的时候触发, 同一个团队任务在一个场景只能同时被一组玩家接
-- 队里任何人接受团队任务后, 将有10秒时间询问所有队伍玩家是否也一起接受, 时间结束调用此函数
--function OnStartQuest(scene, npc)
--end;


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com