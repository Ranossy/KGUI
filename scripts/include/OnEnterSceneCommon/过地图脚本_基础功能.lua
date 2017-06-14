---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/OnEnterSceneCommon/过地图脚本_基础功能.lua
-- 更新时间:	2017/5/22 17:03:44
-- 更新用户:	zhengfeng5
-- 脚本说明:
----------------------------------------------------------------------<
-- Include("scripts/Map/驯养系统/include/卦板道具自损处理.lua")
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
	-- 正文开始

	-- 老场景进场景自动开启交通点，加成就
	CheckOldMapTrafficNode(player, scene)

	--if FZHDCJ[scene.dwMapID] and player.GetBuff(4964, 0) then--峰值活动过了不要了
	--local zongkong = scene.GetNpcByNickName("FZHD_BXZK")
	--if zongkong then
	--zongkong.FireAIEvent(2003,1,1)
	--end
	--end

	-- 未付费禁言
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

		--if  player.bExtDataLoadFinish and (not IsRemotePlayer(player.dwID))then -- 玩家上线和跨服玩家回到本服时，检查是否在离线冻结数据里面，如果冻结了，会把冻结的数据同步到gs，相关的冻结（禁言、冻结资产）就会生效。
			
		--end
	end

	-- 英雄副本地图开启标志位特殊处理
	-- tYXCopyMapList为英雄副本和对应的普通副本列表，格式：[英雄副本MapID] = {英雄副本MapID, 对应普通副本MapID}

	if tYXCopyMapList[scene.dwMapID] then
		player.SetMapVisitFlag(tYXCopyMapList[scene.dwMapID][2])
	end

	--70级别没有前往过安史之乱则指引去
	if player.nLevel >= 70 and player.nLevel < 90 then

		--马嵬驿，天策，长安，洛阳，枫华谷
		local bGoXinDiTu = false
		for i = 1, #tMapChengJiuAnShiZhiLuan do
			if player.IsAchievementAcquired(tMapChengJiuAnShiZhiLuan[i]) then
				bGoXinDiTu = true
				break
			end
		end

		if not bGoXinDiTu then
			if not (scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD) then
				player.SetTimer(16 * 10, "scripts/Map/世界通用/event/70级引导进入新场景处理.lua", 1, scene.dwMapID)
			end
		end
	end

	--90级别没有前往过剑胆琴心则指引去
	if player.nLevel >= 90 and player.nLevel < 93 then

		--五台山，大草原，黑戈壁，千岛湖
		local bGoXinDiTu = false
		for i = 1, #tMapChengJiu_90 do
			if player.IsAchievementAcquired(tMapChengJiu_90[i]) then
				bGoXinDiTu = true
				break
			end
		end

		if not bGoXinDiTu then
			player.SetTimer(16 * 10, "scripts/Map/世界通用/event/80级引导进入新场景处理.lua", 1, scene.dwMapID)
		end
	end
	---------------------

	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

function OnEnterSceneCommon_Common1(player, scene)
	if not scene then
		scene = player.GetScene()
	end
	local nStartIndex = BeginTimeStat()
	-- 正文开始

	--宠物跨地图自动召唤出来的处理，战场和副本除外
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseNewPetSkillPanel")
	if scene.nType ~= MAP_TYPE.DUNGEON and scene.nType ~= MAP_TYPE.BATTLE_FIELD then
		local nFellowPetIndex = player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.FOLLOWPET_SAVE_DATA)
		if nFellowPetIndex ~= 0 then
			--宠物存在判断
			if player.IsFellowPetAcquired(nFellowPetIndex) then
				local dwNpcTemplateID = GetNpcTemplateIDByFellowPetIndex(nFellowPetIndex)
				--★召唤宠物NPC【开始】★-----------------------------------------------------------------------------------
				scene.CreateFellowPet(dwNpcTemplateID, player.nX + 30, player.nY + 30, player.nZ + 30, 0, - 1, player.dwID)
				--★召唤宠物NPC【结束】★-----------------------------------------------------------------------------------
				--召唤技能栏
				RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "OpenNewPetSkillPanel", nFellowPetIndex)
			else
				player.SetCustomUnsigned1(PLAYER_CUSTOM_VALUE.FOLLOWPET_SAVE_DATA, 0)
			end
		end
	end
	---------------------
	Do_YuTou_ItemDecayManage(player)--道具自损处理

	--- 未满级角色进入场景，强制关闭阵营开关一次------
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

	-- 发送科举活动宣传邮件，由于跨服不能发邮件，将此部分转到玩家登陆时发送
	--if player.nLevel >= 10 and player.GetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_EMAIL) ~= 1 then
	--	SendSystemMail(GLOBAL_STRING_TABLE.EXAM_STRING.SEND_EXAM_MAIL.SENDER_NAME, player.szName, GLOBAL_STRING_TABLE.EXAM_STRING.SEND_EXAM_MAIL.MAIL_TITLE, GLOBAL_STRING_TABLE.EXAM_STRING.SEND_EXAM_MAIL.TEXT, 0, ITEM_TABLE_TYPE.OTHER, 6414, 1)
	--	player.SetCustomUnsigned1(PLAYER_CUSTOM_VALUE.CIVILSERVICEEXAM_EMAIL, 1)
	--end

	--科举会试奖励逾期邮件检查，由于跨服不能发送邮件，则改为在玩家登陆脚本调用
	--CheckExamRewards_Modify(player)

	---------------------
	--水枪挂件处理删除
	player.DelBuff(9153, 1)
	player.DelBuff(9154, 1)
	player.DelBuff(9163, 1)
	player.DelBuff(9164, 1)
	player.DelBuff(9165, 1)
	player.DelBuff(9166, 1)
	---------------------

	-- 2014.3.17预热活动  将赢得战场胜利的分数加入帮会积分
	-- center_scripts/RemoteFromServer/On_Yure201403.lua    On_Yure201403_UpdateRankList(nConnIndex, tongID, score, type)
	--if player.IsHaveBuff(7551, 1) then
	--print("战场胜利，给帮会加一分。")
	--player.DelBuff(7551, 1)
	--RemoteCallToCenter("On_Yure201403_UpdateRankList", player.dwID, player.dwTongID, 1, 1)
	--end

	--玩家进入场景后召唤方士身份挖宝点总控（没有则创建且只创建一次）
	--if scene.nType ~= MAP_TYPE.BATTLE_FIELD and scene.nType ~= MAP_TYPE.BIRTH_MAP and scene.nType ~= MAP_TYPE.DUNGEON and scene.nType ~= MAP_TYPE.TONG_DUNGEON then
	--local npcSF_FS = scene.GetNpcByNickName("IDENTITY_FS_ChestZK")
	--if not npcSF_FS then
	--local tbMapCheck = { --角落有障碍或者有水的地图特殊处理
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
		if  nSkill.dwSkillID == 10389 or nSkill.dwSkillID == 10390 then  --苍云两个心法
			player.DelBuff(8278, 1) --删除刀姿态
			player.AddBuff(0, 99, 8277, 1, 1) --添加盾姿态
			local LvDF = player.GetSkillLevel(13050)
			if LvDF then
				RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 13051, 13050, LvDF)
			end
		end

		--统一处理过图苍云、霸刀姿态切换的问题
		if nSkill.dwSkillID == 10464 then   ---霸刀登陆姿态操作

			--矫正为双刀腿技能
			local lv_SDlongxianghubu = player.GetSkillLevel(16628)
			local lv_SDleizoufengqie = player.GetSkillLevel(16629)
			local lv_SDtayanyangqi = player.GetSkillLevel(16633)
			--给项王击鼎打标记
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

	--霸刀跨服务器三体态主被动技能修正
	if player.IsHaveBuff(10814, 1) then
		RemoteCallToClient(player.dwID, "OnSkillReplace", 16166, 16608, 1, 16166)
	end
	if player.IsHaveBuff(10815, 1) then
		RemoteCallToClient(player.dwID, "OnSkillReplace", 16168, 16454, 1, 16168)
	end
	if player.IsHaveBuff(10816, 1) then
		RemoteCallToClient(player.dwID, "OnSkillReplace", 16169, 16459, 1, 16169)
	end

	--唐门过图飞星遁影处理
	if player.dwForceID == 7 then
		for i = 1, 2 do
			if player.IsHaveBuff(11885 + i, 1) then
				player.DelBuff(11885 + i, 1)
			end
		end
	end

	--唐门过图千机变加成处理
	if player.IsHaveBuff(6112, 1) then
		player.DelBuff(6112, 1)
	end

	if player.IsHaveBuff(6113, 1)then
		player.DelBuff(6113, 1)
	end

	--长歌过图疏影横斜处理
	if player.dwForceID == 22 then
		for i = 1, 6 do
			if player.IsHaveBuff(9992 + i, 1) then
				player.DelBuff(9992 + i, 1)
			end
		end
	end

	-- 跨服点赞数据处理
	
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
	-- 正文结束
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

local tMapIDToNode = {
	[2] = 13, -- 万花
	[5] = 9, -- 少林
	[6] = 24, -- 扬州
	[7] = 7, -- 纯阳
	[8] = 41, -- 洛阳
	[9] = 21, -- 洛道
	[11] = 11, -- 天策
	[12] = 49, -- 枫华谷
	[13] = 15, -- 金水镇
	[15] = 36, -- 长安
	[23] = 101, -- 龙门荒漠
	--[30] = 87, -- 昆仑
	[21] = 97, -- 巴陵
	[35] = 99, -- 瞿塘峡
	--[22] = 91, -- 南屏山
	--[27] = 116, -- 恶人谷
	--[25] = 105, -- 恶人谷对立
	[100] = 342, -- 白龙
	[101] = 435, -- 无量
	[102] = 345, -- 五毒
	[103] = 432, -- 融天
	[104] = 217, -- 黑龙
	[108] = 440, -- 成都
	[122] = 516, -- 唐门
	[10] = 47, -- 寇岛(东篱)
	[16] = 38, -- 七秀
	[49] = 135, -- 藏剑
}

local tMapCampIDToNode = {
	[30] = {[0] = 87, [1] = 117, [2] = 119}, -- 昆仑
	[22] = {[0] = 91, [1] = 108, [2] = 110}, -- 南屏山
	[27] = {[2] = 116}, -- 恶人谷
	[25] = {[1] = 105}, -- 浩气盟
}
local tMapIDToAchievement = {
	[2] = 437, -- 万花
	[5] = 577, -- 少林
	[6] = 443, -- 扬州
	[7] = 578, -- 纯阳
	[8] = 441, -- 洛阳
	[9] = 445, -- 洛道
	[11] = 439, -- 天策
	[12] = 447, -- 枫华谷
	[13] = 448, -- 金水镇
	[15] = 442, -- 长安
	[23] = 449, -- 龙门荒漠
	[30] = 450, -- 昆仑
	[21] = 452, -- 巴陵
	[35] = 453, -- 瞿塘峡
	[22] = 451, -- 南屏山
	[10] = 446, -- 寇岛（东篱）
	[16] = 438, -- 七秀
	[49] = 1338, -- 藏剑
	--[27] = XX, -- 恶人谷
	--[25] = XX, -- 浩气盟
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com