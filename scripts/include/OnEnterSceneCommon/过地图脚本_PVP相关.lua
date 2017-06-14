---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/OnEnterSceneCommon/过地图脚本_PVP相关.lua
-- 更新时间:	2017/5/22 16:48:20
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<
-- 最新可添加函数： OnPlayerLogin_Common9(player)
--[[Include("scripts/Map/逐鹿中原/include/据点争夺_Data.lh")
Include("scripts/Map/逐鹿中原/include/据点贸易_Data.lh")
Include("scripts/Map/逐鹿中原/include/otherfunctions.lua")
Include("scripts/Map/阵营首领/include/大小攻防占坑.lua")
Include("scripts/Include/BattleField.lh")
Include("scripts/Map/天山碎冰谷/include/登录.lua")
Include("scripts/Map/ACT_押镖活动/include/EscortHead.lua")
Include("scripts/Map/帮会押镖/include/帮会押镖.lh")
Include("scripts/Include/GlobalStrings.ls")
Include("scripts/Map/阵营首领/include/GFCampScoreData.lua")
Include("scripts/Map/阵营首领/include/GFDataManager.lua")--]]

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
	[25] = true, -- 浩气盟
	[27] = true, -- 恶人谷
	[22] = true, -- 南屏山
	[30] = true, -- 昆仑山
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
	-- 正文开始
	HandleJJC(player, scene) --记录JJC数据
	if scene.nType ~= MAP_TYPE.BATTLE_FIELD then
		player.DelBuff(11696, 1) -- 战场后补人员相关BUFF
	end
	player.Sprint(false) -- 过图强制退出轻功状态
	tBattleFunction.CancelQuest(player)
	tBattleFunction.AddRandomQuest(player)
	tCampCheckDate.EnterMap(scene, player)
	EnterJJCAddBuffInPkVersion(player, scene) -- 将主播和比赛人员分别加入池子
	SyncBuffToObserver(player, scene)         -- 同步比赛人员buff给Observer

	-- 跨服战功榜更新处理
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
				local nTime = GetCurrentTime() - player.nJoinTongTime --这里再判断预防帮派为空值
				if nTime >= 7 * 24 * 3600 then	--入帮满7天
					RemoteCallToCenter("On_Castle_AddRankTitlePoint", player.dwID, nDel)
				end
			end
			player.DelBuff(10576, 1)
		end
	end

	--过图统一取消JJC排队
	if player.bInArenaQueue then
		LeaveArenaQueue(player.dwID) -- 强行退出JJC排队
	end
	if player.IsHaveBuff(11877, 1) then -- 删除个人散排标记
		player.DelBuff(11877, 1)
	end
	if not scene.bIsArenaMap then -- 出JJC时
		if player.dwModelID == 39074 then
			player.SetModelID(0)
		end
		if player.IsHaveBuff(10709, 3) then	-- 进场景再处理一次
			player.DelBuff(10709, 3)		-- 观赛buff
			player.DelBuff(10658, 1)		-- 隐身buff
			player.DelBuff(7289, 1)		-- 眩晕禁锢buff
			player.DelBuff(4036, 1)		-- 缴械buff
		end
	end

	DelBuffEnterJJC(player, scene)
	-- 每周JJC前5胜奖励翻倍
	local nAddJJCBuffTime = math.max(1, math.ceil(OnGetNextMondaySevenPassTime() / 3600))
	if not player.IsHaveBuff(10274, 1) then
		player.AddBuff(0, 99, 10274, 1, nAddJJCBuffTime)
		local buffJJC = player.GetBuff(10274, 1)
		if buffJJC then
			buffJJC.nCustomValue = 5
		end
	end

	-- JJCG挂机惩罚
	if scene.bIsArenaMap then
		if player.IsHaveBuff(11878, 1) then
			player.AddBuff(0, 99, 11879, 1)
			player.DelBuff(11878, 1)
		end
	else
		player.DelBuff(11878, 1) -- 卡顿导致没成功进入JJC时删除buff
		 -- 从JJC直接出来时加惩罚
		if player.IsHaveBuff(11879, 1) then
			player.DelBuff(11879, 1)
			tJJC_BaseFunc.DoJJCPunish(player)
		end
	end

	-- 大师赛前5场双倍
	if ( player.IsJoinCorps(ARENA_TYPE.ARENA_MASTER_3V3) or player.IsJoinCorps(ARENA_TYPE.ARENA_MASTER_2V2) or player.IsJoinCorps(ARENA_TYPE.ARENA_MASTER_5V5) ) and not player.IsHaveBuff(11861, 1) then
		player.AddBuff(0, 99, 11861, 1, nAddJJCBuffTime)
		local buffJJC = player.GetBuff(11861, 1)
		if buffJJC then
			buffJJC.nCustomValue = 5
		end
	end
	-- 帮会押镖
	TongTrade.OnEnterScene(player, scene)

	-- 攻防小界面BUFF
	if (scene.dwMapID == 25 or scene.dwMapID == 27) and player.nCamp ~= 0 then
		if not player.IsHaveBuff(9629, 1) then
			player.AddBuff(player.dwID, 99, 9629, 1)
		else
			local buff = player.GetBuff(9629, 1)
			if buff then
				buff.nLeftActiveCount = 7200
			end
		end
		player.AddBuff(0, 99, 10662, 1, 3600) -- 挂机判定所需要的BUFF，储存上一个BOSS被击杀时的人数。
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

	-- 删除！战场挂机buf

	if not tBattleMap[scene.dwMapID] then
		player.DelBuff(3149, 1)
	end

	-- 进入战场场景和出战场场景处理
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
	-- 战场强退惩罚
	if player.bBattleBlackFlag then
		if not player.IsHaveBuff(5982, 1) then
			player.AddBuff(0, 99, 5982, 1, 30)
		end
	else
		if player.IsHaveBuff(5982, 1) then
			player.DelBuff(5982, 1)
		end
	end

	--- 逐鹿中原·据点争夺·士气低落BUFF
	CastleNpcInfo.UpdateNpcInCastle(scene);
	--[[
	-- 逐鹿中原·镖车
	local nZLZYKunLun = 30;
	local nZLZYNanPingShan = 22;
	local nZLZYBuff3, nZLZYBuff2, nZLZYBuff1 = 7685, 7684, 7686;--参与BUF，界面BUFF，加分BUF
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
	-- 逐鹿中原 - 据点争夺相关
	CastleTrade.PlayerEnterScene(player, scene)
	CastleFight.OnPlayerEnterScene(player, scene)

	-- 洛阳战乱·镖车
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

	-- 处理大战日常对攻防战的影响
	CheckCampFightQuestForGF(player, scene)

	-- 这配合寻求组队系统, 凡是进入一个寻求组队系统的副本就清除逃兵debuff
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

	-- 处理竞技场战阶称号.20111107
	CheckPlayerDesignationForJJC(player, scene)

	-- 处理老战场成就
	CheckBattleFieldAchievement(player, scene)

	-- 进入战争区域提醒
	OnEnterPKFieldAnnounce(player, scene)

	-- 阵营血踪万里称号处理
	CheckXueZongWanLiPrefix(player, scene)

	-- 马嵬驿阵营日常
	CheckMaWeiYiCampQuest(player, scene)

	-- 奇宝之争
	CheckWildTreasureActivity(player, scene)

	-- 处理帮会随机任务
	--[[local tTongRandomMapList = {
		[25] = {}, [27] = {}, [68] = {}, [69] = {}, [70] = {}, [109] = {}, [119] = {}, [118] = {},
		[160] = {}, [164] = {}, [165] = {}, [171] = {}, [175] = {}, [176] = {},
	}
	if tTongRandomMapList[scene.dwMapID] then
		OnCheckTongRandomQuestRequest(player, scene)
	end--]]

	-- 删除帮会约战相关buff
	if scene.dwMapID ~= 149 then

		for _, v in pairs(tBuffList_149) do
			if player.IsHaveBuff(v[1], v[2]) then
				player.DelBuff(v[1], v[2])
			end
		end
	end

	--不是阵营地图删除战魂BUFF

	local ZHBuff = player.GetBuff(2196, 0)
	local FYBuff = player.GetBuff(2197, 0)
	if ZHBuff and not tCampMapList[scene.dwMapID] then
		player.DelGroupBuff(2196, ZHBuff.nLevel)
	end
	if FYBuff and not tCampMapList[scene.dwMapID] then
		player.DelGroupBuff(2197, FYBuff.nLevel)
	end
	--阵营活动任务逾期处理
	CheckQuestOverdue(player)

	-- 以下处理如果不是浩气盟和恶人谷地图，则删除可拾取武器（ID：8918）
	if scene.dwMapID ~= 25 and scene.dwMapID ~= 27 then
		local nBoomAmount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, 8918)
		if nBoomAmount ~= 0 then
			player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, 8918, nBoomAmount)
		end
	end

	--拭剑园进出场景处理
	ShiJianYuanCheckEquipBackUp(player, scene)

	-- JJ禁止切奇穴BUFF 出JJC删除，没用了
	if not scene.bIsArenaMap then
		if player.IsHaveBuff(11840, 1) then
			player.DelBuff(11840, 1)
		end
		if player.IsHaveBuff(11839, 1) then
			player.DelBuff(11839, 1)
		end
	end
	--竞技场弹幕颜色和表情包解锁处理
	JJCBulletColorUnLock(player, scene)
	--竞技场升段增加log
	OnArenaLevelUpLog(player)
	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

-- 记录竞技场log，用于发送给数据中心
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
		----------如果是红队
		if thisPlayerBattleFieldSide == 0 then
			if player.IsHaveBuff(11878, 1) and npcHong.GetCustomInteger1(63) ~= 1 then -- 63字节记录是否为个人散排
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
			---------- 如果是蓝队
		elseif thisPlayerBattleFieldSide == 1 then
			if player.IsHaveBuff(11878, 1) and npcLan.GetCustomInteger1(63) ~= 1 then -- 63字节记录是否为个人散排
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
		player.DelGroupBuff(1241, 2) -- 吐故纳新
		player.DelGroupBuff(1241, 6) -- 吐故纳新
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
	player.DelBuff(9319, 1)--下面四个长歌曲风
	player.DelBuff(9320, 1)
	player.DelBuff(9321, 1)
	player.DelBuff(9322, 1)
	player.DelGroupBuff(3426, 1)
	player.DelBuff(8867, 10)
	player.DelGroupBuff(11001, 1) -- 霸刀碎江天
	player.DelGroupBuff(11001, 2) -- 霸刀碎江天
	if scene.GetCustomBoolean(SCENE_CUSTOM_VALUE_NAME.TSSBG.LEAVE) == false then -- 准备期间
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

-- 名剑大会禁止称号属性Buff的恢复处理
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
	local nArena5V5LevelUp = 17032 -- 任务17008到17043 任务需要赛季重置 ！！！！
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
	[5549] = {6, 7533, 7534, 7535, 7536, 7500}, -- 周六接任务
	[5550] = {0, 4230, 4231, 4232, 4233, 7503}, -- 周日接任务
	[5552] = {0, 7538, 7539, 7540, 7541, 7504}, -- 周日接任务
	[5553] = {6, 4197, 4208, 4210, 4211, 7502}, -- 周六接任务
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
	[1] = {nCycleTime = 21600}, --休息时间			（6小时,7:00~13:00）
	[2] = {nCycleTime = 3600}, --第二场战斗时间	（1小时,13:00~14:00）
	[3] = {nCycleTime = 18000}, --休息时间			（5小时,14:00~19:00）
	[4] = {nCycleTime = 3600}, --第三场战斗时间	（1小时,19:00~20:00）
	[5] = {nCycleTime = 3600}, --休息时间			（1小时,20:00~21:00）
	[6] = {nCycleTime = 3600}, --第四场战斗时间	（1小时,21:00~22:00）
	[7] = {nCycleTime = 7200}, --休息时间			（2小时,22:00~24:00）
	[8] = {nCycleTime = 3600}, --第五场战斗时间	（1小时,0:00~1:00）
	[9] = {nCycleTime = 3600}, --休息时间			（1小时,1:00~2:00）
	[10] = {nCycleTime = 3600}, --第五场战斗时间	（1小时,2:00~3:00）
	[11] = {nCycleTime = 14400}, --休息时间			（4小时,3:00~7:00）
}
function GetTimeInfo()
	local nCurrentTime = GetCurrentTime()
	local tData = TimeToDate(nCurrentTime)
	local nStartTime = DateToTime(tData.year, tData.month, tData.day, 7, 0, 0)
	local nUsedTime = nCurrentTime - nStartTime
	local nNextStepTime = 1 --当前时间距离下一个阶段的剩余时间
	local nWeekday = tData.weekday

	if nUsedTime < 0 then
		nWeekday = nWeekday - 1
		if nWeekday < 0 then
			nWeekday = 6
		end

		nUsedTime = nCurrentTime - nStartTime + 24 * 3600
	end

	local nStep = 0 --当前时间处于第几个阶段

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
	[5] = {2}, -- 5段有绿色
	[6] = {2}, -- 6段有绿色
	[7] = {2}, -- 7段有绿色
	[8] = {2}, -- 8段有绿色
	[9] = {2}, --9段有绿色
	[10] = {2, 3}, --10段有绿，蓝
	[11] = {2, 3}, --11段有绿，蓝
	[12] = {2, 3, 4}, --12段有绿，蓝，紫
}
function JJCBulletColorUnLock(player, scene)
	if not scene.bIsArenaMap then		--场景类型:0 野外；1 副本；2 竞技场；3 稻香村
		return
	end
	local nLv22 = player.nArenaLevel2v2
	local nLv33 = player.nArenaLevel3v3
	local nLv55 = player.nArenaLevel5v5
	local nMaxLv = math.max(nLv22, math.max(nLv33, nLv55))
	if tColor[nMaxLv] then
		for i = 1, #tColor[nMaxLv] do
			player.AddBulletScreenColour(tColor[nMaxLv][i])	--解锁颜色
		end
	end

	--顺便判12段加表情包
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com