---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/OnEnterSceneCommon/过地图脚本_活动相关.lua
-- 更新时间:	2017/5/22 17:01:03
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<
--[[Include("scripts/Map/春节天街灯市/include/场景位面.lua")
Include("scripts/Map/ACT_元宵节/include/元宵节上下线处理.lua")
Include("scripts/Map/梦回稻香/include/梦回稻香头文件.lua")
Include("scripts/Map/世界奇遇/艺人奇遇/include/乱世舞姬_data.lua")
Include("scripts/Map/世界奇遇/绿林奇遇/include/Data.lua")
Include("scripts/Map/世界奇遇/护佑苍生/include/护佑苍生_data.lua")
Include("scripts/Map/ACT_血战天策预热/include/奖励增益.lua")
Include("scripts/Map/ACT_2014年3月预热/include/预热登陆加buff.lua")--]]

Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

local tBuffList_fan = {
	{11006, 1},
	{11007, 1},
	{11008, 1},
	{6785, 1},
}
local tChuanGong = {
	[2] = 0,
	[5] = 0,
	[7] = 0,
	[11] = 0,
	[16] = 0,
	[49] = 0,
	[102] = 0,
	[122] = 0,
}
local tAnShi80MapList = {

	[133] = true, --25烛龙殿
	[155] = true, --25南诏皇宫
}
local tZongziMapList = {
	--[[	[70] = true, -- 25人普通荻花圣殿
		[72] = true, -- 25人英雄荻花圣殿
		[117] = true, -- 25人英雄龙渊泽
		[118] = true, -- 25人普通龙渊泽
		[130] = true, -- 25人荻花洞窟
		[133] = true, -- 25人烛龙殿
			--]]
	[143] = true, --试炼之地
	[144] = true, --试炼之地
	[145] = true, --试炼之地
	[146] = true, --试炼之地
	[147] = true, --试炼之地
	[270] = true --英雄风雷刀谷·千雷殿
--		[171] = true, -- 25人战宝军械
--		[165] = true, -- 25人大明宫
--		[176] = true, -- 25人血战天策
	--[178] = true, -- 25人稻香村
	--[183] = true, -- 25人秦皇陵
	--[205] = true, -- 挑战太原之战_夜守孤城
	--[206] = true, -- 挑战太原之战_逐虎驱狼
}
local tMenpaiQuestList = {9817, 9824, 9825, 9826, 9827, 9828, 9829, 9830, 9831, 11184, 11185, }
local tMapAndAct = {	--活动ID，聊天提示，中间提示
	[22] = {
		387,
		GetEditorString(11, 6169),
		GetEditorString(11, 6182),
	}, --南屏
	[30] = {
		391,
		GetEditorString(11, 6170),
		GetEditorString(11, 6183),
	}, --昆仑
	[217] = {
		398,
		GetEditorString(11, 6171),
		GetEditorString(11, 6184),
	}, --黑戈壁
}
local 	tActQuest_KeRenMoYu = {7990, 7993, 7994, 7995, 7997, 7998, 7999, 8001}
local tDelBuff_NPKLZY = {
	{6346, 1},
	{6347, 1},
	{6348, 1},
	{6349, 1},
}
-- 此函数运行时间已到20MS，不可添加
function OnEnterSceneCommon_Activity0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- 正文开始
	tAct224_Function.EnterScene(player)--元宵节：上线不在副本则清除当次积分BUFF
	tTianJieDengShi.EnterScene(player)--清除意外出地图的玩家的位面
	----------梦回稻香处理----------
	MHDX_EnterScene(player, scene)--梦回稻香进场景处理
	player.DelBuff(10801, 1) -- 移除端午七彩风车buff

	-- 只在阴山大草原保留玩家进行黑市拍卖的无敌BUFF
	if scene.dwMapID ~= 216 and player.IsHaveBuff(10459, 1) then
		player.DelBuff(10459, 1)
	end
	if scene.dwMapID ~= 216 and player.IsHaveBuff(9850, 1) then
		player.DelBuff(9850, 1)
	end
	if player.nCamp ~= 0 and not tGFCampScoreData.IsInWarMap(player) then -- 大攻防挂机BUFF
		tGFCampScoreData.DelZKDebuff(player)
	end

	--出太原清pq贡献
	for i = 1, 36 do
		player.ClearPlayerPQValue(i)
	end

	if player.IsHaveBuff(3897, 1) then
		if not tChuanGong[scene.dwMapID] then
			player.DelBuff(3897, 1)
		end
	end

	--玩家上线如果不是在大梦迷境中删除buff处理---
	if scene.dwMapID ~= 245 then

		for _, v in ipairs(tBuffList_fan) do
			if player.IsHaveBuff(v[1], v[2]) then
				player.DelBuff(v[1], v[2])
			end
		end
	end

	-- 这里处理安史之乱强力80级buff出场景消失

	local nAnShi80BuffID = 6441
	if not tAnShi80MapList[scene.dwMapID] then
		for i = 1, 4 do
			if player.IsHaveBuff(nAnShi80BuffID, i) then
				player.DelBuff(nAnShi80BuffID, i)
			end
		end
	end

	-- 这里处理端午节活动的粽子进入25人秘境就消除效果

	if tZongziMapList[scene.dwMapID] then
		if player.IsHaveBuff(1965, 1) then
			player.DelBuff(1965, 1)
		end
		if player.IsHaveBuff(1960, 1) then
			player.DelBuff(1960, 1)
		end
		if player.IsHaveBuff(1961, 1) then
			player.DelBuff(1961, 1)
		end
		if player.IsHaveBuff(1962, 1) then
			player.DelBuff(1962, 1)
		end
		local nZongziBuffID = 2992
		for i = 1, 10 do
			if i ~= 9 and player.IsHaveBuff(nZongziBuffID, i) then
				player.DelBuff(nZongziBuffID, i)
			end
		end
	end

	-- 冬至活动副本物品出三才阵时删除
	if scene.dwMapID ~= 20 then
		local tItemNum = {}
		tItemNum[1] = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 5266)
		tItemNum[2] = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 5263)
		tItemNum[3] = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 5264)
		if tItemNum[1] > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 5266, tItemNum[1])
		end
		if tItemNum[2] > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 5263, tItemNum[2])
		end
		if tItemNum[3] > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 5264, tItemNum[3])
		end
	end

	-- 对可能已经完成过门派事件的任务做一次处理。

	for i = 1, #tMenpaiQuestList do
		local questID = tMenpaiQuestList[i]
		if player.GetQuestPhase(questID) == 3 then
			player.ClearQuest(questID)
		end
	end

	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

-- 一次性活动
-- ,此函数运行时间已到20MS，不可添加
function OnEnterSceneCommon_Activity1(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- 正文开始

	-- 2014.12.22峰值
	--local tDate = TimeToDate(GetCurrentTime());
	local nLimitTime = DateToTime(2015, 9, 7, 23, 0, 0)
	if player.szName == GetEditorString(4, 6183) and (scene.dwMapID == 13 or scene.dwMapID == 23 or scene.dwMapID == 104 or scene.dwMapID == 101)
		and GetCurrentTime() <= nLimitTime then
		RemoteCallToCenter("On_Map_SetSpecialActivityState", scene.dwMapID, 301, 1);
	end
	local BuffBeBoss = player.GetBuff(8686, 0);
	if BuffBeBoss then
		player.AddBuff(0, 99, 8704, 1, 1);
		player.DelBuff(8686, BuffBeBoss.nLevel)
	end

	--- 苍云预热活动界面BUFF
	if (scene.dwMapID == 151 or scene.dwMapID == 156) and IsActivityOn(278) then
		local nCount = 7 * 24 * 3600 / 5;--7day
		if scene.dwMapID == 151 then
			player.AddBuff(0, 99, 8377, 1, nCount);
			player.DelBuff(8377, 2);
		elseif scene.dwMapID == 156 then
			local nCount = 7 * 24 * 3600 / 5;--7day
			player.AddBuff(0, 99, 8377, 2, nCount);
			player.DelBuff(8377, 1);
		end
	else
		player.DelBuff(8377, 1);
		player.DelBuff(8377, 2);
	end

	if player.GetMapID() ~= 2 then
		player.DelGroupBuff(1653, 1);
		player.DelGroupBuff(1653, 2);
	end

	Yure201403_AddBuff(player)

	--增加峰值活动buff跳数
	--[[
	local nTime1202 = GetCurrentTime()
	local buff1202 = player.GetBuff(7217, 1)
	if nTime1202 < DateToTime(2013, 12, 3, 22, 30, 0) and buff1202 then
		if buff1202.nLeftActiveCount > math.floor((DateToTime(2013, 12, 4, 7, 0, 0) - GetCurrentTime()) / 60) then
			--正常buff
		else
			--非正常buff
			buff1202.nLeftActiveCount = buff1202.nLeftActiveCount + 32 * 60
		end
	end
	--]]
	-- 逼婚GWW活动结束时对应任务处理
	local nTime = GetCurrentTime()
	local nEndTime = DateToTime(2013, 3, 18, 22, 0, 0)
	if nTime > nEndTime then
		local dwQuestID = 10581
		local nQuestIndex = player.GetQuestIndex(dwQuestID)
		if nQuestIndex then
			player.SendSystemMessage(GetEditorString(5, 1275))
			player.SetQuestFailedFlag(nQuestIndex, true)	-- 活动结束将玩家身上的任务设置为失败状态
		end
	end

	local YYZJLquestID = 8031
	local nQuestIndexYYZJL = player.GetQuestIndex(YYZJLquestID)
	if nQuestIndexYYZJL then
		player.CancelQuest(nQuestIndexYYZJL)
	end

	if IsActivityOn(272) then
		player.AddBuff(0, 99, 8158, 1, 9000)  --不醉不归活动 BUFF总监控
	end

	--2014.8.28周年庆活动
	if IsActivityOn(273)  then
		if not player.IsHaveBuff(8180, 1) then
			local nTime828 = GetCurrentTime()
			local nEnd828 = DateToTime(2014, 9, 15, 7, 0, 0)
			local nTiaoshu = math.floor((nEnd828 - nTime828) / 60)
			player.AddBuff(0, 99, 8180, 1, nTiaoshu)  --五周年增益BUFF
		end
--[[		if not player.IsHaveBuff(3219, 10) then
		local nTime828 = GetCurrentTime()
		local nEnd828 =DateToTime(2014, 9, 15, 7, 0, 0)
		local nTiaoshu1 = math.floor((nEnd828 - nTime828) / 10)
		player.AddBuff(0, 99, 3219, 10, nTiaoshu1)  --五人本和10人本额外掉落一件装备
	end--]]
	end

	--分流活动过图提示
	local buffShenxingLog = player.GetBuff(11927, 1)
	if buffShenxingLog then
		--print("targetMapID:"..buffShenxingLog.nCustomValue)

		local targetMapID = buffShenxingLog.nCustomValue
		if scene.dwMapID ~= targetMapID and tMapAndAct[targetMapID] then	--当前地图和神行目标地图ID不一致，说明是进图失败被丢回来了
			if IsActivityOn(tMapAndAct[targetMapID][1]) then 
				player.SendSystemMessage(tMapAndAct[targetMapID][2])
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", tMapAndAct[targetMapID][3], 4)
			end
		end
	end

	--这段脚本用于删除昆仑南屏之役的任务
	OnEnterSceneDeleteActQuest(player)

	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

function OnEnterSceneDeleteActQuest(player)
	local nHour = GetCurrentHour()
	local nWeekday = GetCurrentWeekDay()
	--这段脚本用于删除昆仑南屏之役的任务
	if (nWeekday == 2 and nHour >= 10)or (nWeekday == 3 and nHour < 7) then
		return
	end
	if (nWeekday == 4 and nHour >= 10)or (nWeekday == 5 and nHour < 7) then
		return
	end

	for i = 1, #tActQuest_KeRenMoYu do
		local nQuestIndex = player.GetQuestIndex(tActQuest_KeRenMoYu[i])
		if nQuestIndex then
			player.CancelQuest(nQuestIndex)
		end
	end

	for i = 1, #tDelBuff_NPKLZY do
		player.DelBuff(tDelBuff_NPKLZY[i][1], tDelBuff_NPKLZY[i][2])
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com