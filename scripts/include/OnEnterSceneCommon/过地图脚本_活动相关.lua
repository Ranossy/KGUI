---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_����.lua
-- ����ʱ��:	2017/5/22 17:01:03
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
--[[Include("scripts/Map/������ֵ���/include/����λ��.lua")
Include("scripts/Map/ACT_Ԫ����/include/Ԫ���������ߴ���.lua")
Include("scripts/Map/�λص���/include/�λص���ͷ�ļ�.lua")
Include("scripts/Map/��������/��������/include/�����輧_data.lua")
Include("scripts/Map/��������/��������/include/Data.lua")
Include("scripts/Map/��������/���Ӳ���/include/���Ӳ���_data.lua")
Include("scripts/Map/ACT_Ѫս���Ԥ��/include/��������.lua")
Include("scripts/Map/ACT_2014��3��Ԥ��/include/Ԥ�ȵ�½��buff.lua")--]]

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

	[133] = true, --25������
	[155] = true, --25��گ�ʹ�
}
local tZongziMapList = {
	--[[	[70] = true, -- 25����ͨݶ��ʥ��
		[72] = true, -- 25��Ӣ��ݶ��ʥ��
		[117] = true, -- 25��Ӣ����Ԩ��
		[118] = true, -- 25����ͨ��Ԩ��
		[130] = true, -- 25��ݶ������
		[133] = true, -- 25��������
			--]]
	[143] = true, --����֮��
	[144] = true, --����֮��
	[145] = true, --����֮��
	[146] = true, --����֮��
	[147] = true, --����֮��
	[270] = true --Ӣ�۷��׵��ȡ�ǧ�׵�
--		[171] = true, -- 25��ս����е
--		[165] = true, -- 25�˴�����
--		[176] = true, -- 25��Ѫս���
	--[178] = true, -- 25�˵����
	--[183] = true, -- 25���ػ���
	--[205] = true, -- ��ս̫ԭ֮ս_ҹ�ع³�
	--[206] = true, -- ��ս̫ԭ֮ս_������
}
local tMenpaiQuestList = {9817, 9824, 9825, 9826, 9827, 9828, 9829, 9830, 9831, 11184, 11185, }
local tMapAndAct = {	--�ID��������ʾ���м���ʾ
	[22] = {
		387,
		GetEditorString(11, 6169),
		GetEditorString(11, 6182),
	}, --����
	[30] = {
		391,
		GetEditorString(11, 6170),
		GetEditorString(11, 6183),
	}, --����
	[217] = {
		398,
		GetEditorString(11, 6171),
		GetEditorString(11, 6184),
	}, --�ڸ��
}
local 	tActQuest_KeRenMoYu = {7990, 7993, 7994, 7995, 7997, 7998, 7999, 8001}
local tDelBuff_NPKLZY = {
	{6346, 1},
	{6347, 1},
	{6348, 1},
	{6349, 1},
}
-- �˺�������ʱ���ѵ�20MS���������
function OnEnterSceneCommon_Activity0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ
	tAct224_Function.EnterScene(player)--Ԫ���ڣ����߲��ڸ�����������λ���BUFF
	tTianJieDengShi.EnterScene(player)--����������ͼ����ҵ�λ��
	----------�λص��㴦��----------
	MHDX_EnterScene(player, scene)--�λص������������
	player.DelBuff(10801, 1) -- �Ƴ������߲ʷ糵buff

	-- ֻ����ɽ���ԭ������ҽ��к����������޵�BUFF
	if scene.dwMapID ~= 216 and player.IsHaveBuff(10459, 1) then
		player.DelBuff(10459, 1)
	end
	if scene.dwMapID ~= 216 and player.IsHaveBuff(9850, 1) then
		player.DelBuff(9850, 1)
	end
	if player.nCamp ~= 0 and not tGFCampScoreData.IsInWarMap(player) then -- �󹥷��һ�BUFF
		tGFCampScoreData.DelZKDebuff(player)
	end

	--��̫ԭ��pq����
	for i = 1, 36 do
		player.ClearPlayerPQValue(i)
	end

	if player.IsHaveBuff(3897, 1) then
		if not tChuanGong[scene.dwMapID] then
			player.DelBuff(3897, 1)
		end
	end

	--���������������ڴ����Ծ���ɾ��buff����---
	if scene.dwMapID ~= 245 then

		for _, v in ipairs(tBuffList_fan) do
			if player.IsHaveBuff(v[1], v[2]) then
				player.DelBuff(v[1], v[2])
			end
		end
	end

	-- ���ﴦ��ʷ֮��ǿ��80��buff��������ʧ

	local nAnShi80BuffID = 6441
	if not tAnShi80MapList[scene.dwMapID] then
		for i = 1, 4 do
			if player.IsHaveBuff(nAnShi80BuffID, i) then
				player.DelBuff(nAnShi80BuffID, i)
			end
		end
	end

	-- ���ﴦ�����ڻ�����ӽ���25���ؾ�������Ч��

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

	-- �����������Ʒ��������ʱɾ��
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

	-- �Կ����Ѿ���ɹ������¼���������һ�δ���

	for i = 1, #tMenpaiQuestList do
		local questID = tMenpaiQuestList[i]
		if player.GetQuestPhase(questID) == 3 then
			player.ClearQuest(questID)
		end
	end

	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

-- һ���Ի
-- ,�˺�������ʱ���ѵ�20MS���������
function OnEnterSceneCommon_Activity1(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ

	-- 2014.12.22��ֵ
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

	--- ����Ԥ�Ȼ����BUFF
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

	--���ӷ�ֵ�buff����
	--[[
	local nTime1202 = GetCurrentTime()
	local buff1202 = player.GetBuff(7217, 1)
	if nTime1202 < DateToTime(2013, 12, 3, 22, 30, 0) and buff1202 then
		if buff1202.nLeftActiveCount > math.floor((DateToTime(2013, 12, 4, 7, 0, 0) - GetCurrentTime()) / 60) then
			--����buff
		else
			--������buff
			buff1202.nLeftActiveCount = buff1202.nLeftActiveCount + 32 * 60
		end
	end
	--]]
	-- �ƻ�GWW�����ʱ��Ӧ������
	local nTime = GetCurrentTime()
	local nEndTime = DateToTime(2013, 3, 18, 22, 0, 0)
	if nTime > nEndTime then
		local dwQuestID = 10581
		local nQuestIndex = player.GetQuestIndex(dwQuestID)
		if nQuestIndex then
			player.SendSystemMessage(GetEditorString(5, 1275))
			player.SetQuestFailedFlag(nQuestIndex, true)	-- �������������ϵ���������Ϊʧ��״̬
		end
	end

	local YYZJLquestID = 8031
	local nQuestIndexYYZJL = player.GetQuestIndex(YYZJLquestID)
	if nQuestIndexYYZJL then
		player.CancelQuest(nQuestIndexYYZJL)
	end

	if IsActivityOn(272) then
		player.AddBuff(0, 99, 8158, 1, 9000)  --������ BUFF�ܼ��
	end

	--2014.8.28������
	if IsActivityOn(273)  then
		if not player.IsHaveBuff(8180, 1) then
			local nTime828 = GetCurrentTime()
			local nEnd828 = DateToTime(2014, 9, 15, 7, 0, 0)
			local nTiaoshu = math.floor((nEnd828 - nTime828) / 60)
			player.AddBuff(0, 99, 8180, 1, nTiaoshu)  --����������BUFF
		end
--[[		if not player.IsHaveBuff(3219, 10) then
		local nTime828 = GetCurrentTime()
		local nEnd828 =DateToTime(2014, 9, 15, 7, 0, 0)
		local nTiaoshu1 = math.floor((nEnd828 - nTime828) / 10)
		player.AddBuff(0, 99, 3219, 10, nTiaoshu1)  --���˱���10�˱��������һ��װ��
	end--]]
	end

	--�������ͼ��ʾ
	local buffShenxingLog = player.GetBuff(11927, 1)
	if buffShenxingLog then
		--print("targetMapID:"..buffShenxingLog.nCustomValue)

		local targetMapID = buffShenxingLog.nCustomValue
		if scene.dwMapID ~= targetMapID and tMapAndAct[targetMapID] then	--��ǰ��ͼ������Ŀ���ͼID��һ�£�˵���ǽ�ͼʧ�ܱ���������
			if IsActivityOn(tMapAndAct[targetMapID][1]) then 
				player.SendSystemMessage(tMapAndAct[targetMapID][2])
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", tMapAndAct[targetMapID][3], 4)
			end
		end
	end

	--��νű�����ɾ����������֮�۵�����
	OnEnterSceneDeleteActQuest(player)

	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

function OnEnterSceneDeleteActQuest(player)
	local nHour = GetCurrentHour()
	local nWeekday = GetCurrentWeekDay()
	--��νű�����ɾ����������֮�۵�����
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

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com