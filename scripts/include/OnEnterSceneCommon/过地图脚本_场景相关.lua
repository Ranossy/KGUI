---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_�������.lua
-- ����ʱ��:	2017/5/22 16:55:33
-- �����û�:	zhengfeng5
-- �ű�˵��:
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
local tCANC_DelBuff = {--�������ڳ�ɾbuff
	{6798, 1},
	{6799, 1},
	{6732, 1},
	{6526, 1},
	{6734, 1},
	{2587, 6},
	{2587, 7},
}
local tWabaoFubenDaojuMapList = {
	[14] = true, -- ����Ͽ
	[17] = true, -- �칤��
	[18] = true, -- ���ε�
	[19] = true, -- �����
	[20] = true, -- ���������
	[26] = true, -- ݶ����ǰɽ
	[28] = true, -- ����ɽ��
	[33] = true, -- ���ӷ�
	[34] = true, -- ���굾���
	[36] = true, -- Ӣ�����������
	[37] = true, -- Ӣ���칤��
	[40] = true, -- Ӣ��ݶ����ǰɽ
	[41] = true, -- Ӣ�����ε�
	[42] = true, -- Ӣ�����ӷ�
	[43] = true, -- Ӣ�ۿ����
	[44] = true, -- Ӣ������ɽ��
	[45] = true, -- Ӣ������Ͽ
	[47] = true, -- Ӣ�۷��굾���
	[51] = true, -- ��ڣ
	[62] = true, -- Ӣ�۽�ڣ
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
-- �˺�������ʱ���ѵ�20MS���������
function OnEnterSceneCommon_NormalMap0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ

	--��νű�����ɾ����������ĸ���Buff
	for i = 1, #tFengZhengBuff do
		if player.IsHaveBuff(tFengZhengBuff[i], 1) then
			player.DelBuff(tFengZhengBuff[i], 1)
		end
	end

	-- ɾ���嶾����BUFF
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

	--ɾ������������BUFF(���·�)
	if scene.dwMapID ~= 104 then
		local buff_1 = player.GetBuff(2520, 1)
		if buff_1 then
			for i = 1, buff_1.nStackNum do
				player.DelBuff(2520, 1)
			end
		end
	end

	--ɾ�����š������ͼ����ˮ������BUFF(�����)
	if scene.dwMapID ~= 122 or scene.dwMapID ~= 16 then
		local buff_1 = player.GetBuff(3451, 1)
		if buff_1 then
			for i = 1, buff_1.nStackNum do
				player.DelBuff(3451, 1)
			end
		end
		--ɾ�����������¼�����BUFF
		if player.IsHaveBuff(10489, 1) then
			player.DelGroupBuff(10489, 1)
		end
	end

	--ɾ�����ŵ�ͼ����ˮ�º���BUFF(�����)
	if scene.dwMapID ~= 122 then
		local buff_2 = player.GetBuff(3450, 1)
		if buff_2 then
			for i = 1, buff_2.nStackNum do
				player.DelBuff(3450, 1)
			end
		end
	end
	--ɾ��ؤ��buff
	if scene.dwMapID ~= 159 then

		for _, v in ipairs(tBuffList_159) do
			if player.IsHaveBuff(v[1], v[2]) then
				player.DelBuff(v[1], v[2])
			end
		end
	end

	--ɾ����ʷ֮��_�㻪�ȵ�ͼ����αװBUFF(�����)
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

		local nQuestID = 11585  --��֪��֪��Ҳ֪
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

	--�����������������ҽ���ĳ���������ɽ���ԭ(216)��buff����͵��ߴ���
	if scene.dwMapID ~= 216 then
		if player.IsHaveBuff(5236, 1) then
			player.DelGroupBuff(5236, 1)
		end
	end

	--�����������������ҽ���ĳ�����������Χ����55����ɾ��BUFF�����˵��ػ���
	if player.IsHaveBuff(1848, 1) and scene.dwMapID ~= 55 then
		player.DelGroupBuff(1848, 1)
	end
	--�����������������ҽ���ĳ����������ı��أ�57����ɾ������[��𳹭][����ɢ]
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

	--�����������������ҽ���ĳ�����������ƺ��53����ɾ��BUFF�����䡿
	if player.IsHaveBuff(1833, 1) and scene.dwMapID ~= 53 then
		player.DelGroupBuff(1833, 1)
	end

	-- ���ﴦ���ڱ����ĸ����õĵ���

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

	--�뿪�����볡��ɾ����װbuff

	if scene.dwMapID ~= 103 then
		for i = 1, #tBuffList_RTL do
			if player.IsHaveBuff(tBuffList_RTL[i].dwBuffID, 1) then
				player.DelGroupBuff(tBuffList_RTL[i].dwBuffID, 1)
			end
		end
	end
	--�뿪����ɽ����ɾ����װbuff
	if scene.dwMapID ~= 101 then
		if player.IsHaveBuff(2721, 1) or player.IsHaveBuff(2722, 1) then
			player.DelGroupBuff(2721, 1)
			player.DelGroupBuff(2722, 1)
		end
	end

	--ɾ����ɽ��������BUFF
	--���BUFF���˹��޵ıӻ�
	if scene.dwMapID ~= 105 then
		local nBuffID = 3587
		if player.IsHaveBuff(nBuffID, 1) then
			player.DelBuff(nBuffID, 1)
		end
		--���BUFF��ռ����ĸ���
		local nBuffID1 = 3607
		local nBuffID2 = 3953

		if player.IsHaveBuff(nBuffID2, 1) then
			for i = 1, 38 do
				if player.IsHaveBuff(nBuffID1, i) then
					player.DelBuff(nBuffID1, i)
				end
			end
		end
		--���BUFF
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

	-- ��������������
	if scene.dwMapID ~= 1 then
		player.DelBuff(1160, 1)
	end

	-- �����任װ����
	if scene.dwMapID ~= 153 then
		player.DelBuff(5448, 1)
		player.DelBuff(5351, 1)
	end

	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com