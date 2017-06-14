---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/OnEnterSceneCommon/过地图脚本_系统相关.lua
-- 更新时间:	2017/5/22 17:06:39
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<
--[[Include("scripts/Map/江湖百态/方士/include/方士_Data.lua")
Include("scripts/Map/江湖百态/驭兽师/include/驭兽师_Data.lua")
Include("scripts/Map/江湖百态/include/IdentityBaseFunc.lua")
Include("scripts/Map/齐物阁/include/AllKill_Reward.lh")
Include("scripts/Map/科举考试/include/CivilServiceExamination.ls")
Include("scripts/Map/寻宝系统/include/HoroSystem.lua")--]]

Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

local tQuest_YuShou = {15467, 15469}
local tPosition_YuShou = {
	[1] = {21230, 14376, 1091136, 187},
	[2] = {13397, 111359, 1121152, 186},
	[3] = {108488, 20556, 1051008, 185},
	[4] = {113578, 115768, 1067904, 171},
}
local tDigHarmfulBuff = {7972, 7973}
local tDigItem = {5, 21534, 1}
local tTongItems = {
	7920, 7921, 7922, 7923, 7924, 7925, 7926, 7927, 7928
}
-- 此函数运行时间已到20MS，不可添加
function OnEnterSceneCommon_System0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- 正文开始
	-- 身份系统进入场景处理
	DoIdentityAcitonEnterMap(player, scene)

	--驭兽身份相关
	if player.IsHaveBuff(10864, 1) then  --删除驭兽标记
		player.DelBuff(10864, 1)
	end
	if scene.dwMapID == 108 then

		for i = 1, #tQuest_YuShou do
			local nQuestIndex = player.GetQuestIndex(tQuest_YuShou[i])
			local nQuestPhase = player.GetQuestPhase(tQuest_YuShou[i])
			if nQuestIndex and nQuestPhase == 1 then
				local YS_XueXinHu = scene.GetNpcByNickName("XueXinHu" .. player.dwID)
				if not YS_XueXinHu then
					local Pos_ID = player.GetQuestValue(nQuestIndex, 1)

					local YS_XueXinHu = scene.CreateNpc(51560, tPosition_YuShou[Pos_ID][1], tPosition_YuShou[Pos_ID][2], tPosition_YuShou[Pos_ID][3], tPosition_YuShou[Pos_ID][4], - 1, "XueXinHu" .. player.dwID, player.dwID)--任务变量,进场景的时候再创
					YS_XueXinHu.SetCustomUnsigned4(0, player.dwID)
				end
			end
		end
	end

	-- 清除团队挖宝次数BUFF
	player.DelBuff(9689, 1)
	-- 2014.9 进入场景内10分钟无法挖宝藏宝洞
	local  buffMission = player.GetBuff(7984, 1);
	if not buffMission or buffMission.nLeftActiveCount < 2 then
		player.AddBuff(0, 99, 7984, 1, 2);--5min一跳
	end

	-- 2014.7 删除藏宝洞伤害BUFF

	for k, v in pairs(tDigHarmfulBuff) do
		if player.IsHaveBuff(v, 1) then
			player.DelGroupBuff(v, 1);
		end
	end
	-- 2014.7 删除藏宝洞道具

	if player.GetItemAmountInAllPackages(tDigItem[1], tDigItem[2]) > 0 then
		player.CostItemInAllPackage(tDigItem[1], tDigItem[2], tDigItem[3])
	end

	-- 清除发红包的所有BUFF
	player.DelBuff(8722, 1)
	player.DelBuff(8723, 1)
	player.DelBuff(8733, 1)
	player.DelBuff(3675, 1)

	--2015.11删除杀猪道具修改为进入地图处理
	if scene.dwMapID ~= 74 then

		for i = 1, #tTongItems do
			local nCount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tTongItems[i])
			if nCount > 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tTongItems[i], nCount)
			end
		end
	end

	-- 劫镖_反隐技能
	if player.IsHaveBuff(5431, 1) then
		player.DelBuff(5431, 1)
	end

	-- 科举考试界面提醒相关
	CheckExamTipsBuff(player)

	-- 不在监狱时，对身上有牢狱状态玩家的处理
	if scene.dwMapID ~= 152 then
		if player.bPrisonFlag == true then
			local nKillPointLevel = GetKillPointLevel(player)
			if nKillPointLevel >= 2 then
				player.AddBuff(0, 99, 4704, 1, 12)  -- 杀气值高于100的玩家丢进监狱，用Buff延时处理
			else
				player.bPrisonFlag = false  -- 杀气值低于100的玩家清除状态
			end
		end

		local buff_ShaYi = player.GetBuff(5348, 1)
		if buff_ShaYi then
			for i = 1, buff_ShaYi.nStackNum do
				player.DelBuff(5348, 1)
			end
		end
	else
		if player.bHuntingFlag then
			player.SetHuntingFlag(false)  -- 在监狱场景，不允许开启捕快状态
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(4, 6240), 4)
			if player.dwWaistItemIndex == 4005 then
				player.SelectPendent(EQUIPMENT_SUB.WAIST_EXTEND, 0)	-- 卸载捕快腰牌
			end
			if player.IsHaveBuff(4857, 1) then
				player.DelBuff(4857, 1)	-- 删除捕快Buff
			end
			if player.IsHaveBuff(4958, 1) then
				player.DelBuff(4958, 1)	-- 删除名称隐藏Buff
			end
		end
		player.SetCannotDialogWithNPC(false)	-- 在监狱场景，允许与NPC对话，以接触内部玩法
	end

	-- 以下处理挖宝
	RemoteSendHoroSysData(player)

	--大乱斗《齐物阁》奖励
	AllKill_Reward.GiveRewardToPlayer(player)

	--明教里世界的首领trap和打坐区域冲突，所以特殊处理进地图就加
	if scene.dwMapID == 150 then
		--各加一层里外世界buff
		local BuffIDIn = 11370
		local BuffIDOut = 11341
		if not player.IsHaveBuff(BuffIDIn, 1) then
			player.AddBuff(0, 99, BuffIDIn, 1, 2400)
		end
		if not player.IsHaveBuff(BuffIDOut, 1) then
			player.AddBuff(0, 99, BuffIDOut, 1, 2400)
		end
	end

	-- 挖宝系统玩家计时器初始化
	--InitHoroTimerInfo(player)
	if player.GetCustomInteger1(PLAYER_CUSTOM_VALUE.HORO_SYS_TIMER_FLAG) ~= 0 then
		player.SetCustomInteger1(PLAYER_CUSTOM_VALUE.HORO_SYS_TIMER_FLAG, 0)
	end

	-- 点赞
	if not IsRemotePlayer(player.dwID) then
		local buffPraise = player.GetBuff(12011, 1)
		if buffPraise and buffPraise.nCustomValue < 32 then
			AddPraise(player.dwID, buffPraise.nCustomValue, buffPraise.nStackNum)
			player.DelGroupBuff(12011, 1)
		end
	end
	
	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

local tSkillGroup =
{
	[PLAYER_IDENTITY_TYPE.BODYGUARD] = {1001, 1001, 1001, 1001, 1001, },
	[PLAYER_IDENTITY_TYPE.ROB] = {2001, 2002, 2003, 2004, 2005, },
	[PLAYER_IDENTITY_TYPE.WIZARD] = {3001, 3002, 3002, 3002, 3002, },
	[PLAYER_IDENTITY_TYPE.HUNTER] = {4001, 4001, 4001, 4001, 4001, },
	[PLAYER_IDENTITY_TYPE.ARTIST] = {5001, 5001, 5001, 5001, 5001, }
}
function DoIdentityAcitonEnterMap(player, scene)
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end

	-- 进入场景后如果开启了身份，则显示身份动态技能栏

	local dwCurType = IdentifyManager.dwCurrentIdentityType
	if dwCurType ~= 0 then
		local nExp = IdentifyManager.GetIdentityExp(dwCurType)
		local nLevel = GetIdentityLevel(dwCurType, nExp)
		if tSkillGroup[dwCurType] and tSkillGroup[dwCurType][nLevel] then
			RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", tSkillGroup[dwCurType][nLevel])
		end
	end

	--------------------艺人相关-----------------------
	if player.IsHaveBuff(10819, 1) then  -- 艺人移除BUFF
		player.DelBuff(10819, 1)
	elseif not IsRemotePlayer(player.dwID) then
		local IdentityManager = player.GetPlayerIdentityManager()
		local nArtist_Reward = IdentityManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.ARTIST, YIREN_IDENTITY_CUSTOM_VALUE.LOVE_POINT) or 0--获取储存的积分，1分就是1金
		if nArtist_Reward > 0 then
			local nArtist_EXP = math.floor(nArtist_Reward / 10 * 0.4)
			local nEnd_Reward = nArtist_Reward * 0.2--分数的20%属于玩家获得的金币
			player.SendSystemMessage(GetEditorString(10, 2062) .. nEnd_Reward .. GetEditorString(10, 3021) .. nArtist_EXP .. GetEditorString(1, 734))
			local szMailText = player.szName .. GetEditorString(10, 2042)
			local nTotal = nEnd_Reward
			local nRepeat = math.floor(nTotal / 200000) + 1
			for i = 1, nRepeat do
				if nTotal > 200000 then
					SendSystemMail(GetEditorString(10, 1638), player.szName, GetEditorString(10, 1639), szMailText, 200000 * 10000)--如果大于20万先发20万
					Log(
						string.format(
						GetEditorString(10, 1640),
						player.dwID, player.szName, 200000
					)
					)
					nTotal = nTotal - 200000
				elseif nTotal > 0 then
					SendSystemMail(GetEditorString(10, 1638), player.szName, GetEditorString(10, 1639), szMailText, nTotal * 10000)--多余20万的再走一次发送
					Log(
						string.format(
						GetEditorString(10, 1640),
						player.dwID, player.szName, nTotal
					)
					)
					break
				end
			end
			if nArtist_Reward >= 20000 then
				player.AddAchievementCount(5379, 1)--增加成就
			end

			--IdentityManager.LogIdentityClosed(PLAYER_IDENTITY_TYPE.ARTIST, nArtist_Reward / 10 .. ";" .. 0 .. ";" .. 0)
			IdentityManager.LogArtistPerformEnd(IdentityManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.ARTIST) .. ";" .. PLAYER_IDENTITY_TYPE.ARTIST .. ";" .. nArtist_Reward / 10)
			IdentityManager.AddIdentityExp(PLAYER_IDENTITY_TYPE.ARTIST, nArtist_EXP)--增加经验
			IdentityManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.ARTIST, YIREN_IDENTITY_CUSTOM_VALUE.LOVE_POINT, 0)--清空储存的积分
		end
	end

	--------------------驭兽师相关-----------------------
	if player.IsHaveBuff(10864, 1) then  -- 删除驭兽标记
		player.DelBuff(10864, 1)
	end
	Identity_YuShou.OnEnterScene(player, scene)

	--------------------方士相关-----------------------
	------------通用禁止传送BUFF处理--------------
	if player.IsHaveBuff(10826, 1) then
		--if IsRemotePlayer(player.dwID) then
		-----在转服状态下（战场、JJC）关闭身份。恢复屏幕，恢复位面，恢复猎人的变身，删除
		player.DelBuff(10827, 1)     --删除方士入定状态标记BUFF
		if player.IsHaveBuff(11494, 1) then
			player.DelBuff(11494, 1)     --删除方士入定状态透明度BUFF
		end
		--player.DelBuff(10826, 1)     --通用禁止传送BUFF，在删除10827的后续处理中删除
		--end
	end
	--在野外场景时添加魂灵监控BUFF，1分钟/跳，直接加一周的
	--[[local tSceneList = {
		[6] = 1, [150] = 1, [102] = 1, [193] = 1, [158] = 1
	}
	if tSceneList[scene.dwMapID] then
		if scene.nType == 0 then
			player.AddBuff(player.dwID, player.nLevel, 10841, 1, 10080)
		end

		--如果有被鬼魂追踪的BUFF，则删除
		local buff_ghost = player.GetBuff(10842, 1)
		if buff_ghost then
			local ghost = scene.GetNpcByNickName("Identity_Ghost" .. player.dwID)
			if not ghost and buff_ghost.nCustomValue > 0 then
				--如果场景里已经有旧的鬼魂（可能已经变成游魂），则不作处理。
				Identity_CreatGhost1_5(player, buff_ghost.nCustomValue)
			end
		end
	end--]]
	local npc_Dig = scene.GetNpcByNickName("IdentityWizardDig" .. player.dwID)
	if npc_Dig then
		player.AddMapMark(npc_Dig.nX, npc_Dig.nY, npc_Dig.nZ, 1, GetEditorString(10, 6154))
	end
	if player.dwIdentityVisiableID == 3 or player.dwIdentityVisiableID == 7 then           --切换场景或者再次上线之后，应该清除方士相关的位面
		player.SetIdentityVisiableID(0)
	end

	if dwCurType == PLAYER_IDENTITY_TYPE.WIZARD then
		if player.IsHaveBuff(2587, 1) then
			player.DelBuff(2587, 1)
		end
		--通用道具以及任务处理
		local tDelItemList = {
			27092, 27147,
		}
		for _, nItemId in pairs(tDelItemList) do
			local nAmount = player.GetItemAmountInAllPackages(5, nItemId)
			if nAmount >= 1 then
				player.CostItemInAllPackage(5, nItemId, nAmount)
			end
		end
		local tDelQuestList = {
			15738, 15792,
		}
		for _, nQuestId in pairs(tDelQuestList) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			if nQuestIndex then
				player.SetQuestFailedFlag(nQuestIndex, 1)
			end
		end
		local Identity_x = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1)
		local Identity_y = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5)
		local Identity_z = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9)
		local Identity_MapID = IdentifyManager.GetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13)
		if scene.dwMapID == Identity_MapID then    --在同一场景下才会传送
			if Identity_x > 0 and Identity_y > 0 and Identity_z > 0 then
				player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/江湖百态/方士_还魂.lua", 0, 1)
			end
		elseif Identity_MapID and Identity_MapID > 0 then
			--所处场景和记录场景不一致，清除所有记录数据
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1, 0)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5, 0)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9, 0)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13, 0)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 15, 0)
		end
		if scene.nType ~= 0 then
			--player.SetDynamicSkillGroup(0)        --仍然是方士,并且场景类型不对,清空动态技能栏
			RemoteCallToClient(player.dwID, "CloseIdentityDynActBar")--仍然是方士,并且场景类型不对,清空动态技能栏
		end
	end

	--------------------镖师、绿林相关-----------------------
	if scene.dwMapID == 194 and player.GetQuestPhase(15489) == 1 then
		--player.SetDynamicSkillGroup(293)
		RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 1001)
	end
	if (scene.dwMapID == 25 and player.GetQuestPhase(15498) == 1) or (scene.dwMapID == 27 and player.GetQuestPhase(15479) == 1) then
		--player.SetDynamicSkillGroup(288)
		RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 2001)
	end
	if player.IsHaveBuff(11035, 1) then
		player.DelBuff(11035, 1)
	end

	-------------------------------------------------------------------------------------------------------------------
	-- 大小攻防、JJC地图 关闭所有身份！！！！放到最后处理，可能会在这里关掉身份，所以相关身份处理都要扔在前面！！！！
	local nWeekday = GetCurrentWeekDay()
	local dwCurType = IdentifyManager.dwCurrentIdentityType

	-- 大攻防
	if (scene.dwMapID == 27 and nWeekday == 0) or (scene.dwMapID == 25 and nWeekday == 6) and scene.bGongFangFightFlag == true then
		if IdentifyManager and dwCurType ~= 0 then
			IdentifyManager.CloseIdentity()
			player.SendSystemMessage(GetEditorString(10, 2753))
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2753), 4)
		end
	end

	--小攻防准备时间，此活动从小攻防前一小时开始，到小攻防结束时结束，直接判断这个就行(小攻防不处理了)
	--if CastleFight.CheckPrepareTime() then
	--local tActivityMap = CastleFight.GetMapActivityState()
	--if tActivityMap[scene.dwMapID] and IdentifyManager then
	--IdentifyManager.CloseIdentity()
	--player.SendSystemMessage("据点争夺期间烽火连天，为了更好的战斗，暂将你的身份关闭。")
	--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "据点争夺期间烽火连天，为了更好的战斗，暂将你的身份关闭。", 4)
	--end
	--end
	-- 无法开启身份的场景，这里直接关闭
	if scene.nType ~= MAP_TYPE.NORMAL_MAP and scene.nType ~= MAP_TYPE.TONG_DUNGEON and scene.nType ~= MAP_TYPE.DUNGEON and dwCurType ~= 0 then
		IdentifyManager.CloseIdentity()
		player.SendSystemMessage(GetEditorString(10, 2754))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2754), 4)
	end

	-- 这后面不许加东西！！！！可能会在这里关掉身份，所以相关身份处理都要扔在前面！！！！
end

	local tBuffInfo = {	-- 活动ID为Key
		[35] = {dwBuffID = 10936, nType = 1},
		[36] = {dwBuffID = 4125, nType = 2},
	}
function CheckExamTipsBuff(player)

	for nActivityID, tExamFlagInfo in pairs(tBuffInfo) do

		local StateInfo = GetActivityState(nActivityID)
		if StateInfo and (StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON) then

			if not player.IsHaveBuff(tExamFlagInfo.dwBuffID, 1) then
				local nPromoteTime, _, _ = GetPromoteTime()	--本期科考的期号
				local nLastCommitTime = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_COMMITTIME) --最近一次参加科举考试并交了卷的期数
				local nLastType = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_TYPE) --玩家最近一次有交卷的科考的考试类型（是省试还是会试）

				if nLastCommitTime == nPromoteTime and nLastType == tExamFlagInfo.nType then
					ActivityMark(player, tExamFlagInfo.dwBuffID)
				end
			end

		end

	end
end

function GetPromoteTime(player)
	--按1.6.8版本要求，科举会试时间修改为周六晚上8点到10点，会试奖励超过周一6点还不领取，由邮件发送。 2010.09.28
	-- 科举改造需求，将科举会试时间修改为到周日上午9点，会试放榜和领取奖励时间不变。2011-6-8
	-- 会试时间修改到周日24点，周一七点放榜。2012-4-12
	--[[
	local tStepTime = {
		[1] = {nCycleTime = 3600}, 		--省试预备阶段的时间（1小时,周二6:00~周二7:00）
		[2] = {nCycleTime = 320400}, 	--省试进行阶段的时间（89小时,周二7:00~周五24:00）
		[3] = {nCycleTime = 68400}, 	--闲置阶段的时间（19小时, 周五24:00~周六19:00）
		[4] = {nCycleTime = 3600}, 		--殿试预备阶段的时间（1小时, 周六19:00~周六20:00）
		[5] = {nCycleTime = 100800}, 	--殿试进行阶段的时间（28小时, 周六20:00~周日24:00）
		[6] = {nCycleTime = 25200}, 	--闲置阶段的时间（7小时, 周日24:00~周一7:00）
		[7] = {nCycleTime = 61200}, 	--放榜阶段的时间（17小时, 周一7:00~周一24:00）
		[8] = {nCycleTime = 21600}, 		--闲置阶段的时间（6小时, 周一24:00~周二6:00）
	}
	--]]
	local tStepTime = {
		[1] = {nCycleTime = 1}, -- 省试预备阶段的时间（Monday 0.0.1）
		[2] = {nCycleTime = 5 * 24 * 3600 - 1}, --省试进行阶段的时间（,周1,0:00~周五24:00）
		[3] = {nCycleTime = 68400}, --闲置阶段的时间（19小时, 周五24:00~周六19:00）
		[4] = {nCycleTime = 3600}, -- 殿试预备阶段的时间（1小时, 周六19:00~周六20:00）
		[5] = {nCycleTime = 100800}, --殿试进行阶段的时间（28小时, 周六20:00~周日24:00）
		--	[6] = {nCycleTime = 25200}, 	--闲置阶段的时间（7小时, 周日24:00~周一7:00）
		--	[7] = {nCycleTime = 61200}, 	--放榜阶段的时间（17小时, 周一7:00~周一24:00）
		--	[8] = {nCycleTime = 21600}, 		--闲置阶段的时间（6小时, 周一24:00~周二6:00）
	}

	local tStartTime = {nYear = 2010, nMonth = 5, nDay = 3, nHour = 0, nMinute = 0, nSecond = 0} --第一期科考的起始时间
	local nPeriod = 604800 --一个周期的时间，目前为7天
	local nStartTime = DateToTime(tStartTime.nYear, tStartTime.nMonth, tStartTime.nDay, tStartTime.nHour, tStartTime.nMinute, tStartTime.nSecond)
	local nCurrentTime = GetCurrentTime()
	local nPromoteTime = math.floor(((nCurrentTime - nStartTime) / nPeriod) + 1)

	local nUsedTime = nCurrentTime - nStartTime - (nPromoteTime - 1) * nPeriod --当前时间已经过了本周期多少时间
	local nStep = 0	--当前时间处于本周期的哪个阶段
	local nNextStepTime = 1	--当前时间距离下一个阶段的剩余时间

	local nTestType = 1	--1为省试，2为会试

	if nCurrentTime < nStartTime then --如果当前时间比基准时间早
		nPromoteTime = 0
		nStep = 0
		nNextStepTime = nStartTime - nCurrentTime
		--nTestType = 1
		return nPromoteTime, nStep, nNextStepTime, nTestType
	end

	for nIndex = 1, #tStepTime do
		if tStepTime[nIndex].nCycleTime > nUsedTime then
			nStep = nIndex
			nNextStepTime = tStepTime[nIndex].nCycleTime - nUsedTime
			break
		end

		nUsedTime = nUsedTime - tStepTime[nIndex].nCycleTime
	end
	nPromoteTime = math.mod(nPromoteTime - 1, #EXAM_QUEST_LIST) + 1

--[[
	if nStep > 3 then
		nTestType = 2
	end

	if player and player.GetBuff(9143, 1) then -- 省考的BUFF, 开始考试时加上，考试结束后删除。
		nTestType = 1
	else
		nTestType = 2
	end--]]
	if player then
		local nLastCommitTime = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_COMMITTIME) --最近一次参加科举考试并交了卷的期数
		local nLastType = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_TYPE) --玩家最近一次有交卷的科考的考试类型（是省试还是会试）
		local StateInfo = GetActivityState(197)

		if StateInfo and (StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON)
			and nLastType >= 1 and nLastCommitTime == nPromoteTime then -- 考过省考并且省考时间
			nTestType = 2
		end
	end

	return nPromoteTime, nStep, nNextStepTime, nTestType
end

tKillPointLevelValue = {
	level0 = 0,
	level1 = 50,
	level2 = 100,
	level3 = 200,
	level4 = 500,
}

-- 取得玩家对象的杀气等级
function GetKillPointLevel(player)
	local nKillPointLevel = player.nCurrentKillPoint
	if player then
		if nKillPointLevel == tKillPointLevelValue.level0 then
			nKillPointLevel = 0
		elseif nKillPointLevel < tKillPointLevelValue.level1 then
			nKillPointLevel = 1
		elseif nKillPointLevel < tKillPointLevelValue.level2 then
			nKillPointLevel = 2
		elseif nKillPointLevel < tKillPointLevelValue.level3 then
			nKillPointLevel = 3
		else
			nKillPointLevel = 4
		end
	else
		nKillPointLevel = 0
	end

	return nKillPointLevel
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com