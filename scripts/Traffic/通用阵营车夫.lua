---------------------------------------------------------------------->
-- 脚本名称:	scripts/Traffic/通用阵营车夫.lua
-- 更新时间:	11/07/11 19:18:52
-- 更新用户:	ZhangDongen
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/Traffic/Include/trafficstring.ls")
-- mapid与交通需要开通的NODEID对照表，其中KEY为MAPID，VALUE为NODEID
tMapCampIDToNeedOpenNode = {
	[30] = {117, 119}, -- 昆仑
	[22] = {108, 110}, -- 南屏山
	[27] = {116, 116}, -- 恶人谷
	[25] = {105, 105}, -- 浩气盟
}

tMapIDToAchievementID = {
	--[27] = XX, -- 恶人谷
	--[25] = XX, -- 浩气盟
}

--NPC，50是浩气盟势力，49是恶人谷势力
tNpcMapToCamp = {
	[30] = {[50] = 117, [49] = 119}, -- 昆仑
	[22] = {[50] = 108, [49] = 110}, -- 南屏山
	[27] = {[49] = 116}, -- 恶人谷
	[25] = {[50] = 105}, -- 浩气盟
}


function OnDialogue(npc, player)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	
	if player.nCamp == 0 then
		npc.Say(GetEditorString(2, 8011))
		return
	end
	
	if not player.IsOpenRouteNode(tMapCampIDToNeedOpenNode[scene.dwMapID][player.nCamp]) then
		player.OpenRouteNode(tMapCampIDToNeedOpenNode[scene.dwMapID][player.nCamp])
		player.SendSystemMessage(tTrafficMafu["firsttime"])
	end
	--[[成就系统暂不开放
	if not player.IsAchievementAcquired(tMapIDToAchievementID[scene.dwMapID]) then
	player.AcquireAchievement(tMapIDToAchievementID[scene.dwMapID])
	end
	--]]
	if not CustomFunction.CheckMapTraffic(npc, player) then
		return
	end
	
	player.OpenWindow(TARGET.NPC, npc.dwID, 
		npc.GetAutoDialogString(player.dwID) .. "\n\n" .. "<U " .. tMapCampIDToNeedOpenNode[scene.dwMapID][player.nCamp] .. " " .. tTrafficMafu["chengche"] .. ">"
		.. "\n" .. "<$C " .. tTrafficMafu["fangqi"] .. ">", 
		"leave"
	)
end

function leave(player, nTargetType, nTargetID, nIndex)
	return
end

--[[
function OnDeath(npc, killer)
local scene = npc.GetScene()
if not scene then
return
end
if not tNpcMapToCamp[scene.dwMapID][npc.dwForceID] then
return
end
EnableRouteNode(tNpcMapToCamp[scene.dwMapID][npc.dwForceID], false)
end

function OnNpcRevive(npc)
local scene = npc.GetScene()
if not scene then
return
end
if not tNpcMapToCamp[scene.dwMapID][npc.dwForceID] then
return
end
EnableRouteNode(tNpcMapToCamp[scene.dwMapID][npc.dwForceID], true)
end
--]]

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com