---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/OnEnterSceneCommon/过地图脚本_场景相关.lua
-- 更新时间:	2017/5/22 16:55:33
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

local tFengZhengBuff = {3160, 3161, 3166, 3213}
local tBuffList_139 = {
	{5249, 1},
	{5249, 2},
	{5242, 1},
	{5300, 1},
	{5400, 1},
	{5401, 1},
	{5218, 1},
	{5462, 1},
	{5463, 1},
	{5464, 1},
	{5465, 1},
	{5466, 1},
}
local tCANC_DelBuff = {--出长安内城删buff
	{6798, 1},
	{6799, 1},
	{6732, 1},
	{6526, 1},
	{6734, 1},
	{2587, 6},
	{2587, 7},
}
local tWabaoFubenDaojuMapList = {
	[14] = true, -- 灵霄峡
	[17] = true, -- 天工坊
	[18] = true, -- 无盐岛
	[19] = true, -- 空雾峰
	[20] = true, -- 天地三才阵
	[26] = true, -- 荻花宫前山
	[28] = true, -- 日轮山城
	[33] = true, -- 天子峰
	[34] = true, -- 风雨稻香村
	[36] = true, -- 英雄天地三才阵
	[37] = true, -- 英雄天工坊
	[40] = true, -- 英雄荻花宫前山
	[41] = true, -- 英雄无盐岛
	[42] = true, -- 英雄天子峰
	[43] = true, -- 英雄空雾峰
	[44] = true, -- 英雄日轮山城
	[45] = true, -- 英雄灵霄峡
	[47] = true, -- 英雄风雨稻香村
	[51] = true, -- 剑冢
	[62] = true, -- 英雄剑冢
}
local tBuffList_RTL = {
	[1] = {dwBuffID = 2369, tBuffLevel = {1}},
	[2] = {dwBuffID = 2370, tBuffLevel = {1}},
	[3] = {dwBuffID = 2371, tBuffLevel = {1}},
	[4] = {dwBuffID = 2372, tBuffLevel = {1}},
	[5] = {dwBuffID = 2373, tBuffLevel = {1}},
	[6] = {dwBuffID = 2374, tBuffLevel = {1}},
}
local tBuffList_159 = {
	{6172, 1},
}
-- 此函数运行时间已到20MS，不可添加
function OnEnterSceneCommon_NormalMap0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- 正文开始

	--这段脚本用于删除白羽焰翼的各种Buff
	for i = 1, #tFengZhengBuff do
		if player.IsHaveBuff(tFengZhengBuff[i], 1) then
			player.DelBuff(tFengZhengBuff[i], 1)
		end
	end

	-- 删除五毒场景BUFF
	if scene.dwMapID ~= 102 then
		for i = 2815, 2826 do
			local buff = player.GetBuff(i, 1)
			if buff then
				for i = 1, buff.nStackNum do
					player.DelBuff(i, 1)
				end
			end
		end
	end

	--删除场景中增益BUFF(王新峰)
	if scene.dwMapID ~= 104 then
		local buff_1 = player.GetBuff(2520, 1)
		if buff_1 then
			for i = 1, buff_1.nStackNum do
				player.DelBuff(2520, 1)
			end
		end
	end

	--删除唐门、七秀地图任务水中速游BUFF(蒋喆斐)
	if scene.dwMapID ~= 122 or scene.dwMapID ~= 16 then
		local buff_1 = player.GetBuff(3451, 1)
		if buff_1 then
			for i = 1, buff_1.nStackNum do
				player.DelBuff(3451, 1)
			end
		end
		--删除唐门门派事件契合BUFF
		if player.IsHaveBuff(10489, 1) then
			player.DelGroupBuff(10489, 1)
		end
	end

	--删除唐门地图任务水下呼吸BUFF(蒋喆斐)
	if scene.dwMapID ~= 122 then
		local buff_2 = player.GetBuff(3450, 1)
		if buff_2 then
			for i = 1, buff_2.nStackNum do
				player.DelBuff(3450, 1)
			end
		end
	end
	--删除丐帮buff
	if scene.dwMapID ~= 159 then

		for _, v in ipairs(tBuffList_159) do
			if player.IsHaveBuff(v[1], v[2]) then
				player.DelBuff(v[1], v[2])
			end
		end
	end

	--删除安史之乱_枫华谷地图任务伪装BUFF(蒋喆斐)
	if scene.dwMapID ~= 139 then
		for _, v in ipairs(tBuffList_139) do
			if player.IsHaveBuff(v[1], v[2]) then
				player.DelBuff(v[1], v[2])
			end
		end
	end

	if scene.dwMapID ~= 30 then
		for j = 1191, 1197 do
			local buff_2 = player.GetBuff(j, 1)
			if buff_2 then
				for i = 1, buff_2.nStackNum do
					player.DelBuff(j, 1)
				end
			end
		end
	end
	if scene.dwMapID ~= 172 then
		for i = 1, #tCANC_DelBuff do
			if player.IsHaveBuff(tCANC_DelBuff[i][1], tCANC_DelBuff[i][2]) then
				player.DelBuff(tCANC_DelBuff[i][1], tCANC_DelBuff[i][2])
			end
		end

		local nQuestID = 11585  --天知地知我也知
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		if nQuestIndex and nQuestPhase == 1 then
			player.SetQuestFailedFlag(nQuestIndex, true)
		end
	end

	--if scene.dwMapID ~= 22 and scene.dwMapID ~= 25 and scene.dwMapID ~= 27 and scene.dwMapID ~= 30 then
	for i = 1, 5 do
		if player.IsHaveBuff(1413, i) then
			player.DelBuff(1413, i)
		end
	end
	--end

	--这里用来处理如果玩家进入的场景不是阴山大草原(216)的buff处理和道具处理
	if scene.dwMapID ~= 216 then
		if player.IsHaveBuff(5236, 1) then
			player.DelGroupBuff(5236, 1)
		end
	end

	--这是用来处理如果玩家进入的场景不是守株围场（55）就删除BUFF【猎人的守护】
	if player.IsHaveBuff(1848, 1) and scene.dwMapID ~= 55 then
		player.DelGroupBuff(1848, 1)
	end
	--这里用来处理如果玩家进入的场景不是宇文宝藏（57）就删除道具[鹧鸪弓][凝肌散]
	local ItemAmount6222 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6222)
	local ItemAmount6223 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6223)
	local ItemAmount6688 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6688)
	local ItemAmount6545 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6545)
	if scene.dwMapID ~= 57 then
		if ItemAmount6222 > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 6222, ItemAmount6222)
		end
		if ItemAmount6223 > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 6223, ItemAmount6223)
		end
		if ItemAmount6688 > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 6688, ItemAmount6688)
		end
		if ItemAmount6545 > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 6545, ItemAmount6545)
		end
	end

	--这是用来处理如果玩家进入的场景不是邀星坪（53）就删除BUFF【灯落】
	if player.IsHaveBuff(1833, 1) and scene.dwMapID ~= 53 then
		player.DelGroupBuff(1833, 1)
	end

	-- 这里处理挖宝出的副本用的道具

	if player.IsHaveBuff(1813, 0) and not tWabaoFubenDaojuMapList[scene.dwMapID] then
		player.DelBuff(1813, 1)
	end

	if player.IsHaveBuff(1814, 0) and not tWabaoFubenDaojuMapList[scene.dwMapID] then
		player.DelBuff(1814, 1)
	end

	if player.IsHaveBuff(1815, 0) and not tWabaoFubenDaojuMapList[scene.dwMapID] then
		player.DelBuff(1815, 1)
	end

	if player.IsHaveBuff(1816, 0) and not tWabaoFubenDaojuMapList[scene.dwMapID] then
		player.DelBuff(1816, 1)
	end

	--离开融天岭场景删除变装buff

	if scene.dwMapID ~= 103 then
		for i = 1, #tBuffList_RTL do
			if player.IsHaveBuff(tBuffList_RTL[i].dwBuffID, 1) then
				player.DelGroupBuff(tBuffList_RTL[i].dwBuffID, 1)
			end
		end
	end
	--离开无量山场景删除变装buff
	if scene.dwMapID ~= 101 then
		if player.IsHaveBuff(2721, 1) or player.IsHaveBuff(2722, 1) then
			player.DelGroupBuff(2721, 1)
			player.DelGroupBuff(2722, 1)
		end
	end

	--删除苍山洱海特殊BUFF
	--清除BUFF：乃古修的庇护
	if scene.dwMapID ~= 105 then
		local nBuffID = 3587
		if player.IsHaveBuff(nBuffID, 1) then
			player.DelBuff(nBuffID, 1)
		end
		--清除BUFF：占卜里的各种
		local nBuffID1 = 3607
		local nBuffID2 = 3953

		if player.IsHaveBuff(nBuffID2, 1) then
			for i = 1, 38 do
				if player.IsHaveBuff(nBuffID1, i) then
					player.DelBuff(nBuffID1, i)
				end
			end
		end
		--醉酒BUFF
		local nBuffID3 = 3169
		for i = 1, 6 do
			if player.IsHaveBuff(nBuffID3, i) then
				player.DelBuff(nBuffID3, i)
			end
		end
		local nBuffID4 = 3933
		if player.IsHaveBuff(nBuffID4, 1) then
			player.DelBuff(nBuffID4, 1)
		end
	end

	-- 稻香村空明诀处理
	if scene.dwMapID ~= 1 then
		player.DelBuff(1160, 1)
	end

	-- 马嵬驿换装处理
	if scene.dwMapID ~= 153 then
		player.DelBuff(5448, 1)
		player.DelBuff(5351, 1)
	end

	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com