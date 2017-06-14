---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_��������.lua
-- ����ʱ��:	2017/5/22 17:03:44
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
-- Include("scripts/Map/ѱ��ϵͳ/include/�԰����������.lua")
Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

local tBanList = {
	PLAYER_TALK_CHANNEL.WORLD,
	PLAYER_TALK_CHANNEL.SENCE,
	PLAYER_TALK_CHANNEL.NEARBY,
	PLAYER_TALK_CHANNEL.FORCE,
	PLAYER_TALK_CHANNEL.CAMP,
	PLAYER_TALK_CHANNEL.IDENTITY,
	PLAYER_TALK_CHANNEL.WHISPER,
	PLAYER_TALK_CHANNEL.FRIENDS,
	PLAYER_TALK_CHANNEL.RAID,
	PLAYER_TALK_CHANNEL.TEAM,
}
local tYXCopyMapList = {
	[40] = {40, 26}, [43] = {43, 19}, [37] = {37, 17}, [46] = {46, 32}, [36] = {36, 20},
	[45] = {45, 14}, [42] = {42, 33}, [41] = {41, 18}, [44] = {44, 28}, [62] = {62, 51},
	[63] = {63, 61}, [64] = {64, 61}, [65] = {65, 60}, [66] = {66, 60},
}
local tMapChengJiuAnShiZhiLuan = {3495, 3493, 3492, 3491, 3494}
local tMapChengJiu_90 = {4958, 4959, 4960, 4961}
local PLAYER_CUSTOM_VALUE = PLAYER_CUSTOM_VALUE
function OnEnterSceneCommon_Common0(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ

	-- �ϳ����������Զ�������ͨ�㣬�ӳɾ�
	CheckOldMapTrafficNode(player, scene)

	--if FZHDCJ[scene.dwMapID] and player.GetBuff(4964, 0) then--��ֵ����˲�Ҫ��
	--local zongkong = scene.GetNpcByNickName("FZHD_BXZK")
	--if zongkong then
	--zongkong.FireAIEvent(2003,1,1)
	--end
	--end

	-- δ���ѽ���
	local GV = GetGameVersion()
	if GV and GV.VersionLineName == "zhcn" and GV.VersionEx == "PakV3" and GetServerIndex() ~= 31 then
		if player.GetCustomBitValue(PLAYER_CUSTOM_VALUE.NO_CHARGE_BAN, 0) then
			player.Ban(1)
		end
		if player.GetCustomBitValue(PLAYER_CUSTOM_VALUE.NO_CHARGE_BAN, 1) then
			player.Ban(1)
		end
		if player.GetExtPoint(0) == 0 then

			player.Ban(3600 * 24 * 7, tBanList)
			player.SetCustomBitValue(PLAYER_CUSTOM_VALUE.NO_CHARGE_BAN, 1, true)
		else
			if player.GetCustomBitValue(PLAYER_CUSTOM_VALUE.NO_CHARGE_BAN, 1) then
				player.Ban(1)
				player.SetCustomBitValue(PLAYER_CUSTOM_VALUE.NO_CHARGE_BAN, 1, false)
			end
		end
		if player.bFreeIP then
			player.Ban(1)
		end

		--if  player.bExtDataLoadFinish and (not IsRemotePlayer(player.dwID))then -- ������ߺͿ����һص�����ʱ������Ƿ������߶����������棬��������ˣ���Ѷ��������ͬ����gs����صĶ��ᣨ���ԡ������ʲ����ͻ���Ч��
			
		--end
	end

	-- Ӣ�۸�����ͼ������־λ���⴦��
	-- tYXCopyMapListΪӢ�۸����Ͷ�Ӧ����ͨ�����б���ʽ��[Ӣ�۸���MapID] = {Ӣ�۸���MapID, ��Ӧ��ͨ����MapID}

	if tYXCopyMapList[scene.dwMapID] then
		player.SetMapVisitFlag(tYXCopyMapList[scene.dwMapID][2])
	end

	--70����û��ǰ������ʷ֮����ָ��ȥ
	if player.nLevel >= 70 and player.nLevel < 90 then

		--�����䣬��ߣ��������������㻪��
		local bGoXinDiTu = false
		for i = 1, #tMapChengJiuAnShiZhiLuan do
			if player.IsAchievementAcquired(tMapChengJiuAnShiZhiLuan[i]) then
				bGoXinDiTu = true
				break
			end
		end

		if not bGoXinDiTu then
			if not (scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD) then
				player.SetTimer(16 * 10, "scripts/Map/����ͨ��/event/70�����������³�������.lua", 1, scene.dwMapID)
			end
		end
	end

	--90����û��ǰ��������������ָ��ȥ
	if player.nLevel >= 90 and player.nLevel < 93 then

		--��̨ɽ�����ԭ���ڸ�ڣ�ǧ����
		local bGoXinDiTu = false
		for i = 1, #tMapChengJiu_90 do
			if player.IsAchievementAcquired(tMapChengJiu_90[i]) then
				bGoXinDiTu = true
				break
			end
		end

		if not bGoXinDiTu then
			player.SetTimer(16 * 10, "scripts/Map/����ͨ��/event/80�����������³�������.lua", 1, scene.dwMapID)
		end
	end
	---------------------

	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

function OnEnterSceneCommon_Common1(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ

	--������ͼ�Զ��ٻ������Ĵ���ս���͸�������
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseNewPetSkillPanel")
	if scene.nType ~= MAP_TYPE.DUNGEON and scene.nType ~= MAP_TYPE.BATTLE_FIELD then
		local nFellowPetIndex = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.FOLLOWPET_SAVE_DATA)
		if nFellowPetIndex ~= 0 then
			--��������ж�
			if player.IsFellowPetAcquired(nFellowPetIndex) then
				local dwNpcTemplateID = GetNpcTemplateIDByFellowPetIndex(nFellowPetIndex)
				--���ٻ�����NPC����ʼ����-----------------------------------------------------------------------------------
				scene.CreateFellowPet(dwNpcTemplateID, player.nX + 30, player.nY + 30, player.nZ + 30, 0, - 1, player.dwID)
				--���ٻ�����NPC����������-----------------------------------------------------------------------------------
				--�ٻ�������
				RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "OpenNewPetSkillPanel", nFellowPetIndex)
			else
				player.SetCustomUnsigned1(PLAYER_CUSTOM_VALUE.FOLLOWPET_SAVE_DATA, 0)
			end
		end
	end
	---------------------
	Do_YuTou_ItemDecayManage(player)--����������

	--- δ������ɫ���볡����ǿ�ƹر���Ӫ����һ��------
	if player.nLevel < 90 and player.nCamp ~= 0 then
		player.CloseCampFlag(true)
	end

	----------------------------------------
	if player.nCamp == CAMP.GOOD then
		if scene.nCampType == MAP_CAMP_TYPE.ALL_PROTECT then
			player.CloseCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.PROTECT_GOOD then
			player.OpenCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.PROTECT_EVIL then
			player.OpenCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.NEUTRAL then
			player.CloseCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.FIGHT then
			player.OpenCampFlag();
		end
	end

	if player.nCamp == CAMP.EVIL then
		if scene.nCampType == MAP_CAMP_TYPE.ALL_PROTECT then
			player.CloseCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.PROTECT_GOOD then
			player.OpenCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.PROTECT_EVIL then
			player.OpenCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.NEUTRAL then
			player.CloseCampFlag();
		elseif scene.nCampType == MAP_CAMP_TYPE.FIGHT then
			player.OpenCampFlag();
		end
	end

	-- ���Ϳƾٻ�����ʼ������ڿ�����ܷ��ʼ������˲���ת����ҵ�½ʱ����
	--if player.nLevel >= 10 and player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_EMAIL) ~= 1 then
	--	SendSystemMail(GLOBAL_STRING_TABLE.EXAM_STRING.SEND_EXAM_MAIL.SENDER_NAME, player.szName, GLOBAL_STRING_TABLE.EXAM_STRING.SEND_EXAM_MAIL.MAIL_TITLE, GLOBAL_STRING_TABLE.EXAM_STRING.SEND_EXAM_MAIL.TEXT, 0, ITEM_TABLE_TYPE.OTHER, 6414, 1)
	--	player.SetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_EMAIL, 1)
	--end

	--�ƾٻ��Խ��������ʼ���飬���ڿ�����ܷ����ʼ������Ϊ����ҵ�½�ű�����
	--CheckExamRewards_Modify(player)

	---------------------
	--ˮǹ�Ҽ�����ɾ��
	player.DelBuff(9153, 1)
	player.DelBuff(9154, 1)
	player.DelBuff(9163, 1)
	player.DelBuff(9164, 1)
	player.DelBuff(9165, 1)
	player.DelBuff(9166, 1)
	---------------------

	-- 2014.3.17Ԥ�Ȼ  ��Ӯ��ս��ʤ���ķ������������
	-- center_scripts/RemoteFromServer/On_Yure201403.lua    On_Yure201403_UpdateRankList(nConnIndex, tongID, score, type)
	--if player.IsHaveBuff(7551, 1) then
	--print("ս��ʤ����������һ�֡�")
	--player.DelBuff(7551, 1)
	--RemoteCallToCenter("On_Yure201403_UpdateRankList", player.dwID, player.dwTongID, 1, 1)
	--end

	--��ҽ��볡�����ٻ���ʿ����ڱ����ܿأ�û���򴴽���ֻ����һ�Σ�
	--if scene.nType ~= MAP_TYPE.BATTLE_FIELD and scene.nType ~= MAP_TYPE.BIRTH_MAP and scene.nType ~= MAP_TYPE.DUNGEON and scene.nType ~= MAP_TYPE.TONG_DUNGEON then
	--local npcSF_FS = scene.GetNpcByNickName("IDENTITY_FS_ChestZK")
	--if not npcSF_FS then
	--local tbMapCheck = { --�������ϰ�������ˮ�ĵ�ͼ���⴦��
	--[10] = {18157, 1445, 1048832},
	--}
	--if tbMapCheck[scene.dwMapID] then
	--scene.CreateNpc(51491, tbMapCheck[scene.dwMapID][1], tbMapCheck[scene.dwMapID][2], tbMapCheck[scene.dwMapID][3], 1, - 1, "IDENTITY_FS_ChestZK")
	--else
	--scene.CreateNpc(51491, 1, 1, 1, 1, - 1, "IDENTITY_FS_ChestZK")
	--end
	--end
	--end
	local nSkill = player.GetKungfuMount()

	if nSkill then
		if  nSkill.dwSkillID == 10389 or nSkill.dwSkillID == 10390 then  --���������ķ�
			player.DelBuff(8278, 1) --ɾ������̬
			player.AddBuff(0, 99, 8277, 1, 1) --��Ӷ���̬
			local LvDF = player.GetSkillLevel(13050)
			if LvDF then
				RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 13051, 13050, LvDF)
			end
		end

		--ͳһ�����ͼ���ơ��Ե���̬�л�������
		if nSkill.dwSkillID == 10464 then   ---�Ե���½��̬����

			--����Ϊ˫���ȼ���
			local lv_SDlongxianghubu = player.GetSkillLevel(16628)
			local lv_SDleizoufengqie = player.GetSkillLevel(16629)
			local lv_SDtayanyangqi = player.GetSkillLevel(16633)
			--��������������
			if player.GetSkillLevel(16601) >= 1 then
				RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 16601, 1)
			end

			if player.IsHaveBuff(10815, 1) then
				if lv_SDlongxianghubu ~= 0 then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16028, 16628, lv_SDlongxianghubu, 16028)
				end

				if lv_SDleizoufengqie ~= 0 then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16598, 16629, lv_SDleizoufengqie, 16598)
					CDTransfer(player, 1110, 0, 1117, 1)
				end

				if lv_SDtayanyangqi ~= 0 then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16460, 16633, lv_SDtayanyangqi, 16460)
					CDTransfer(player, 1098, 0, 1118, 1)
					--CDTransfer(player, 1118, 1, 1098, 0)
				end

				RemoteCallToClient(player.dwID, "OnSkillReplace", 16168, 16454, 1, 16168)
			else
				if lv_SDlongxianghubu ~= 0 then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16628, 16028, lv_SDlongxianghubu, 16028)
				end

				if lv_SDleizoufengqie ~= 0 then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16629, 16598, lv_SDleizoufengqie, 16598)
					CDTransfer(player, 1117, 1, 1110, 0)
				end

				if lv_SDtayanyangqi ~= 0 then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16633, 16460, lv_SDtayanyangqi, 16460)
					CDTransfer(player, 1118, 1, 1098, 0)
					--CDTransfer(player, 1118, 1, 1098, 0)
				end

				if player.IsHaveBuff(10814, 1) then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16166, 16608, 1, 16166)
				elseif player.IsHaveBuff(10816, 1) then
					RemoteCallToClient(player.dwID, "OnSkillReplace", 16169, 16459, 1, 16169)
				end
			end
		end
	end

	--�Ե������������̬��������������
	if player.IsHaveBuff(10814, 1) then
		RemoteCallToClient(player.dwID, "OnSkillReplace", 16166, 16608, 1, 16166)
	end
	if player.IsHaveBuff(10815, 1) then
		RemoteCallToClient(player.dwID, "OnSkillReplace", 16168, 16454, 1, 16168)
	end
	if player.IsHaveBuff(10816, 1) then
		RemoteCallToClient(player.dwID, "OnSkillReplace", 16169, 16459, 1, 16169)
	end

	--���Ź�ͼ���Ƕ�Ӱ����
	if player.dwForceID == 7 then
		for i = 1, 2 do
			if player.IsHaveBuff(11885 + i, 1) then
				player.DelBuff(11885 + i, 1)
			end
		end
	end

	--���Ź�ͼǧ����ӳɴ���
	if player.IsHaveBuff(6112, 1) then
		player.DelBuff(6112, 1)
	end

	if player.IsHaveBuff(6113, 1)then
		player.DelBuff(6113, 1)
	end

	--�����ͼ��Ӱ��б����
	if player.dwForceID == 22 then
		for i = 1, 6 do
			if player.IsHaveBuff(9992 + i, 1) then
				player.DelBuff(9992 + i, 1)
			end
		end
	end

	-- ����������ݴ���
	
	if not IsRemotePlayer(player.dwID) then
		local buff = player.GetBuff(12011, 1)
		if buff then
			local nPraiseType = buff.nCustomValue
			if nPraiseType > 0 then
				AddPraise(player.dwID, nPraiseType, buff.nStackNum)
			end
			player.DelGroupBuff(12011, 1)
		end
	end
	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

local tMapIDToNode = {
	[2] = 13, -- ��
	[5] = 9, -- ����
	[6] = 24, -- ����
	[7] = 7, -- ����
	[8] = 41, -- ����
	[9] = 21, -- ���
	[11] = 11, -- ���
	[12] = 49, -- �㻪��
	[13] = 15, -- ��ˮ��
	[15] = 36, -- ����
	[23] = 101, -- ���Ż�Į
	--[30] = 87, -- ����
	[21] = 97, -- ����
	[35] = 99, -- ����Ͽ
	--[22] = 91, -- ����ɽ
	--[27] = 116, -- ���˹�
	--[25] = 105, -- ���˹ȶ���
	[100] = 342, -- ����
	[101] = 435, -- ����
	[102] = 345, -- �嶾
	[103] = 432, -- ����
	[104] = 217, -- ����
	[108] = 440, -- �ɶ�
	[122] = 516, -- ����
	[10] = 47, -- �ܵ�(����)
	[16] = 38, -- ����
	[49] = 135, -- �ؽ�
}

local tMapCampIDToNode = {
	[30] = {[0] = 87, [1] = 117, [2] = 119}, -- ����
	[22] = {[0] = 91, [1] = 108, [2] = 110}, -- ����ɽ
	[27] = {[2] = 116}, -- ���˹�
	[25] = {[1] = 105}, -- ������
}
local tMapIDToAchievement = {
	[2] = 437, -- ��
	[5] = 577, -- ����
	[6] = 443, -- ����
	[7] = 578, -- ����
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
	[10] = 446, -- �ܵ������飩
	[16] = 438, -- ����
	[49] = 1338, -- �ؽ�
	--[27] = XX, -- ���˹�
	--[25] = XX, -- ������
}
function CheckOldMapTrafficNode(player, scene)
	if not scene then
		scene = player.GetScene()
	end

	if tMapCampIDToNode[scene.dwMapID] then
		if tMapCampIDToNode[scene.dwMapID][player.nCamp] then
			if not player.IsOpenRouteNode(tMapCampIDToNode[scene.dwMapID][player.nCamp]) then
				player.OpenRouteNode(tMapCampIDToNode[scene.dwMapID][player.nCamp])
				player.SendSystemMessage(GLOBAL_STRING_TABLE.OPEN_ROUTE_NODE)
			end
		end
	elseif tMapIDToNode[scene.dwMapID] then
		if not player.IsOpenRouteNode(tMapIDToNode[scene.dwMapID]) then
			player.OpenRouteNode(tMapIDToNode[scene.dwMapID])
			player.SendSystemMessage(GLOBAL_STRING_TABLE.OPEN_ROUTE_NODE)
		end
	end

	if tMapIDToAchievement[scene.dwMapID] then
		if not player.IsAchievementAcquired(tMapIDToAchievement[scene.dwMapID]) then
			player.AcquireAchievement(tMapIDToAchievement[scene.dwMapID])
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com