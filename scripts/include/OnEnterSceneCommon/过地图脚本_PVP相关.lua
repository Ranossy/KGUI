---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_PVP���.lua
-- ����ʱ��:	2017/5/22 16:48:20
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
-- ���¿���Ӻ����� OnPlayerLogin_Common9(player)
--[[Include("scripts/Map/��¹��ԭ/include/�ݵ�����_Data.lh")
Include("scripts/Map/��¹��ԭ/include/�ݵ�ó��_Data.lh")
Include("scripts/Map/��¹��ԭ/include/otherfunctions.lua")
Include("scripts/Map/��Ӫ����/include/��С����ռ��.lua")
Include("scripts/Include/BattleField.lh")
Include("scripts/Map/��ɽ�����/include/��¼.lua")
Include("scripts/Map/ACT_Ѻ�ڻ/include/EscortHead.lua")
Include("scripts/Map/���Ѻ��/include/���Ѻ��.lh")
Include("scripts/Include/GlobalStrings.ls")
Include("scripts/Map/��Ӫ����/include/GFCampScoreData.lua")
Include("scripts/Map/��Ӫ����/include/GFDataManager.lua")--]]

Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

--
local tBattleMap = {
	[186] = 1,
	[38] = 1,
	[48] = 1,
	[50] = 1,
	[52] = 1,
	[135] = 1,
	[121] = 1,
	[173] = 1,
	[181] = 1,
}
local tBuffList_149 = {
	{4762, 1}, {4763, 1}, {4679, 1}
}
local tCampMapList = {
	[25] = true, -- ������
	[27] = true, -- ���˹�
	[22] = true, -- ����ɽ
	[30] = true, -- ����ɽ
}
local tPrefixTitle = {
--		[96] = {2125, 1}, [95] = {2125, 2}, [94] = {2125, 3}, [93] = {2125, 4}, [92] = {2125, 5}, [91] = {2125, 6}, [90] = {2125, 7},
	[89] = {2125, 8}, [88] = {2125, 9}, [87] = {2125, 10}, [86] = {2125, 11}, [85] = {2125, 12}, [84] = {2125, 13}, [83] = {2125, 14},
--		[110] = {2125, 1}, [109] = {2125, 2}, [108] = {2125, 3}, [107] = {2125, 4}, [106] = {2125, 5}, [105] = {2125, 6}, [104] = {2125, 7},
	[103] = {2125, 8}, [102] = {2125, 9}, [101] = {2125, 10}, [100] = {2125, 11}, [99] = {2125, 12}, [98] = {2125, 13}, [97] = {2125, 14},
	[163] = {3874, 1}
}
local tPostfixTitle = {[158] = {6806, 3}, }
function OnEnterSceneCommon_PVP0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ
	HandleJJC(player, scene) --��¼JJC����
	if scene.nType ~= MAP_TYPE.BATTLE_FIELD then
		player.DelBuff(11696, 1) -- ս������Ա���BUFF
	end
	player.Sprint(false) -- ��ͼǿ���˳��Ṧ״̬
	tBattleFunction.CancelQuest(player)
	tBattleFunction.AddRandomQuest(player)
	tCampCheckDate.EnterMap(scene, player)
	EnterJJCAddBuffInPkVersion(player, scene) -- �������ͱ�����Ա�ֱ�������
	SyncBuffToObserver(player, scene)         -- ͬ��������Աbuff��Observer

	-- ���ս������´���
	if IsRemotePlayer(player.dwID) and player.nCamp ~= 0 then
		if not player.IsHaveBuff(10576, 1) then
			player.AddBuff(player.dwID, player.nLevel, 10576, 1)
			local buff = player.GetBuff(10576, 1)
			if buff then
				buff.nCustomValue = player.nTitlePoint
			end
		end
	else
		local buff = player.GetBuff(10576, 1)
		if buff then
			local nDel = player.nTitlePoint - buff.nCustomValue
			if nDel > 0 and player.dwTongID ~= 0 and  player.nJoinTongTime > 0 then
				local nTime = GetCurrentTime() - player.nJoinTongTime --�������ж�Ԥ������Ϊ��ֵ
				if nTime >= 7 * 24 * 3600 then	--�����7��
					RemoteCallToCenter("On_Castle_AddRankTitlePoint", player.dwID, nDel)
				end
			end
			player.DelBuff(10576, 1)
		end
	end

	--��ͼͳһȡ��JJC�Ŷ�
	if player.bInArenaQueue then
		LeaveArenaQueue(player.dwID) -- ǿ���˳�JJC�Ŷ�
	end
	if player.IsHaveBuff(11877, 1) then -- ɾ������ɢ�ű��
		player.DelBuff(11877, 1)
	end
	if not scene.bIsArenaMap then -- ��JJCʱ
		if player.dwModelID == 39074 then
			player.SetModelID(0)
		end
		if player.IsHaveBuff(10709, 3) then	-- �������ٴ���һ��
			player.DelBuff(10709, 3)		-- ����buff
			player.DelBuff(10658, 1)		-- ����buff
			player.DelBuff(7289, 1)		-- ѣ�ν���buff
			player.DelBuff(4036, 1)		-- ��еbuff
		end
	end

	DelBuffEnterJJC(player, scene)
	-- ÿ��JJCǰ5ʤ��������
	local nAddJJCBuffTime = math.max(1, math.ceil(OnGetNextMondaySevenPassTime() / 3600))
	if not player.IsHaveBuff(10274, 1) then
		player.AddBuff(0, 99, 10274, 1, nAddJJCBuffTime)
		local buffJJC = player.GetBuff(10274, 1)
		if buffJJC then
			buffJJC.nCustomValue = 5
		end
	end

	-- JJCG�һ��ͷ�
	if scene.bIsArenaMap then
		if player.IsHaveBuff(11878, 1) then
			player.AddBuff(0, 99, 11879, 1)
			player.DelBuff(11878, 1)
		end
	else
		player.DelBuff(11878, 1) -- ���ٵ���û�ɹ�����JJCʱɾ��buff
		 -- ��JJCֱ�ӳ���ʱ�ӳͷ�
		if player.IsHaveBuff(11879, 1) then
			player.DelBuff(11879, 1)
			tJJC_BaseFunc.DoJJCPunish(player)
		end
	end

	-- ��ʦ��ǰ5��˫��
	if ( player.IsJoinCorps(ARENA_TYPE.ARENA_MASTER_3V3) or player.IsJoinCorps(ARENA_TYPE.ARENA_MASTER_2V2) or player.IsJoinCorps(ARENA_TYPE.ARENA_MASTER_5V5) ) and not player.IsHaveBuff(11861, 1) then
		player.AddBuff(0, 99, 11861, 1, nAddJJCBuffTime)
		local buffJJC = player.GetBuff(11861, 1)
		if buffJJC then
			buffJJC.nCustomValue = 5
		end
	end
	-- ���Ѻ��
	TongTrade.OnEnterScene(player, scene)

	-- ����С����BUFF
	if (scene.dwMapID == 25 or scene.dwMapID == 27) and player.nCamp ~= 0 then
		if not player.IsHaveBuff(9629, 1) then
			player.AddBuff(player.dwID, 99, 9629, 1)
		else
			local buff = player.GetBuff(9629, 1)
			if buff then
				buff.nLeftActiveCount = 7200
			end
		end
		player.AddBuff(0, 99, 10662, 1, 3600) -- �һ��ж�����Ҫ��BUFF��������һ��BOSS����ɱʱ��������
		local buff = player.GetBuff(10662, 1)
		if buff then
			buff.nCustomValue = player.nTitlePoint
		end
	else
		if player.IsHaveBuff(9629, 1) then
			if IsActivityOn(41) then
				player.DelBuff(9629, 1)
				tGFCampScoreData.CancelQuest(player)
			end
		end
		player.DelBuff(10662, 1)
	end

	-- ɾ����ս���һ�buf

	if not tBattleMap[scene.dwMapID] then
		player.DelBuff(3149, 1)
	end

	-- ����ս�������ͳ�ս����������
	if scene.nType == MAP_TYPE.BATTLE_FIELD then
		if not player.IsHaveBuff(3602, 1) then
			player.AddBuff(0, 99, 3602, 1, 2)
		end
		player.AddBuff(0, 99, 8827, 1)
	else
		if player.IsHaveBuff(3602, 1) then
			if player.nMoveState == MOVE_STATE.ON_DEATH then
				player.Revive()
			end
			player.nCurrentLife = player.nMaxLife
			player.nCurrentMana = player.nMaxMana
			player.CastSkill(7547, 1)
			player.DelBuff(3602, 1)
			player.DelBuff(8827, 1)
		end
	end
	-- ս��ǿ�˳ͷ�
	if player.bBattleBlackFlag then
		if not player.IsHaveBuff(5982, 1) then
			player.AddBuff(0, 99, 5982, 1, 30)
		end
	else
		if player.IsHaveBuff(5982, 1) then
			player.DelBuff(5982, 1)
		end
	end

	--- ��¹��ԭ���ݵ����ᡤʿ������BUFF
	CastleNpcInfo.UpdateNpcInCastle(scene);
	--[[
	-- ��¹��ԭ���ڳ�
	local nZLZYKunLun = 30;
	local nZLZYNanPingShan = 22;
	local nZLZYBuff3, nZLZYBuff2, nZLZYBuff1 = 7685, 7684, 7686;--����BUF������BUFF���ӷ�BUF
	if scene.dwMapID == nZLZYKunLun or scene.dwMapID == nZLZYNanPingShan then
		local nCount = 6 * 3600;--12H
		if  player.nCamp ~= 0 then
			--	player.AddBuff(0,99,nZLZYBuff3, player.nCamp, nCount);
			player.AddBuff(0, 99, nZLZYBuff2, 1, nCount);
			--	player.AddBuff(0,99,nZLZYBuff1, 1, nCount);
		end
	else
		if player.nCamp ~= 0 then
			player.DelBuff(nZLZYBuff3, player.nCamp);
			player.DelBuff(nZLZYBuff2, 1);
			player.DelBuff(nZLZYBuff1, 1);
		end
	end
	--]]
	-- ��¹��ԭ - �ݵ��������
	CastleTrade.PlayerEnterScene(player, scene)
	CastleFight.OnPlayerEnterScene(player, scene)

	-- ����ս�ҡ��ڳ�
	--[[local nLuoYangZhanLuanMapId = 151;
	local nLuoYangBuffWindow, nLuoYangBuffJoin = 7842, 7852;
	if scene.dwMapID == nLuoYangZhanLuanMapId then
		local nCount = 3600;
		if player.nCamp ~= 0 then
			player.AddBuff(0, 99, nLuoYangBuffWindow, 1, nCount);
		end
	else
		if player.nCamp ~= 0 then
			player.DelBuff(nLuoYangBuffJoin, player.nCamp);
			player.DelBuff(nLuoYangBuffWindow, 1);
		end
	end--]]

	-- �����ս�ճ��Թ���ս��Ӱ��
	CheckCampFightQuestForGF(player, scene)

	-- �����Ѱ�����ϵͳ, ���ǽ���һ��Ѱ�����ϵͳ�ĸ���������ӱ�debuff
	local tPQ = GetScenePQ(scene)
	if #tPQ > 0 then
		local pq = tPQ[1]
		local nPQType = pq.nOwnerType
		if nPQType == PQ_OWNER_TYPE.QUEUED_DUNGEON then
			if player.IsHaveBuff(1852, 1) then
				player.DelBuff(1852, 1)
			end
		end
	end

	-- ��������ս�׳ƺ�.20111107
	CheckPlayerDesignationForJJC(player, scene)

	-- ������ս���ɾ�
	CheckBattleFieldAchievement(player, scene)

	-- ����ս����������
	OnEnterPKFieldAnnounce(player, scene)

	-- ��ӪѪ������ƺŴ���
	CheckXueZongWanLiPrefix(player, scene)

	-- ��������Ӫ�ճ�
	CheckMaWeiYiCampQuest(player, scene)

	-- �汦֮��
	CheckWildTreasureActivity(player, scene)

	-- �������������
	--[[local tTongRandomMapList = {
		[25] = {}, [27] = {}, [68] = {}, [69] = {}, [70] = {}, [109] = {}, [119] = {}, [118] = {},
		[160] = {}, [164] = {}, [165] = {}, [171] = {}, [175] = {}, [176] = {},
	}
	if tTongRandomMapList[scene.dwMapID] then
		OnCheckTongRandomQuestRequest(player, scene)
	end--]]

	-- ɾ�����Լս���buff
	if scene.dwMapID ~= 149 then

		for _, v in pairs(tBuffList_149) do
			if player.IsHaveBuff(v[1], v[2]) then
				player.DelBuff(v[1], v[2])
			end
		end
	end

	--������Ӫ��ͼɾ��ս��BUFF

	local ZHBuff = player.GetBuff(2196, 0)
	local FYBuff = player.GetBuff(2197, 0)
	if ZHBuff and not tCampMapList[scene.dwMapID] then
		player.DelGroupBuff(2196, ZHBuff.nLevel)
	end
	if FYBuff and not tCampMapList[scene.dwMapID] then
		player.DelGroupBuff(2197, FYBuff.nLevel)
	end
	--��Ӫ��������ڴ���
	CheckQuestOverdue(player)

	-- ���´���������Ǻ����˺Ͷ��˹ȵ�ͼ����ɾ����ʰȡ������ID��8918��
	if scene.dwMapID ~= 25 and scene.dwMapID ~= 27 then
		local nBoomAmount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, 8918)
		if nBoomAmount ~= 0 then
			player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, 8918, nBoomAmount)
		end
	end

	--�ý�԰������������
	ShiJianYuanCheckEquipBackUp(player, scene)

	-- JJ��ֹ����ѨBUFF ��JJCɾ����û����
	if not scene.bIsArenaMap then
		if player.IsHaveBuff(11840, 1) then
			player.DelBuff(11840, 1)
		end
		if player.IsHaveBuff(11839, 1) then
			player.DelBuff(11839, 1)
		end
	end
	--��������Ļ��ɫ�ͱ������������
	JJCBulletColorUnLock(player, scene)
	--��������������log
	OnArenaLevelUpLog(player)
	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

-- ��¼������log�����ڷ��͸���������
function HandleJJC(player, scene)
	if scene.bIsArenaMap then
		local npcLan = scene.GetNpcByNickName("LanDuiNpc")
		local npcHong = scene.GetNpcByNickName("HongDuiNpc")
		if not npcLan then
			npcLan = scene.CreateNpc(55889, 10, 10, 10, 1, - 1, "LanDuiNpc")
			for i = 0, 45 do
				npcLan.SetCustomInteger1(i, 0)
			end
		end
		if not npcHong then
			npcHong = scene.CreateNpc(55903, 10, 10, 10, 1, - 1, "HongDuiNpc")
			for i = 0, 45 do
				npcHong.SetCustomInteger1(i, 0)
			end
		end

		local hongduiData = scene.GetCorpsStatisticsData(0)
		local landuiData = scene.GetCorpsStatisticsData(1)

		npcHong.SetCustomInteger4(0, hongduiData["dwCorpsID"])
		npcHong.SetCustomInteger2(4, hongduiData["nCorpsLevel"])
		npcLan.SetCustomInteger4(0, landuiData["dwCorpsID"])
		npcLan.SetCustomInteger2(4, landuiData["nCorpsLevel"])

		local thisPlayerCorpsSystemID = player.dwCorpsSystemID
		local thisPlayerBattleFieldSide = player.nBattleFieldSide
		----------����Ǻ��
		if thisPlayerBattleFieldSide == 0 then
			if player.IsHaveBuff(11878, 1) and npcHong.GetCustomInteger1(63) ~= 1 then -- 63�ֽڼ�¼�Ƿ�Ϊ����ɢ��
				npcHong.SetCustomInteger1(63, 1)
			end
			local ifInsert = true
			for i = 6, 38, 8 do
				if npcHong.GetCustomInteger4(i) == thisPlayerCorpsSystemID then
					ifInsert = false
				end
			end
			if ifInsert then
				local hasInsert = false
				for i = 6, 38, 8 do
					if npcHong.GetCustomInteger4(i) == 0 and hasInsert == false then
						npcHong.SetCustomInteger4(i, thisPlayerCorpsSystemID)
						local kungfu = player.GetKungfuMount()
						if(kungfu and kungfu.dwSkillID) then
							npcHong.SetCustomInteger2(i + 6, kungfu.dwSkillID)
						end
						local memberInfo = hongduiData["MemberInfoTab"]
						for k = 1, #memberInfo do
							if memberInfo[k]["dwCorpsSystemID"] == thisPlayerCorpsSystemID then
								local thisMatchLevel = memberInfo[k]["nMatchLevel"]
								npcHong.SetCustomInteger2(i + 4, thisMatchLevel)
							end
						end

						hasInsert = true
					end
				end
			end
			---------- ���������
		elseif thisPlayerBattleFieldSide == 1 then
			if player.IsHaveBuff(11878, 1) and npcLan.GetCustomInteger1(63) ~= 1 then -- 63�ֽڼ�¼�Ƿ�Ϊ����ɢ��
				npcLan.SetCustomInteger1(63, 1)
			end
			local ifInsert = true
			for i = 6, 38, 8 do
				if npcLan.GetCustomInteger4(i) == thisPlayerCorpsSystemID then
					ifInsert = false
				end
			end
			if ifInsert then
				local hasInsert = false
				for i = 6, 38, 8 do
					if npcLan.GetCustomInteger4(i) == 0 and hasInsert == false then
						npcLan.SetCustomInteger4(i, thisPlayerCorpsSystemID)
						local kungfu = player.GetKungfuMount()
						if(kungfu and kungfu.dwSkillID) then
							npcLan.SetCustomInteger2(i + 6, kungfu.dwSkillID)
						end
						local memberInfo = landuiData["MemberInfoTab"]
						for k = 1, #memberInfo do
							if memberInfo[k]["dwCorpsSystemID"] == thisPlayerCorpsSystemID then
								local thisMatchLevel = memberInfo[k]["nMatchLevel"]
								npcLan.SetCustomInteger2(i + 4, thisMatchLevel)
							end
						end
						hasInsert = true
					end
				end
			end
		end
	end
end

function DelBuffEnterJJC(player, scene)
	if not scene.bIsArenaMap then
		player.DelBuff(11547, 1)
		player.DelBuff(11547, 2)
		player.DelBuff(11548, 1)
		return
	end
	for i = 1, 6 do
		player.DelBuff(136, i)
		player.DelGroupBuff(1241, 2) -- �¹�����
		player.DelGroupBuff(1241, 6) -- �¹�����
	end
	player.DelBuff(9840, 1)
	player.DelBuff(9961, 1)
	player.DelBuff(9784, 1)
	player.DelBuff(9709, 1)
	player.DelBuff(9704, 1)
	player.DelBuff(9990, 1)
	player.DelBuff(9854, 1)
	player.DelBuff(9894, 1)
	player.DelBuff(9886, 1)
	player.DelBuff(10215, 1)
	player.DelBuff(9299, 1)
	player.DelBuff(6236, 1)
	player.DelBuff(9319, 1)--�����ĸ���������
	player.DelBuff(9320, 1)
	player.DelBuff(9321, 1)
	player.DelBuff(9322, 1)
	player.DelGroupBuff(3426, 1)
	player.DelBuff(8867, 10)
	player.DelGroupBuff(11001, 1) -- �Ե��齭��
	player.DelGroupBuff(11001, 2) -- �Ե��齭��
	if scene.GetCustomBoolean(SCENE_CUSTOM_VALUE_NAME.TSSBG.LEAVE) == false then -- ׼���ڼ�
		player.DelBuff(10050, 1)
	end
end

function CheckCampFightQuestForGF(player, scene)
	if scene.dwMapID ~= 22 and scene.dwMapID ~= 30 then
		if player.IsHaveBuff(3837, 1) then
			player.DelBuff(3837, 1)
		end
		return
	end

	local nWeekday = GetCurrentWeekDay()
	if nWeekday ~= 6 and nWeekday ~= 0 then
		if player.IsHaveBuff(3837, 1) then
			player.DelBuff(3837, 1)
		end
		return
	end

	if not player.IsHaveBuff(3837, 1) then
		player.AddBuff(0, 99, 3837, 1, 10000)
	end
end

function GetScenePQ(scene)
	local tPQList = scene.GetPQList()
	local tPQ = {}
	for i = 1, #tPQList do
		local pq = GetPQ(tPQList[i])
		if pq then
			table.insert(tPQ, pq)
		end
	end
	return tPQ
end

-- ��������ֹ�ƺ�����Buff�Ļָ�����
function CheckPlayerDesignationForJJC(player, scene)
	if scene.bIsArenaMap then
		return
	end

	local nPrefix = player.GetCurrentDesignationPrefix()
	local nPostfix = player.GetCurrentDesignationPostfix()
	if nPrefix and tPrefixTitle[nPrefix] then
		if not player.IsHaveBuff(tPrefixTitle[nPrefix][1], tPrefixTitle[nPrefix][2]) then
			player.AddBuff(0, 99, tPrefixTitle[nPrefix][1], tPrefixTitle[nPrefix][2])
		end
	end
	if nPostfix and tPostfixTitle[nPostfix] then
		if not player.IsHaveBuff(tPostfixTitle[nPostfix][1], tPostfixTitle[nPostfix][2]) then
			player.AddBuff(0, 99, tPostfixTitle[nPostfix][1], tPostfixTitle[nPostfix][2])
		end
	end
end

local tAchievementList_CheckBattleFieldAchievement = {
	[187] = 188, [1223] = 1224, [203] = 204,
	[188] = 187, [1224] = 1223, [204] = 203,
}
function CheckBattleFieldAchievement(player, scene)
	for k, v in pairs(tAchievementList_CheckBattleFieldAchievement) do
		if player.IsAchievementAcquired(k) and not player.IsAchievementAcquired(v) then
			player.AcquireAchievement(v)
		end
	end
end

function OnEnterPKFieldAnnounce(player, scene)
	if not scene.bCanPK then
		return
	end

	player.SendSystemMessage(GLOBAL_STRING_TABLE.CANPK_WARNING)
end

function OnArenaLevelUpLog(player)
	local nArena2V2LevelUp = 17008
	local nArena3V3LevelUp = 17020
	local nArena5V5LevelUp = 17032 -- ����17008��17043 ������Ҫ�������� ��������
	local n2V2Q = nArena2V2LevelUp + player.nArenaLevel2v2 - 1
	local n3V3Q = nArena3V3LevelUp + player.nArenaLevel3v3 - 1
	local n5V5Q = nArena5V5LevelUp + player.nArenaLevel5v5 - 1

	if player.nArenaLevel2v2 > 0 and player.GetQuestPhase(n2V2Q) == 0 then
		player.ForceFinishQuest(n2V2Q)
	end

	if  player.nArenaLevel3v3 > 0 and player.GetQuestPhase(n3V3Q) == 0 then
		player.ForceFinishQuest(n3V3Q)
	end

	if player.nArenaLevel5v5 > 0 and player.GetQuestPhase(n5V5Q) == 0 then
		player.ForceFinishQuest(n5V5Q)
	end
end

function CheckXueZongWanLiPrefix(player, scene)
	if player.nCamp == 0 then
		return
	end

	local buff = player.GetBuff(3872, 1)
	if not buff then
		return
	end

	if buff.nLeftActiveCount > 5 * 24 * 3600 then
		return
	end

	if buff.nCustomValue < 10 then
		player.DelBuff(3872, 1)
		return
	end

	local KCampInfo = GetCampInfo()
	if not KCampInfo then
		return
	end

	if player.nCamp ~= KCampInfo.nLastWinCamp then
		player.DelBuff(3872, 1)
		return
	end

	player.DelBuff(3872, 1)

	if player.IsDesignationPrefixAcquired(163) then
		player.RemoveDesignationPrefix(163)
	end

	player.AcquireDesignationPrefix(163)
	player.SendSystemMessage(GetEditorString(4, 329))
end

local tBuffList_CheckMaWeiYiCampQuest = {
	{5512, 1}, {5514, 1}, {5529, 1}
}
function CheckMaWeiYiCampQuest(player, scene)
	if scene.dwMapID == 153 then
		return
	end
	for _, v in pairs(tBuffList_CheckMaWeiYiCampQuest) do
		if player.IsHaveBuff(v[1], v[2]) then
			player.DelBuff(v[1], v[2])
		end
	end
end

local tMapList_CheckWildTreasureActivity = {[151] = 151, [156] = 156, [214] = 214, [215] = 215}
local tBuffList_CheckWildTreasureActivity = {
	{7049, 1}, {7071, 1}, {7129, 1}, {7130, 1}, {7131, 1}, {7243, 1}
}
function CheckWildTreasureActivity(player, scene)
	if tMapList_CheckWildTreasureActivity[scene.dwMapID] then
		player.AddBuff(0, 99, 7084, 1)
	elseif player.IsHaveBuff(7084, 1) then
		player.DelBuff(7084, 1)
	end
	for _, v in pairs(tBuffList_CheckWildTreasureActivity) do
		if player.IsHaveBuff(v[1], v[2]) then
			player.DelGroupBuff(v[1], v[2])
		end
	end

	local dwDynamicSkillGroup = player.GetDynamicSkillGroup()
	if dwDynamicSkillGroup >= 94 and dwDynamicSkillGroup <= 103 then
		player.SetDynamicSkillGroup(0)
	end

	if scene.CheckPlayerInKillersSet(player.dwID) then
		scene.RemovePlayerFromKillersSet(player.dwID)
	end
end

local tQuestIDInfo = {5549, 5550, 5552, 5553}
local tOtherQuest = {
	[5549] = {6, 7533, 7534, 7535, 7536, 7500}, -- ����������
	[5550] = {0, 4230, 4231, 4232, 4233, 7503}, -- ���ս�����
	[5552] = {0, 7538, 7539, 7540, 7541, 7504}, -- ���ս�����
	[5553] = {6, 4197, 4208, 4210, 4211, 7502}, -- ����������
}
function CheckQuestOverdue(player)
	local nWeekday, _, _ = GetTimeInfo()
	for nIndex = 1, #tQuestIDInfo do
		local nQuestIndex = player.GetQuestIndex(tQuestIDInfo[nIndex])
		local nQuestPhase = player.GetQuestPhase(tQuestIDInfo[nIndex])
		if nQuestPhase == 1 or nQuestPhase == 2 then
			local nWeekdayMark = player.GetQuestValue(nQuestIndex, 1)
			if nWeekdayMark ~= nWeekday then
				player.SetQuestFailedFlag(nQuestIndex, true)
			end
		end
		if tOtherQuest[tQuestIDInfo[nIndex]] then
			for i = 2, #tOtherQuest[tQuestIDInfo[nIndex]] do
				nQuestIndex = player.GetQuestIndex(tOtherQuest[tQuestIDInfo[nIndex]][i])
				nQuestPhase = player.GetQuestPhase(tOtherQuest[tQuestIDInfo[nIndex]][i])
				if nQuestIndex and (nQuestPhase == 1 or nQuestPhase == 2) then
					if nWeekday ~= tOtherQuest[tQuestIDInfo[nIndex]][1] then
						player.SetQuestFailedFlag(nQuestIndex, true)
					end
				end
			end
		end
	end
end

local tStepTime = {
	[1] = {nCycleTime = 21600}, --��Ϣʱ��			��6Сʱ,7:00~13:00��
	[2] = {nCycleTime = 3600}, --�ڶ���ս��ʱ��	��1Сʱ,13:00~14:00��
	[3] = {nCycleTime = 18000}, --��Ϣʱ��			��5Сʱ,14:00~19:00��
	[4] = {nCycleTime = 3600}, --������ս��ʱ��	��1Сʱ,19:00~20:00��
	[5] = {nCycleTime = 3600}, --��Ϣʱ��			��1Сʱ,20:00~21:00��
	[6] = {nCycleTime = 3600}, --���ĳ�ս��ʱ��	��1Сʱ,21:00~22:00��
	[7] = {nCycleTime = 7200}, --��Ϣʱ��			��2Сʱ,22:00~24:00��
	[8] = {nCycleTime = 3600}, --���峡ս��ʱ��	��1Сʱ,0:00~1:00��
	[9] = {nCycleTime = 3600}, --��Ϣʱ��			��1Сʱ,1:00~2:00��
	[10] = {nCycleTime = 3600}, --���峡ս��ʱ��	��1Сʱ,2:00~3:00��
	[11] = {nCycleTime = 14400}, --��Ϣʱ��			��4Сʱ,3:00~7:00��
}
function GetTimeInfo()
	local nCurrentTime = GetCurrentTime()
	local tData = TimeToDate(nCurrentTime)
	local nStartTime = DateToTime(tData.year, tData.month, tData.day, 7, 0, 0)
	local nUsedTime = nCurrentTime - nStartTime
	local nNextStepTime = 1 --��ǰʱ�������һ���׶ε�ʣ��ʱ��
	local nWeekday = tData.weekday

	if nUsedTime < 0 then
		nWeekday = nWeekday - 1
		if nWeekday < 0 then
			nWeekday = 6
		end

		nUsedTime = nCurrentTime - nStartTime + 24 * 3600
	end

	local nStep = 0 --��ǰʱ�䴦�ڵڼ����׶�

	for nIndex = 1, #tStepTime do
		if tStepTime[nIndex].nCycleTime > nUsedTime then
			nStep = nIndex
			nNextStepTime = tStepTime[nIndex].nCycleTime - nUsedTime
			break
		end

		nUsedTime = nUsedTime - tStepTime[nIndex].nCycleTime
	end

	return nWeekday, nStep, nNextStepTime
end


local tColor = {
	[5] = {2}, -- 5������ɫ
	[6] = {2}, -- 6������ɫ
	[7] = {2}, -- 7������ɫ
	[8] = {2}, -- 8������ɫ
	[9] = {2}, --9������ɫ
	[10] = {2, 3}, --10�����̣���
	[11] = {2, 3}, --11�����̣���
	[12] = {2, 3, 4}, --12�����̣�������
}
function JJCBulletColorUnLock(player, scene)
	if not scene.bIsArenaMap then		--��������:0 Ұ�⣻1 ������2 ��������3 �����
		return
	end
	local nLv22 = player.nArenaLevel2v2
	local nLv33 = player.nArenaLevel3v3
	local nLv55 = player.nArenaLevel5v5
	local nMaxLv = math.max(nLv22, math.max(nLv33, nLv55))
	if tColor[nMaxLv] then
		for i = 1, #tColor[nMaxLv] do
			player.AddBulletScreenColour(tColor[nMaxLv][i])	--������ɫ
		end
	end

	--˳����12�μӱ����
	if nMaxLv < 12 then
		return
	end
	local tEmolist = player.GetEmotionPackageList()
	local bEmotionExist = false
	for i = 1, #tEmolist do
		if tEmolist[i] == 17 then
			bEmotionExist = true
			break
		end
	end
	if not bEmotionExist then
		player.AddEmotionPackage(17)
		player.SendSystemMessage(GetEditorString(11, 6131))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(11, 6131), 4)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com