---------------------------------------------------------------------->
-- �ű�����:	scripts/Traffic/ͨ����Ӫ����.lua
-- ����ʱ��:	11/07/11 19:18:52
-- �����û�:	ZhangDongen
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/Traffic/Include/trafficstring.ls")
-- mapid�뽻ͨ��Ҫ��ͨ��NODEID���ձ�����KEYΪMAPID��VALUEΪNODEID
tMapCampIDToNeedOpenNode = {
	[30] = {117, 119}, -- ����
	[22] = {108, 110}, -- ����ɽ
	[27] = {116, 116}, -- ���˹�
	[25] = {105, 105}, -- ������
}

tMapIDToAchievementID = {
	--[27] = XX, -- ���˹�
	--[25] = XX, -- ������
}

--NPC��50�Ǻ�����������49�Ƕ��˹�����
tNpcMapToCamp = {
	[30] = {[50] = 117, [49] = 119}, -- ����
	[22] = {[50] = 108, [49] = 110}, -- ����ɽ
	[27] = {[49] = 116}, -- ���˹�
	[25] = {[50] = 105}, -- ������
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
	--[[�ɾ�ϵͳ�ݲ�����
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

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com