---------------------------------------------------------------------->
-- 脚本名称:	scripts/Traffic/世界通用船夫.lua
-- 更新时间:	2015/9/24 10:54:51
-- 更新用户:	zhengfeng4
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Traffic/Include/trafficstring.ls")
-- mapid与交通需要开通的NODEID对照表，其中KEY为MAPID，VALUE为NODEID
tMapIDToNeedOpenNode = {
	[10] = 47, -- 寇岛(东篱)
	[16] = 38, -- 七秀
	[49] = 135, -- 藏剑
	[6] = 18, --扬州
}

tMapIDToAchievementID = {
	[10] = 446, -- 寇岛（东篱）
	[16] = 438, -- 七秀
	[49] = 1338, -- 藏剑

}

function OnDialogue(npc, player)
	local nQuestID1 = 8261
	local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
--	local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	if nQuestPhase1 == 1 and npc.dwTemplateID == 7039 and scene.dwMapID == 49 then
		player.OpenWindow(TARGET.NPC, npc.dwID,
			GetEditorString(3, 9057) .. "\n" ..
			GetEditorString(3, 9058) .. "\n",
			"OnDialogue01"
		);
		return
	end
	if scene.dwMapID == 6 then	--扬州作为目前唯一有两个码头的城市，需要特殊处理
		if player.nY > 40000 then	-- 扬州七秀码头
			--	if not player.IsOpenRouteNode(18) then                         (18号点是默认开启的，东篱的点现在已经不需要开启，所以这些判断条件现在不需要了)
			--		player.OpenRouteNode(18)
			--		player.SendSystemMessage(tTrafficChuanfu["firsttime"])
			--	end
			if not CustomFunction.CheckMapTraffic(npc, player) then
				return
			end
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. "\n\n" .. "<$C " .. tTrafficChuanfu["qixiu"] .. ">"
				.. "\n" .. "<$C " .. tTrafficChuanfu["cangjian"] .. ">"
				.. "\n" .. "<$C " .. tTrafficChuanfu["koudao"] .. ">"
				.. "\n" .. "<$C " .. GetEditorString(5, 6986) .. ">"
				.. "\n" .. "<$C " .. tTrafficChuanfu["fangqi"] .. ">",
				"Qixiu",
				"Cangjian",
				"Koudao1",
				"GoToGaiBang",
				"Leave"
			)
		elseif player.nY <= 40000 then	-- 扬州寇岛码头
			--	if not player.IsOpenRouteNode(18) then
			--		player.OpenRouteNode(18)
			--		player.SendSystemMessage(tTrafficChuanfu["firsttime"])
			--	end
			if not CustomFunction.CheckMapTraffic(npc, player) then
				return
			end
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. "\n\n" .. "<$C " .. tTrafficChuanfu["koudao"] .. ">"
				.. "\n" .. "<$C " .. tTrafficChuanfu["fangqi"] .. ">",
				"Koudao",
				"Leave"
			)
		end
		return
	elseif scene.dwMapID == 10 then	--寇岛不打开交通选择面板，直接文字选择目的地
		if not player.IsOpenRouteNode(47) then
			player.OpenRouteNode(47)
			player.SendSystemMessage(tTrafficChuanfu["firsttime"])
		end

		if not player.IsAchievementAcquired(tMapIDToAchievementID[scene.dwMapID]) then
			player.AcquireAchievement(tMapIDToAchievementID[scene.dwMapID])
		end
		if not CustomFunction.CheckMapTraffic(npc, player) then
			return
		end
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID)
			--.. "\n\n" .. "<$C " .. tTrafficChuanfu["donglizhai"] .. ">"    --取消此处回东篱的路线
			.. "\n" .. "<$C " .. tTrafficChuanfu["yangzhoucheng"].. ">"
			.. "\n\n" .. "<$C " .. tTrafficChuanfu["fangqi"] .. ">",
			"YangzhouKoudao",
			-- "YangzhouKoudao1",
			"Leave"
		)
		local nHour = GetCurrentHour()
		if nHour == 18 and npc.GetCustomInteger1(0) == 0 then
			npc.SetCustomInteger1(0, 1)
			scene.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/Traffic/世界通用船夫.lua", npc.dwID, nHour)
		end
		return
	elseif scene.dwMapID == 16 then	--七秀不打开交通选择面板，直接文字选择目的地
		if not player.IsOpenRouteNode(38) then
			player.OpenRouteNode(38)
			player.SendSystemMessage(tTrafficChuanfu["firsttime"])
		end
		if not player.IsAchievementAcquired(tMapIDToAchievementID[scene.dwMapID]) then
			player.AcquireAchievement(tMapIDToAchievementID[scene.dwMapID])
		end
		if not CustomFunction.CheckMapTraffic(npc, player) then
			return
		end
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID) .. "\n\n" .. "<$C " .. tTrafficChuanfu["yangzhou"] .. ">"
			.. "\n" .. "<$C " .. tTrafficChuanfu["fangqi"] .. ">",
			"YangzhouQixiu",
			"Leave"
		)
		return

	elseif scene.dwMapID == 49 then	--藏剑不打开交通选择面板，直接文字选择目的地
		if not player.IsOpenRouteNode(135) then
			player.OpenRouteNode(135)
			player.SendSystemMessage(tTrafficChuanfu["firsttime"])
		end
		if not player.IsAchievementAcquired(tMapIDToAchievementID[scene.dwMapID]) then
			player.AcquireAchievement(tMapIDToAchievementID[scene.dwMapID])
		end
		if not CustomFunction.CheckMapTraffic(npc, player) then
			return
		end
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID) .. "\n\n" .. "<$C " .. tTrafficChuanfu["yangzhou"] .. ">"
			.. "\n" .. "<$C " .. tTrafficChuanfu["fangqi"] .. ">",
			"YangzhouCangjian",
			"Leave"
		)
		return
	end

	if not player.IsOpenRouteNode(tMapIDToNeedOpenNode[scene.dwMapID]) then
		player.OpenRouteNode(tMapIDToNeedOpenNode[scene.dwMapID])
		player.SendSystemMessage(tTrafficChuanfu["firsttime"])
	end
	if not CustomFunction.CheckMapTraffic(npc, player) then
		return
	end
	player.OpenWindow(TARGET.NPC, npc.dwID,
		npc.GetAutoDialogString(player.dwID) .. "\n\n" .. "<U " .. tMapIDToNeedOpenNode[scene.dwMapID] .. " " .. tTrafficChuanfu["chenchuan"] .. ">"
		.. "\n" .. "<$C " .. tTrafficChuanfu["fangqi"] .. ">",
		"Leave"
	)
end
function OnDialogue01(player, nTargetType, dwTargetID, nIndex)
	local nQuestID1 = 8261
	local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
	local nQuestphase1 = player.GetQuestPhase(nQuestID1)
	if nQuestIndex1 and nQuestphase1 == 1 then
		player.OpenWindow(nTargetType, dwTargetID,
			GetEditorString(3, 9059) .. "\n" ..
			GetEditorString(3, 9060) .. "\n",
		"CloseWindow");
		player.SetQuestValue(nQuestIndex1, 0, 1)
		player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, 11886, 1)
	end
end
function CloseWindow(player, nTargetType, dwTargetID, nIndex)
	local npc = GetNpc(dwTargetID)
	if not npc then
		return
	end
end
function Qixiu(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querenqixiu"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToQixiu",
		"Leave"
	)
end

function ToQixiu(player, nTargetType, nTargetID, nIndex)
	if not player.IsOpenRouteNode(38) then  --特殊处理在这里打开七秀入门码头
		player.OpenRouteNode(38)
	end
	player.AutoFly(18, 16)
end

function Cangjian(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querencangjian"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToCangjian",
		"Leave"
	)
end

function ToCangjian(player, nTargetType, nTargetID, nIndex)
	if not player.IsOpenRouteNode(135) then  --特殊处理在这里打开藏剑入门码头
		player.OpenRouteNode(135)
	end
	player.AutoFly(18, 49)
end

function Koudao(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querenkoudao"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToKoudao",
		"Leave"
	)
end

function ToKoudao(player, nTargetType, nTargetID, nIndex)
	if not player.IsOpenRouteNode(47) then  --特殊处理在这里打开寇岛码头
		player.OpenRouteNode(47)
	end
	player.AutoFly(57, 10)
end

function Koudao1(player, nTargetType, nTargetID, nIndex) --新增加的扬州到寇岛路线
	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querenkoudao"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToKoudao1",
		"Leave"
	)
end
function ToKoudao1(player, nTargetType, nTargetID, nIndex)--新增加的扬州到寇岛路线
	if not player.IsOpenRouteNode(47) then  --特殊处理在这里打开寇岛码头
		player.OpenRouteNode(47)
	end
	player.AutoFly(18, 10)
end

function YangzhouKoudao(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querenyangzhou"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToYangzhouKoudao",
		"Leave"
	)
end
--[[
function YangzhouKoudao1(player, nTargetType, nTargetID, nIndex) --新增加寇岛返回扬州城路线

	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querenyangzhoucheng"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToYangzhouKoudao1",
		"Leave"
	)
end
--]]

function ToYangzhouKoudao(player, nTargetType, nTargetID, nIndex)

	if not player.IsOpenRouteNode(18) then
		player.OpenRouteNode(18)
	end

	player.AutoFly(47, 606)

end
--[[
function ToYangzhouKoudao1(player, nTargetType, nTargetID, nIndex) --新增加寇岛返回扬州城路线
	if not player.IsOpenRouteNode(18) then
		player.OpenRouteNode(18)
	end
	player.AutoFly(149,6)
end
--]]

function YangzhouQixiu(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querenyangzhou"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToYangzhouQixiu",
		"Leave"
	)
end

function ToYangzhouQixiu(player, nTargetType, nTargetID, nIndex)
	if not player.IsOpenRouteNode(18) then
		player.OpenRouteNode(18)
	end
	player.AutoFly(38, 606)
end

function YangzhouCangjian(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(nTargetType, nTargetID,
		tTrafficChuanfu["querenyangzhou"] .. "\n" ..
		tTrafficChuanfu["queren"] .. "\n" .. tTrafficChuanfu["jujue"],
		"ToYangzhouCangjian",
		"Leave"
	)
end

function ToYangzhouCangjian(player, nTargetType, nTargetID, nIndex)
	if not player.IsOpenRouteNode(18) then
		player.OpenRouteNode(18)
	end
	player.AutoFly(135, 606)

end

function Leave(player, nTargetType, nTargetID, nIndex)
	return
end

function OnTimer(scene, nParam1, nParam2)
	local npc = GetNpc(nParam1)
	if not npc then
		return
	end

	if nParam2 < 18 then
		npc.SetCustomInteger1(0, 0)
		return
	end

	npc.Yell(tTrafficChuanfu["huimenpai1"])
	npc.Yell(tTrafficChuanfu["huimenpai2"])
	local nHour = GetCurrentHour()
	scene.SetTimer(1200 * GLOBAL.GAME_FPS, "scripts/Traffic/世界通用船夫.lua", npc.dwID, nHour)
end

function GoToGaiBang(player, nTargetType, nTargetID, nIndex)
	player.OpenWindow(nTargetType, nTargetID,
		GetEditorString(5, 6992) .. "\n" ..
		"\n" .. "<$C " .. GetEditorString(5, 6986) .. ">" ..
		"\n" .. "<$C " .. GetEditorString(5, 6993) .. ">",
		"YesGoToGaiBang", 
		"Leave"
	)
end

function YesGoToGaiBang(player, nTargetType, nTargetID, nIndex)
	--通用禁止传送BUFF
	if player.GetBuff(10826, 1) then
		player.SendSystemMessage(GetEditorString(8, 9045))
		return
	end
	player.SetLastEntry(6, 1, 78782, 57598, 1048768, 8)
	player.TurnTo(102)
	player.SwitchMap(159, 72570, 58946, 1093504)
end

-- 死亡事件函数
function OnDeath(npc, killer)
	npc.ClearAllThreat()
	npc.nCurrentLife = npc.nMaxLife
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com