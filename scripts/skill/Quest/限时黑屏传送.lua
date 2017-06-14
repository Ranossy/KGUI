---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/限时黑屏传送.lua
-- 更新时间:	2014/11/19 23:32:35
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nQuestId_12362 = 12362
	local nQuestIndex_12362 = player.GetQuestIndex(nQuestId_12362)
	if nQuestIndex_12362 then
		player.AddBuff(0, 99, 8577, 1)
		RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/限时黑屏传送.lua", 0, 0)
	end
	local nQuestId_12363 = 12363
	local nQuestIndex_12363 = player.GetQuestIndex(nQuestId_12363)
	local nQuestPhase_12363 = player.GetQuestPhase(nQuestId_12363)
	if nQuestIndex_12363 and nQuestPhase_12363 == 1 then
		player.AddBuff(0, 99, 8577, 1)
		RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/限时黑屏传送.lua", 0, 0)
	end
	local nQuestId_12657 = 12657
	local nQuestIndex_12657 = player.GetQuestIndex(nQuestId_12657)
	local nQuestPhase_12657 = player.GetQuestPhase(nQuestId_12657)
	if nQuestIndex_12657 then
		player.AddBuff(0, 99, 8577, 1)
		RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/限时黑屏传送.lua", 0, 0)
	end
	local nQuestId_12656 = 12656
	local nQuestIndex_12656 = player.GetQuestIndex(nQuestId_12656)
	local nQuestPhase_12656 = player.GetQuestPhase(nQuestId_12656)
	if nQuestIndex_12656 and nQuestPhase_12656 == 2 then
		player.AddBuff(0, 99, 8577, 1)
		RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/限时黑屏传送.lua", 0, 0)
	end
end

function OnTimer(player, nParam1, nParam2)
	local nQuestId_12362 = 12362
	local nQuestIndex_12362 = player.GetQuestIndex(nQuestId_12362)
	if nQuestIndex_12362 then
		if player.nZ <= 1036432 then
			player.SetPosition(22312, 22857, 1085299)
			player.TurnTo(100)
			RemoteCallToClient(player.dwID, "OnChangeCameraYaw", 100)
			return
		end
	end
	local nQuestId_12363 = 12363
	local nQuestIndex_12363 = player.GetQuestIndex(nQuestId_12363)
	local nQuestPhase_12363 = player.GetQuestPhase(nQuestId_12363)
	if nQuestIndex_12363 and nQuestPhase_12363 == 1 then
		if player.nZ <= 1036432 then
			player.SetPosition(21497, 27576, 1083924)
			player.TurnTo(66)
			RemoteCallToClient(player.dwID, "OnChangeCameraYaw", 66)
			return
		end
	end
	local nQuestId_12657 = 12657
	local nQuestIndex_12657 = player.GetQuestIndex(nQuestId_12657)
	local nQuestPhase_12657 = player.GetQuestPhase(nQuestId_12657)
	if nQuestIndex_12657 then
		if player.nZ <= 1036432 then
			player.SetPosition(25991, 23101, 1084032)
			player.TurnTo(255)
			RemoteCallToClient(player.dwID, "OnChangeCameraYaw", 255)
			return
		end
	end
	local nQuestId_12656 = 12656
	local nQuestIndex_12656 = player.GetQuestIndex(nQuestId_12656)
	local nQuestPhase_12656 = player.GetQuestPhase(nQuestId_12656)
	if nQuestIndex_12656 and nQuestPhase_12656 == 2 then
		if player.nZ <= 1036432 then
			player.SetPosition(22312, 22857, 1085299)
			player.TurnTo(100)
			RemoteCallToClient(player.dwID, "OnChangeCameraYaw", 100)
			return
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com