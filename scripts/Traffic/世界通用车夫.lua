---------------------------------------------------------------------->
-- 脚本名称:	世界车夫.lua
-- 更新时间:	09/09/08 15:10:42
-- 更新用户:	zhouhengda
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/Traffic/Include/trafficstring.ls")
-- mapid与交通需要开通的NODEID对照表，其中KEY为MAPID，VALUE为NODEID
tMapIDToNeedOpenNode = {
    [2] = 13, -- 万花
    [5] = 9,  -- 少林
    [6] = 24, -- 扬州
    [7] = 7,  -- 纯阳
    [8] = 41, -- 洛阳
    [9] = 21, -- 洛道
    [11] = 11, -- 天策
    [12] = 49, -- 枫华谷
    [13] = 15, -- 金水镇
    [15] = 36, -- 长安
    [23] = 101, -- 龙门荒漠
    [30] = 87, -- 昆仑
    [21] = 97, -- 巴陵
    [35] = 99, -- 瞿塘峡
    [22] = 91, -- 南屏山
    [27] = 116, -- 恶人谷
    [25] = 105, -- 恶人谷对立
    [100] = 342, -- 白龙
    [101] = 435, -- 无量
    [102] = 345, -- 五毒
    [103] = 432, -- 融天
    [104] = 217, -- 黑龙
    [108] = 440, -- 成都
    [122] = 516, -- 唐门
    [105] = 651, -- 苍山洱海
	[150] = 681, --明教
}

tMapIDToAchievementID = {
    [2] = 437, -- 万花
    [5] = 577,  -- 少林
    [6] = 443, -- 扬州
    [7] = 578,  -- 纯阳
    [8] = 441, -- 洛阳
    [9] = 445, -- 洛道
    [11] = 439, -- 天策
    [12] = 447, -- 枫华谷
    [13] = 448, -- 金水镇
    [15] = 442, -- 长安
    [23] = 449, -- 龙门荒漠
    [30] = 450, -- 昆仑
    [21] = 452, -- 巴陵
    [35] = 453, -- 瞿塘峡
    [22] = 451, -- 南屏山
    --[27] = XX, -- 恶人谷
    --[25] = XX, -- 浩气盟
}

function OnDialogue(npc, player)
    local scene = npc.GetScene()
    if not scene then
        return
    end
    if not player.IsOpenRouteNode(tMapIDToNeedOpenNode[scene.dwMapID]) then
        player.OpenRouteNode(tMapIDToNeedOpenNode[scene.dwMapID])
        player.SendSystemMessage(tTrafficMafu["firsttime"])
    end
	
    if tMapIDToAchievementID[scene.dwMapID] then
        if not player.IsAchievementAcquired(tMapIDToAchievementID[scene.dwMapID]) then
            player.AcquireAchievement(tMapIDToAchievementID[scene.dwMapID])
        end
    end
    
	if not CustomFunction.CheckMapTraffic(npc, player) then
		return
	end
	
    player.OpenWindow(TARGET.NPC, npc.dwID, 
        npc.GetAutoDialogString(player.dwID) .. "\n\n" .. "<U " .. tMapIDToNeedOpenNode[scene.dwMapID] .. " " .. tTrafficMafu["chengche"] .. ">"
        .. "\n" .. "<$C " .. tTrafficMafu["fangqi"] .. ">",
        "leave"
    )
    if scene.dwMapID ~= 2 and scene.dwMapID ~= 5 and scene.dwMapID ~= 11 and scene.dwMapID ~= 7 and scene.dwMapID ~= 102 then --排除门派地图
        local nHour = GetCurrentHour()
        if nHour == 18 and npc.GetCustomInteger1(0) == 0 then
            npc.SetCustomInteger1(0, 1)
            scene.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/Traffic/世界通用车夫.lua", npc.dwID, nHour)
        end
    end
end

function leave(player, nTargetType, nTargetID, nIndex)
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
	
    npc.Yell(tTrafficMafu["menpaidazuo1"])
    npc.Yell(tTrafficMafu["menpaidazuo2"])
    local nHour = GetCurrentHour()
    scene.SetTimer(1200 * GLOBAL.GAME_FPS, "scripts/Traffic/世界通用车夫.lua", npc.dwID, nHour)
end
	
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com