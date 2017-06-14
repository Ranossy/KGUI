---------------------------------------------------------------------->
-- �ű�����:	���糵��.lua
-- ����ʱ��:	09/09/08 15:10:42
-- �����û�:	zhouhengda
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/Traffic/Include/trafficstring.ls")
-- mapid�뽻ͨ��Ҫ��ͨ��NODEID���ձ�����KEYΪMAPID��VALUEΪNODEID
tMapIDToNeedOpenNode = {
    [2] = 13, -- ��
    [5] = 9,  -- ����
    [6] = 24, -- ����
    [7] = 7,  -- ����
    [8] = 41, -- ����
    [9] = 21, -- ���
    [11] = 11, -- ���
    [12] = 49, -- �㻪��
    [13] = 15, -- ��ˮ��
    [15] = 36, -- ����
    [23] = 101, -- ���Ż�Į
    [30] = 87, -- ����
    [21] = 97, -- ����
    [35] = 99, -- ����Ͽ
    [22] = 91, -- ����ɽ
    [27] = 116, -- ���˹�
    [25] = 105, -- ���˹ȶ���
    [100] = 342, -- ����
    [101] = 435, -- ����
    [102] = 345, -- �嶾
    [103] = 432, -- ����
    [104] = 217, -- ����
    [108] = 440, -- �ɶ�
    [122] = 516, -- ����
    [105] = 651, -- ��ɽ����
	[150] = 681, --����
}

tMapIDToAchievementID = {
    [2] = 437, -- ��
    [5] = 577,  -- ����
    [6] = 443, -- ����
    [7] = 578,  -- ����
    [8] = 441, -- ����
    [9] = 445, -- ���
    [11] = 439, -- ���
    [12] = 447, -- �㻪��
    [13] = 448, -- ��ˮ��
    [15] = 442, -- ����
    [23] = 449, -- ���Ż�Į
    [30] = 450, -- ����
    [21] = 452, -- ����
    [35] = 453, -- ����Ͽ
    [22] = 451, -- ����ɽ
    --[27] = XX, -- ���˹�
    --[25] = XX, -- ������
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
    if scene.dwMapID ~= 2 and scene.dwMapID ~= 5 and scene.dwMapID ~= 11 and scene.dwMapID ~= 7 and scene.dwMapID ~= 102 then --�ų����ɵ�ͼ
        local nHour = GetCurrentHour()
        if nHour == 18 and npc.GetCustomInteger1(0) == 0 then
            npc.SetCustomInteger1(0, 1)
            scene.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/Traffic/����ͨ�ó���.lua", npc.dwID, nHour)
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
    scene.SetTimer(1200 * GLOBAL.GAME_FPS, "scripts/Traffic/����ͨ�ó���.lua", npc.dwID, nHour)
end
	
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com