---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_ϵͳ���.lua
-- ����ʱ��:	2017/5/22 17:06:39
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
--[[Include("scripts/Map/������̬/��ʿ/include/��ʿ_Data.lua")
Include("scripts/Map/������̬/Ԧ��ʦ/include/Ԧ��ʦ_Data.lua")
Include("scripts/Map/������̬/include/IdentityBaseFunc.lua")
Include("scripts/Map/�����/include/AllKill_Reward.lh")
Include("scripts/Map/�ƾٿ���/include/CivilServiceExamination.ls")
Include("scripts/Map/Ѱ��ϵͳ/include/HoroSystem.lua")--]]

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
-- �˺�������ʱ���ѵ�20MS���������
function OnEnterSceneCommon_System0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ
	-- ���ϵͳ���볡������
	DoIdentityAcitonEnterMap(player, scene)

	--Ԧ��������
	if player.IsHaveBuff(10864, 1) then  --ɾ��Ԧ�ޱ��
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

					local YS_XueXinHu = scene.CreateNpc(51560, tPosition_YuShou[Pos_ID][1], tPosition_YuShou[Pos_ID][2], tPosition_YuShou[Pos_ID][3], tPosition_YuShou[Pos_ID][4], - 1, "XueXinHu" .. player.dwID, player.dwID)--�������,��������ʱ���ٴ�
					YS_XueXinHu.SetCustomUnsigned4(0, player.dwID)
				end
			end
		end
	end

	-- ����Ŷ��ڱ�����BUFF
	player.DelBuff(9689, 1)
	-- 2014.9 ���볡����10�����޷��ڱ��ر���
	local  buffMission = player.GetBuff(7984, 1);
	if not buffMission or buffMission.nLeftActiveCount < 2 then
		player.AddBuff(0, 99, 7984, 1, 2);--5minһ��
	end

	-- 2014.7 ɾ���ر����˺�BUFF

	for k, v in pairs(tDigHarmfulBuff) do
		if player.IsHaveBuff(v, 1) then
			player.DelGroupBuff(v, 1);
		end
	end
	-- 2014.7 ɾ���ر�������

	if player.GetItemAmountInAllPackages(tDigItem[1], tDigItem[2]) > 0 then
		player.CostItemInAllPackage(tDigItem[1], tDigItem[2], tDigItem[3])
	end

	-- ��������������BUFF
	player.DelBuff(8722, 1)
	player.DelBuff(8723, 1)
	player.DelBuff(8733, 1)
	player.DelBuff(3675, 1)

	--2015.11ɾ��ɱ������޸�Ϊ�����ͼ����
	if scene.dwMapID ~= 74 then

		for i = 1, #tTongItems do
			local nCount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tTongItems[i])
			if nCount > 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tTongItems[i], nCount)
			end
		end
	end

	-- ����_��������
	if player.IsHaveBuff(5431, 1) then
		player.DelBuff(5431, 1)
	end

	-- �ƾٿ��Խ����������
	CheckExamTipsBuff(player)

	-- ���ڼ���ʱ��������������״̬��ҵĴ���
	if scene.dwMapID ~= 152 then
		if player.bPrisonFlag == true then
			local nKillPointLevel = GetKillPointLevel(player)
			if nKillPointLevel >= 2 then
				player.AddBuff(0, 99, 4704, 1, 12)  -- ɱ��ֵ����100����Ҷ�����������Buff��ʱ����
			else
				player.bPrisonFlag = false  -- ɱ��ֵ����100��������״̬
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
			player.SetHuntingFlag(false)  -- �ڼ���������������������״̬
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(4, 6240), 4)
			if player.dwWaistItemIndex == 4005 then
				player.SelectPendent(EQUIPMENT_SUB.WAIST_EXTEND, 0)	-- ж�ز�������
			end
			if player.IsHaveBuff(4857, 1) then
				player.DelBuff(4857, 1)	-- ɾ������Buff
			end
			if player.IsHaveBuff(4958, 1) then
				player.DelBuff(4958, 1)	-- ɾ����������Buff
			end
		end
		player.SetCannotDialogWithNPC(false)	-- �ڼ���������������NPC�Ի����ԽӴ��ڲ��淨
	end

	-- ���´����ڱ�
	RemoteSendHoroSysData(player)

	--���Ҷ�������󡷽���
	AllKill_Reward.GiveRewardToPlayer(player)

	--���������������trap�ʹ��������ͻ���������⴦�����ͼ�ͼ�
	if scene.dwMapID == 150 then
		--����һ����������buff
		local BuffIDIn = 11370
		local BuffIDOut = 11341
		if not player.IsHaveBuff(BuffIDIn, 1) then
			player.AddBuff(0, 99, BuffIDIn, 1, 2400)
		end
		if not player.IsHaveBuff(BuffIDOut, 1) then
			player.AddBuff(0, 99, BuffIDOut, 1, 2400)
		end
	end

	-- �ڱ�ϵͳ��Ҽ�ʱ����ʼ��
	--InitHoroTimerInfo(player)
	if player.GetCustomInteger1(PLAYER_CUSTOM_VALUE.HORO_SYS_TIMER_FLAG) ~= 0 then
		player.SetCustomInteger1(PLAYER_CUSTOM_VALUE.HORO_SYS_TIMER_FLAG, 0)
	end

	-- ����
	if not IsRemotePlayer(player.dwID) then
		local buffPraise = player.GetBuff(12011, 1)
		if buffPraise and buffPraise.nCustomValue < 32 then
			AddPraise(player.dwID, buffPraise.nCustomValue, buffPraise.nStackNum)
			player.DelGroupBuff(12011, 1)
		end
	end
	
	-- ���Ľ���
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

	-- ���볡���������������ݣ�����ʾ��ݶ�̬������

	local dwCurType = IdentifyManager.dwCurrentIdentityType
	if dwCurType ~= 0 then
		local nExp = IdentifyManager.GetIdentityExp(dwCurType)
		local nLevel = GetIdentityLevel(dwCurType, nExp)
		if tSkillGroup[dwCurType] and tSkillGroup[dwCurType][nLevel] then
			RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", tSkillGroup[dwCurType][nLevel])
		end
	end

	--------------------�������-----------------------
	if player.IsHaveBuff(10819, 1) then  -- �����Ƴ�BUFF
		player.DelBuff(10819, 1)
	elseif not IsRemotePlayer(player.dwID) then
		local IdentityManager = player.GetPlayerIdentityManager()
		local nArtist_Reward = IdentityManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.ARTIST, YIREN_IDENTITY_CUSTOM_VALUE.LOVE_POINT) or 0--��ȡ����Ļ��֣�1�־���1��
		if nArtist_Reward > 0 then
			local nArtist_EXP = math.floor(nArtist_Reward / 10 * 0.4)
			local nEnd_Reward = nArtist_Reward * 0.2--������20%������һ�õĽ��
			player.SendSystemMessage(GetEditorString(10, 2062) .. nEnd_Reward .. GetEditorString(10, 3021) .. nArtist_EXP .. GetEditorString(1, 734))
			local szMailText = player.szName .. GetEditorString(10, 2042)
			local nTotal = nEnd_Reward
			local nRepeat = math.floor(nTotal / 200000) + 1
			for i = 1, nRepeat do
				if nTotal > 200000 then
					SendSystemMail(GetEditorString(10, 1638), player.szName, GetEditorString(10, 1639), szMailText, 200000 * 10000)--�������20���ȷ�20��
					Log(
						string.format(
						GetEditorString(10, 1640),
						player.dwID, player.szName, 200000
					)
					)
					nTotal = nTotal - 200000
				elseif nTotal > 0 then
					SendSystemMail(GetEditorString(10, 1638), player.szName, GetEditorString(10, 1639), szMailText, nTotal * 10000)--����20�������һ�η���
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
				player.AddAchievementCount(5379, 1)--���ӳɾ�
			end

			--IdentityManager.LogIdentityClosed(PLAYER_IDENTITY_TYPE.ARTIST, nArtist_Reward / 10 .. ";" .. 0 .. ";" .. 0)
			IdentityManager.LogArtistPerformEnd(IdentityManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.ARTIST) .. ";" .. PLAYER_IDENTITY_TYPE.ARTIST .. ";" .. nArtist_Reward / 10)
			IdentityManager.AddIdentityExp(PLAYER_IDENTITY_TYPE.ARTIST, nArtist_EXP)--���Ӿ���
			IdentityManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.ARTIST, YIREN_IDENTITY_CUSTOM_VALUE.LOVE_POINT, 0)--��մ���Ļ���
		end
	end

	--------------------Ԧ��ʦ���-----------------------
	if player.IsHaveBuff(10864, 1) then  -- ɾ��Ԧ�ޱ��
		player.DelBuff(10864, 1)
	end
	Identity_YuShou.OnEnterScene(player, scene)

	--------------------��ʿ���-----------------------
	------------ͨ�ý�ֹ����BUFF����--------------
	if player.IsHaveBuff(10826, 1) then
		--if IsRemotePlayer(player.dwID) then
		-----��ת��״̬�£�ս����JJC���ر���ݡ��ָ���Ļ���ָ�λ�棬�ָ����˵ı���ɾ��
		player.DelBuff(10827, 1)     --ɾ����ʿ�붨״̬���BUFF
		if player.IsHaveBuff(11494, 1) then
			player.DelBuff(11494, 1)     --ɾ����ʿ�붨״̬͸����BUFF
		end
		--player.DelBuff(10826, 1)     --ͨ�ý�ֹ����BUFF����ɾ��10827�ĺ���������ɾ��
		--end
	end
	--��Ұ�ⳡ��ʱ��ӻ�����BUFF��1����/����ֱ�Ӽ�һ�ܵ�
	--[[local tSceneList = {
		[6] = 1, [150] = 1, [102] = 1, [193] = 1, [158] = 1
	}
	if tSceneList[scene.dwMapID] then
		if scene.nType == 0 then
			player.AddBuff(player.dwID, player.nLevel, 10841, 1, 10080)
		end

		--����б����׷�ٵ�BUFF����ɾ��
		local buff_ghost = player.GetBuff(10842, 1)
		if buff_ghost then
			local ghost = scene.GetNpcByNickName("Identity_Ghost" .. player.dwID)
			if not ghost and buff_ghost.nCustomValue > 0 then
				--����������Ѿ��оɵĹ�꣨�����Ѿ�����λ꣩����������
				Identity_CreatGhost1_5(player, buff_ghost.nCustomValue)
			end
		end
	end--]]
	local npc_Dig = scene.GetNpcByNickName("IdentityWizardDig" .. player.dwID)
	if npc_Dig then
		player.AddMapMark(npc_Dig.nX, npc_Dig.nY, npc_Dig.nZ, 1, GetEditorString(10, 6154))
	end
	if player.dwIdentityVisiableID == 3 or player.dwIdentityVisiableID == 7 then           --�л����������ٴ�����֮��Ӧ�������ʿ��ص�λ��
		player.SetIdentityVisiableID(0)
	end

	if dwCurType == PLAYER_IDENTITY_TYPE.WIZARD then
		if player.IsHaveBuff(2587, 1) then
			player.DelBuff(2587, 1)
		end
		--ͨ�õ����Լ�������
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
		if scene.dwMapID == Identity_MapID then    --��ͬһ�����²Żᴫ��
			if Identity_x > 0 and Identity_y > 0 and Identity_z > 0 then
				player.SetTimer(0.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", 0, 1)
			end
		elseif Identity_MapID and Identity_MapID > 0 then
			--���������ͼ�¼������һ�£�������м�¼����
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1, 0)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5, 0)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9, 0)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13, 0)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 15, 0)
		end
		if scene.nType ~= 0 then
			--player.SetDynamicSkillGroup(0)        --��Ȼ�Ƿ�ʿ,���ҳ������Ͳ���,��ն�̬������
			RemoteCallToClient(player.dwID, "CloseIdentityDynActBar")--��Ȼ�Ƿ�ʿ,���ҳ������Ͳ���,��ն�̬������
		end
	end

	--------------------��ʦ���������-----------------------
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
	-- ��С������JJC��ͼ �ر�������ݣ��������ŵ���������ܻ�������ص���ݣ����������ݴ���Ҫ����ǰ�棡������
	local nWeekday = GetCurrentWeekDay()
	local dwCurType = IdentifyManager.dwCurrentIdentityType

	-- �󹥷�
	if (scene.dwMapID == 27 and nWeekday == 0) or (scene.dwMapID == 25 and nWeekday == 6) and scene.bGongFangFightFlag == true then
		if IdentifyManager and dwCurType ~= 0 then
			IdentifyManager.CloseIdentity()
			player.SendSystemMessage(GetEditorString(10, 2753))
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2753), 4)
		end
	end

	--С����׼��ʱ�䣬�˻��С����ǰһСʱ��ʼ����С��������ʱ������ֱ���ж��������(С������������)
	--if CastleFight.CheckPrepareTime() then
	--local tActivityMap = CastleFight.GetMapActivityState()
	--if tActivityMap[scene.dwMapID] and IdentifyManager then
	--IdentifyManager.CloseIdentity()
	--player.SendSystemMessage("�ݵ������ڼ������죬Ϊ�˸��õ�ս�����ݽ������ݹرա�")
	--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "�ݵ������ڼ������죬Ϊ�˸��õ�ս�����ݽ������ݹرա�", 4)
	--end
	--end
	-- �޷�������ݵĳ���������ֱ�ӹر�
	if scene.nType ~= MAP_TYPE.NORMAL_MAP and scene.nType ~= MAP_TYPE.TONG_DUNGEON and scene.nType ~= MAP_TYPE.DUNGEON and dwCurType ~= 0 then
		IdentifyManager.CloseIdentity()
		player.SendSystemMessage(GetEditorString(10, 2754))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 2754), 4)
	end

	-- ����治��Ӷ��������������ܻ�������ص���ݣ����������ݴ���Ҫ����ǰ�棡������
end

	local tBuffInfo = {	-- �IDΪKey
		[35] = {dwBuffID = 10936, nType = 1},
		[36] = {dwBuffID = 4125, nType = 2},
	}
function CheckExamTipsBuff(player)

	for nActivityID, tExamFlagInfo in pairs(tBuffInfo) do

		local StateInfo = GetActivityState(nActivityID)
		if StateInfo and (StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON) then

			if not player.IsHaveBuff(tExamFlagInfo.dwBuffID, 1) then
				local nPromoteTime, _, _ = GetPromoteTime()	--���ڿƿ����ں�
				local nLastCommitTime = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_COMMITTIME) --���һ�βμӿƾٿ��Բ����˾������
				local nLastType = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_TYPE) --������һ���н���Ŀƿ��Ŀ������ͣ���ʡ�Ի��ǻ��ԣ�

				if nLastCommitTime == nPromoteTime and nLastType == tExamFlagInfo.nType then
					ActivityMark(player, tExamFlagInfo.dwBuffID)
				end
			end

		end

	end
end

function GetPromoteTime(player)
	--��1.6.8�汾Ҫ�󣬿ƾٻ���ʱ���޸�Ϊ��������8�㵽10�㣬���Խ���������һ6�㻹����ȡ�����ʼ����͡� 2010.09.28
	-- �ƾٸ������󣬽��ƾٻ���ʱ���޸�Ϊ����������9�㣬���ԷŰ����ȡ����ʱ�䲻�䡣2011-6-8
	-- ����ʱ���޸ĵ�����24�㣬��һ�ߵ�Ű�2012-4-12
	--[[
	local tStepTime = {
		[1] = {nCycleTime = 3600}, 		--ʡ��Ԥ���׶ε�ʱ�䣨1Сʱ,�ܶ�6:00~�ܶ�7:00��
		[2] = {nCycleTime = 320400}, 	--ʡ�Խ��н׶ε�ʱ�䣨89Сʱ,�ܶ�7:00~����24:00��
		[3] = {nCycleTime = 68400}, 	--���ý׶ε�ʱ�䣨19Сʱ, ����24:00~����19:00��
		[4] = {nCycleTime = 3600}, 		--����Ԥ���׶ε�ʱ�䣨1Сʱ, ����19:00~����20:00��
		[5] = {nCycleTime = 100800}, 	--���Խ��н׶ε�ʱ�䣨28Сʱ, ����20:00~����24:00��
		[6] = {nCycleTime = 25200}, 	--���ý׶ε�ʱ�䣨7Сʱ, ����24:00~��һ7:00��
		[7] = {nCycleTime = 61200}, 	--�Ű�׶ε�ʱ�䣨17Сʱ, ��һ7:00~��һ24:00��
		[8] = {nCycleTime = 21600}, 		--���ý׶ε�ʱ�䣨6Сʱ, ��һ24:00~�ܶ�6:00��
	}
	--]]
	local tStepTime = {
		[1] = {nCycleTime = 1}, -- ʡ��Ԥ���׶ε�ʱ�䣨Monday 0.0.1��
		[2] = {nCycleTime = 5 * 24 * 3600 - 1}, --ʡ�Խ��н׶ε�ʱ�䣨,��1,0:00~����24:00��
		[3] = {nCycleTime = 68400}, --���ý׶ε�ʱ�䣨19Сʱ, ����24:00~����19:00��
		[4] = {nCycleTime = 3600}, -- ����Ԥ���׶ε�ʱ�䣨1Сʱ, ����19:00~����20:00��
		[5] = {nCycleTime = 100800}, --���Խ��н׶ε�ʱ�䣨28Сʱ, ����20:00~����24:00��
		--	[6] = {nCycleTime = 25200}, 	--���ý׶ε�ʱ�䣨7Сʱ, ����24:00~��һ7:00��
		--	[7] = {nCycleTime = 61200}, 	--�Ű�׶ε�ʱ�䣨17Сʱ, ��һ7:00~��һ24:00��
		--	[8] = {nCycleTime = 21600}, 		--���ý׶ε�ʱ�䣨6Сʱ, ��һ24:00~�ܶ�6:00��
	}

	local tStartTime = {nYear = 2010, nMonth = 5, nDay = 3, nHour = 0, nMinute = 0, nSecond = 0} --��һ�ڿƿ�����ʼʱ��
	local nPeriod = 604800 --һ�����ڵ�ʱ�䣬ĿǰΪ7��
	local nStartTime = DateToTime(tStartTime.nYear, tStartTime.nMonth, tStartTime.nDay, tStartTime.nHour, tStartTime.nMinute, tStartTime.nSecond)
	local nCurrentTime = GetCurrentTime()
	local nPromoteTime = math.floor(((nCurrentTime - nStartTime) / nPeriod) + 1)

	local nUsedTime = nCurrentTime - nStartTime - (nPromoteTime - 1) * nPeriod --��ǰʱ���Ѿ����˱����ڶ���ʱ��
	local nStep = 0	--��ǰʱ�䴦�ڱ����ڵ��ĸ��׶�
	local nNextStepTime = 1	--��ǰʱ�������һ���׶ε�ʣ��ʱ��

	local nTestType = 1	--1Ϊʡ�ԣ�2Ϊ����

	if nCurrentTime < nStartTime then --�����ǰʱ��Ȼ�׼ʱ����
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

	if player and player.GetBuff(9143, 1) then -- ʡ����BUFF, ��ʼ����ʱ���ϣ����Խ�����ɾ����
		nTestType = 1
	else
		nTestType = 2
	end--]]
	if player then
		local nLastCommitTime = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_COMMITTIME) --���һ�βμӿƾٿ��Բ����˾������
		local nLastType = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_LAST_TYPE) --������һ���н���Ŀƿ��Ŀ������ͣ���ʡ�Ի��ǻ��ԣ�
		local StateInfo = GetActivityState(197)

		if StateInfo and (StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON)
			and nLastType >= 1 and nLastCommitTime == nPromoteTime then -- ����ʡ������ʡ��ʱ��
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

-- ȡ����Ҷ����ɱ���ȼ�
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com