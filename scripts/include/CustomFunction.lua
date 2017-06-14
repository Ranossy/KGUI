---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/CustomFunction.lua
-- 更新时间:	2013/10/18 14:33:14
-- 更新用户:	yule
-- 脚本说明:	
----------------------------------------------------------------------<
function AppendCustomFunctionToGlobal()
	_G.CustomFunction = CustomFunction
end
CustomFunction = CustomFunction or {}
-- 函数名	: CustomFunction.Jx3Log
-- 函数描述	: 当DEBUG和DEBUG_LEVEL值相等时print出…内容
-- 参数列表	: DEBUG, DEBUG_LEVEL, ...
-- 返回值	: 无
-- 备注		: 调试时将常量DEBUG == DEBUG_LEVEL,正式提交时不相等即可
function CustomFunction.Jx3Log(DEBUG, DEBUG_LEVEL, ...)
	if DEBUG and DEBUG == DEBUG_LEVEL then
		print(...)
	end
end
-- 函数名	: CustomFunction.CheckMapTraffic
-- 函数描述	: 检查NPC是否可以有交通功能
-- 参数列表	: npc, player
-- 返回值	: 布尔值
-- 备注		:
function CustomFunction.CheckMapTraffic(npc, player)
	if player.GetBuff(7049, 1) then
		player.SendSystemMessage(GetEditorString(6, 872))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 872), 4)
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID) .. 
			GetEditorString(6, 873) 
		)
		return false
	end
	if player.GetBuff(7732, 1) then
		player.SendSystemMessage(GetEditorString(6, 4449))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 4449), 4)
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID) .. 
			GetEditorString(6, 4450) 
		)
		return false
	end
	
	if player.dwShapeShiftID ~= 0 then
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID) .. 
			GetEditorString(6, 4682) 
		)
		return false
	end
	
	if player.GetBuff(7525, 0) or player.GetBuff(7561, 0) then
		player.SendSystemMessage(GetEditorString(6, 4727))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 4727), 4)
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID) .. 
			GetEditorString(6, 4728) 
		)
		return false
	end
	
	local scene = player.GetScene()
	if not scene then 
		return false
	end
	
	return true
end
-- 函数名	: CustomFunction.MapTrafficByID
-- 函数描述	: 场景内部交通NPC通用函数，通过ID区分
-- 参数列表	: npc, player, tNPC, dwMapID, dwWorldNpcID, nNodeID
-- 返回值	: 无
-- 备注		:local tNPC = {[2136] = 1, [2137] = 2,}
--			dwMapID（场景ID）, dwWorldNpcID（世界交通NPCID）, nNodeID（交通ID）
function CustomFunction.MapTrafficByID(npc, player, tNPC, dwMapID, dwWorldNpcID, nNodeID)
	if not CustomFunction.CheckMapTraffic(npc, player) then
		return
	end
	
	local scene = player.GetScene()
	if not scene then 
		return
	end
	
	if scene.dwMapID ~= dwMapID then 
		return 
	end 
	
	if not tNPC[npc.dwTemplateID] then
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID)
		)
		if npc.dwTemplateID == dwWorldNpcID then
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. 
				"<U " .. nNodeID .. " " .. GetEditorString(6, 553) .. ">"
			)
		end
	else
		if npc.dwTemplateID == dwWorldNpcID then
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. 
				"<MT " .. tNPC[npc.dwTemplateID]  .. GetEditorString(6, 493) .. "\n\n" ..
				"<U " .. nNodeID .. " " .. GetEditorString(6, 553) .. ">"
			)
		else
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. 
				"<MT " .. tNPC[npc.dwTemplateID]  .. GetEditorString(6, 493) 
			)
		end
	end
end
-- 函数名	: CustomFunction.MapTrafficByName
-- 函数描述	: 场景内部交通NPC通用函数，通过NickName区分
-- 参数列表	: npc, player, tNPC, dwMapID, szWorldNpcName, nNodeID
-- 返回值	: 无
-- 备注		:local tNPC = {["nickName1"] = 1, ["nickName2"] = 2,}
--			dwMapID（场景ID）, szWorldNpcName（世界交通NPC别名）, nNodeID（交通ID）
function CustomFunction.MapTrafficByName(npc, player, tNPC, dwMapID, szWorldNpcName, nNodeID)
	if not CustomFunction.CheckMapTraffic(npc, player) then
		return
	end
	
	local scene = player.GetScene()
	if not scene then 
		return
	end
	
	if scene.dwMapID ~= dwMapID then 
		return 
	end 
	
	if not tNPC[npc.szName] then
		player.OpenWindow(TARGET.NPC, npc.dwID,
			npc.GetAutoDialogString(player.dwID)
		)
		if npc.szName == szWorldNpcName then
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. 
				"<U " .. nNodeID .. " " .. GetEditorString(6, 553) .. ">"
			)
		end
	else
		if npc.szName == szWorldNpcName then
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. 
				"<MT " .. tNPC[npc.szName]  .. GetEditorString(6, 493) .. "\n\n" ..
				"<U " .. nNodeID .. " " .. GetEditorString(6, 553) .. ">"
			)
		else
			player.OpenWindow(TARGET.NPC, npc.dwID,
				npc.GetAutoDialogString(player.dwID) .. 
				"<MT " .. tNPC[npc.szName]  .. GetEditorString(6, 493) 
			)
		end
	end
end
-- 函数名	: CustomFunction.FindTarget
-- 函数描述	: 查找对象的当前目标（npc或者player），可以指定类型。
-- 参数列表	: npc, nType
-- 返回值	: 目标对象
-- 备注		:类型为TARGET.NPC并且目标是npc对象时返回，否则为false
--			类型为TARGET.PLAYER并且目标是player对象时返回，否则为false
--			类型为其他值时返回当前目标对象，不论是npc还是player，没有目标则反回false。
function CustomFunction.FindTarget(cObject, nType)
	local cNpc = false
	local cPlayer = false
	local pTargetType, pTargetID = cObject.GetTarget()
	if pTargetType == TARGET.PLAYER then
		cPlayer = GetPlayer(pTargetID)
	elseif pTargetType == TARGET.NPC then
		cNpc = GetNpc(pTargetID)
	end
	if nType == TARGET.PLAYER then
		return cPlayer
	elseif nType == TARGET.NPC then
		return cNpc
	else
		return false
	end
end
-- 函数名	: CustomFunction.GetSpace2D
-- 函数描述	: 计算两个对象之间的2D距离。
-- 参数列表	: npc, player
-- 返回值	: 距离(单位点,64点为1尺||米)
-- 备注		:可以是npc,player,doodad或者{nX = 1, nY = 1, nZ = 1}的Table
function CustomFunction.GetSpace2D(npc, player)
	local x, y = npc.nX, npc.nY
	local TargetX, TargetY, TargetZ = player.nX, player.nY, player.nZ
	local Npc_2D_X = TargetX - x
	local Npc_2D_Y = TargetY - y
	return math.sqrt(Npc_2D_X ^ 2 + Npc_2D_Y ^ 2)
end
-- 函数名	: CustomFunction.GetSpace3D
-- 函数描述	: 计算两个对象之间的3D距离。
-- 参数列表	: npc, player
-- 返回值	: 距离(单位点,64点为1尺||米)
-- 备注		:可以是npc,player,doodad或者{nX = 1, nY = 1, nZ = 1}的Table
function CustomFunction.GetSpace3D(npc, player)
	local x, y, z = npc.nX, npc.nY, npc.nZ
	local TargetX, TargetY, TargetZ = player.nX, player.nY, player.nZ
	local Npc_2D_X = TargetX - x
	local Npc_2D_Y = TargetY - y
	local Npc_3D_X = math.sqrt(Npc_2D_X ^ 2 + Npc_2D_Y ^ 2)
	local Npc_3D_Y = TargetZ / 8 - z / 8
	return math.sqrt(Npc_3D_X ^ 2 + Npc_3D_Y ^ 2)
end
-- 函数名	: CustomFunction.GetAllPlayer
-- 函数描述	: 获取场景内所有玩家。
-- 参数列表	: scene, bDeath
-- 返回值	: 玩家对象table表，没有玩家返回false
-- 备注		:bDeath（是否包括死亡的玩家）
--			只能用于战场或者副本，不适用于野外场景。
function CustomFunction.GetAllPlayer(scene, bDeath)
	if scene.nType ~= MAP_TYPE.DUNGEON and scene.nType ~= MAP_TYPE.BATTLE_FIELD then
		return false
	end
	local tTatget = {}
	local tPlayer = scene.GetAllPlayer()
	if tPlayer then
		for i = 1, #tPlayer do
			local cPlayer = GetPlayer(tPlayer[i])
			if cPlayer and (bDeath or cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH) then
				tTatget[#tTatget + 1] = cPlayer
			end
		end
		if #tTatget == 0 then
			return false
		else
			return tTatget
		end
	end
end
-- 函数名	: CustomFunction.GetRandomPlayer
-- 函数描述	: 随机获取场景内的几个玩家。
-- 参数列表	: scene, bDeath, nCount
-- 返回值	: 玩家对象table表，没有玩家返回false
-- 备注		:bDeath（是否包括死亡的玩家）, nCount（随机玩家数量）
--			只能用于战场或者副本，不适用于野外场景。
--			随机玩家不会重复。
function CustomFunction.GetRandomPlayer(scene, bDeath, nCount)
	local tTarget = {}
	local tPlayer = CustomFunction.GetAllPlayer(scene, bDeath)
	if not tPlayer then
		return false
	end
	for i = 1, nCount do
		local cTarget = table.remove(tPlayer, Random(1, #tPlayer))
		tTarget[#tTarget + 1] = cTarget
	end
	if #tTarget > 0 then
		return tTarget
	else
		return false
	end
end
-- 函数名	: CustomFunction.GetAngle
-- 函数描述	: 计算两个对象之间的角度，当npc转向这个角度后，面对这player。
-- 参数列表	: npc, player
-- 返回值	: 角度值
-- 备注		:可以是npc,player,doodad或者{nX = 1, nY = 1, nZ = 1}的Table
function CustomFunction.GetAngle(npc, Target)
	local xxNpc_2D_X = npc.nX - Target.nX
	local xxNpc_2D_Y = npc.nY - Target.nY
	local xxNpc_3D_X = math.sqrt(xxNpc_2D_X ^ 2 + xxNpc_2D_Y ^ 2)
	local xxNpc_Angle = math.deg(math.asin(math.abs(xxNpc_2D_X) / math.abs(xxNpc_3D_X)))
	if xxNpc_2D_X < 0 and xxNpc_2D_Y < 0 then
		xxNpc_Angle = 90 - xxNpc_Angle
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y <= 0 then
		xxNpc_Angle = xxNpc_Angle + 90
	elseif xxNpc_2D_X >= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = 90 - xxNpc_Angle + 180
	elseif xxNpc_2D_X <= 0 and xxNpc_2D_Y >= 0 then
		xxNpc_Angle = xxNpc_Angle + 270
	end
	return math.floor(xxNpc_Angle / 360 * 255)
end
-- 函数名	: CustomFunction.CreatNpcAndDooadaInAllMaps
-- 函数描述	: 根据传入的表创建npc。
-- 参数列表	: tScene
-- 返回值	: 没有。
-- 备注		:由于是server函数，所以只能创建本服务器开启的地图。建议在活动开启函数中使用。
--			或者使用本函数的一个center远程调用形式RemoteCallToCenter("On_Activity_CCreatNPC",tScene)来确保创建成功。
--			tScene的写法
--			local tScene = {
--				[1] = {
--					格式：npcID，x, y, z, dir, nickname, type（true为npc  false为doodad）,nDisAppearFrame(缺省则为永久物。)
--					{2590, 3633, 31138, 1068736, 188, "qm_gongpin_1", false},
--					{11721, 2735, 30349, 1068800, 66, "qm_wangyifengsuicong", true},
--				}, --"稻香村", 
--			}
function CustomFunction.CreatNpcAndDooadaInAllMaps(tScene)
	if not tScene then
		return
	end
	local scene = nil
	for dwMapID in pairs(tScene) do  
		local tCopyIndexList = GetAllCopyIndexByMapID(dwMapID)
		if  tCopyIndexList then
			for _, nCopyIndex in ipairs(tCopyIndexList) do
				scene = GetSceneByMapIDAndIndex(dwMapID, nCopyIndex)
				if scene then
					if tScene[dwMapID] then
						for i = 1, #tScene[dwMapID] do
							if tScene[dwMapID][i][7] then		--npc
								if not scene.GetNpcByNickName(tScene[dwMapID][i][6]) then
									local npc = scene.CreateNpc(tScene[dwMapID][i][1], tScene[dwMapID][i][2], tScene[dwMapID][i][3], tScene[dwMapID][i][4], tScene[dwMapID][i][5], -1, tScene[dwMapID][i][6])
									if npc and tScene[dwMapID][i][8] then
										npc.SetDisappearFrames(tScene[dwMapID][i][8])
									end
								end
							else								--doodad
								if not scene.GetDoodadByNickName(tScene[dwMapID][i][6]) then
									local doodad = scene.CreateDoodad(tScene[dwMapID][i][1], tScene[dwMapID][i][2], tScene[dwMapID][i][3], tScene[dwMapID][i][4], tScene[dwMapID][i][5], tScene[dwMapID][i][6])
									if doodad and tScene[dwMapID][i][8] then
										doodad.SetDisappearFrames(tScene[dwMapID][i][8])
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
-- 函数名	: CustomFunction.DelActNpcAndDooadaInAllMaps
-- 函数描述	: 根据传入的表删除npc。删除对应别名的npc或doodad.只有别名和类型为必要的参数。
-- 参数列表	: tScene
-- 返回值	: 没有。
-- 备注		:由于是server函数，所以只能删除本服务器开启的地图。建议在活动结束函数中使用。
--			tScene的写法
--			local tScene = {
--				[1] = {
--					格式：npcID，x, y, z, dir, nickname, type（true为npc  false为doodad）,nDisAppearFrame(缺省则为永久物。)
--					{2590, 3633, 31138, 1068736, 188, "qm_gongpin_1", false}, --稻香村大侠墓
--				}, --"稻香村", 
--			}
function CustomFunction.DelActNpcAndDooadaInAllMaps(tScene)
	if not tScene then
		return
	end
	local scene = nil
	for dwMapID in pairs(tScene) do  
		local tCopyIndexList = GetAllCopyIndexByMapID(dwMapID)
		if  tCopyIndexList then
			for _, nCopyIndex in ipairs(tCopyIndexList) do
				scene = GetSceneByMapIDAndIndex(dwMapID, nCopyIndex)
				if  scene then
					if tScene[dwMapID] then
						local npc = nil
						local doodad = nil
						for i = 1, #tScene[dwMapID] do
							if tScene[dwMapID][i][7] then		--npc
								npc = scene.GetNpcByNickName(tScene[dwMapID][i][6])
								if npc then
									npc.SetDisappearFrames(1)
									scene.DestroyNpc(npc.dwID)
								end
							else								--doodad
								doodad = scene.GetDoodadByNickName(tScene[dwMapID][i][6])
								if doodad then
									doodad.SetDisappearFrames(1)
									scene.DestroyDoodad(doodad.dwID)
								end
							end
						end
					end
				end
			end
		end
	end
end
-- 函数名	: CustomFunction.GetPos
-- 函数描述	: 计算某个角度距离的点的坐标。
-- 参数列表	: nAngle, nSpace
-- 返回值	: 角度值，距离值
-- 备注		:
function CustomFunction.GetPos(nAngle, nSpace)
	nAngle = nAngle - 270
	if nAngle < 0 then
		nAngle = 360 + nAngle
	end
	nAngle = 360 - nAngle
	local nx, ny = 0, 0
	if nAngle == 0 then
		nx = 0
		ny = -nSpace
	elseif nAngle > 0 and nAngle < 90 then
		nx = -math.sin(math.rad(nAngle)) * nSpace
		ny = -math.cos(math.rad(nAngle)) * nSpace
	elseif nAngle == 90 then
		nx = -nSpace
		ny = 0
	elseif nAngle > 90 and nAngle < 180 then
		nx = -math.cos(math.rad(nAngle - 90)) * nSpace
		ny = math.sin(math.rad(nAngle - 90)) * nSpace
	elseif nAngle == 180 then
		nx = 0
		ny = nSpace
	elseif nAngle > 180 and nAngle < 270 then
		nx = math.sin(math.rad(nAngle - 180)) * nSpace
		ny = math.cos(math.rad(nAngle - 180)) * nSpace
	elseif nAngle == 270 then
		nx = nSpace
		ny = 0
	elseif nAngle > 270 and nAngle < 360 then
		nx = math.cos(math.rad(nAngle - 270)) * nSpace
		ny = -math.sin(math.rad(nAngle - 270)) * nSpace
	elseif nAngle == 360 then
		nx = 0
		ny = -nSpace
	else
		nx = 0
		ny = 0
	end
	return nx, ny
end

-- 函数名	: CustomFunction.GetOffsetPos
-- 函数描述	: 计算某个对象，向某个角度偏移某距离的坐标
-- 参数列表	: 某对象, 偏移角度(游戏内2π是256度), 偏移距离
-- 返回值	: X坐标, Y坐标
-- 备注		:
function CustomFunction.GetOffsetPos(KTarget, nAngle, nDistance)
	local nDir = KTarget.nFaceDirection + nAngle
	if nDir > 256 then
		nDir = nDir % 256
	end
	nDir = 360 * nDir / 256
	local nX = math.cos(math.rad(nDir)) * nDistance
	local nY = math.sin(math.rad(nDir)) * nDistance
	return KTarget.nX + nX, KTarget.nY + nY
end

-- 函数名	: CustomFunction.AddQuestValue
-- 函数描述	: 增加任务变量值。
-- 参数列表	: player, dwQuestID, nIndex, bTeam, [nSpace]
-- 返回值	: 没有。
-- 备注		:player（玩家对象）, dwQuestID（任务ID）, nIndex（变量位）, bTeam（队友是否也加）, [nSpace（队友同步距离,单位尺,默认为32尺）]
function CustomFunction.AddQuestValue(player, dwQuestID, nIndex, bTeam, nSpace)
	local nQuestIndexPlayer = player.GetQuestIndex(dwQuestID)
	if not nQuestIndexPlayer then
		return
	end
	local nQuestPhase = player.GetQuestPhase(dwQuestID)
	if nQuestPhase == 1 or nQuestPhase == 2 then
		if not bTeam then
			if nQuestPhase == 1 then
				local nQuestIndex = player.GetQuestIndex(dwQuestID)
				if nQuestIndex then
					local nValue = player.GetQuestValue(nQuestIndex, nIndex)
					player.SetQuestValue(nQuestIndex, nIndex, nValue + 1)
				end
			end
		else
			local tPartyMember = player.GetPartyMemberList()
			if tPartyMember then
				local scene = player.GetScene()
				if not scene then
					return
				end
				local nPartyMemberCount = #tPartyMember
				local dwMapID = scene.dwMapID
				local nShareDistance = 2048
				if nSpace then
					nShareDistance = nSpace * 64
				end
				for i = 1, nPartyMemberCount do
					local member = GetPlayer(tPartyMember[i])
					if member then
						local memberScene = member.GetScene()
						local dwMemberMapID = memberScene.dwMapID
						nQuestPhase = member.GetQuestPhase(dwQuestID)
						if nQuestPhase == 1 then
							if dwMapID == dwMemberMapID then
								local nDistance = GetCharacterDistance(player.dwID, member.dwID)
								if nDistance <= nShareDistance then
									local nQuestIndex = member.GetQuestIndex(dwQuestID)
									if nQuestIndex then
										local nValue = member.GetQuestValue(nQuestIndex, nIndex)
										member.SetQuestValue(nQuestIndex, nIndex, nValue + 1)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end


-- 函数名	: CustomFunction.GetFrontNpcPosition
-- 函数描述	: 获得某坐标前方nDis距离的坐标，
-- 参数列表	: nX,nY，nDir：当前的坐标和方向；nDis1距离
-- 返回值	: tMidFollow = {nX = xxx, nY = xxx, nDir = 222}
-- 备注		:
function CustomFunction.GetFrontNpcPosition(nX,nY,nDir,nDis1)
	if not nX or not nY or not nDir or nX < 0 or nY < 0 or nDir < 0 then 
		return 0;
	end
	nDis1 = nDis1 or 200;
	local nMaxDir = 256;
	local nC = 3.14159 * nDir * 2/nMaxDir; 
	local tMidFollow = {};
	local nDoorNpcDir = nDir + nMaxDir/2;
	tMidFollow.nDir = nDoorNpcDir < nMaxDir  and nDoorNpcDir or (nDoorNpcDir - nMaxDir)
	if nDir <= nMaxDir/4 then 
		tMidFollow.nX = nX + nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY + nDis1 * math.abs(math.sin(nC));
	elseif nDir <= nMaxDir/2 then
		tMidFollow.nX = nX - nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY + nDis1 * math.abs(math.sin(nC));
	elseif nDir <= nMaxDir*3/4 then 
		tMidFollow.nX = nX - nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY -nDis1 * math.abs(math.sin(nC));
	else
		tMidFollow.nX = nX + nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY - nDis1 * math.abs(math.sin(nC));
	end
	return tMidFollow;
end


-- 函数名	: CustomFunction.GetFollowsPosition
-- 函数描述	: 获得某坐标点后方nDis距离的3个跟随（npc）的坐标，
-- 参数列表	: nX,nY，nDir：当前的坐标和方向;nDis1距：后方中间位置的跟随（npc）与当前坐标的距离；a: 两边2个跟随（npc）与中间跟随（npc）的距离
-- 返回值	: tMidFollow = {nX = xxx, nY = xxx, nZ= xxx}， tLeftFollow = {nX = xxx, nY = xxx, nZ= xxx}，tRightFollow = {nX = xxx, nY = xxx, nZ= xxx}
-- 备注		:
function CustomFunction.GetFollowsPosition(nX,nY,nDir,nDis1,a)
	if not nX or not nY or not nDir or nX < 0 or nY < 0 or nDir < 0 then 
		return 0;
	end
	nDis1 = nDis1 or 500;
	a = a or 500;
	local nMaxDir = 256;
	local nC = 3.14159 * nDir * 2/nMaxDir; 
	local tMidFollow, tLeftFollow, tRightFollow = {}, {}, {};
	if nDir <= nMaxDir/4 then 
		tMidFollow.nX = nX - nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY - nDis1 * math.abs(math.sin(nC));
		tRightFollow.nX = tMidFollow.nX + a * math.abs(math.sin(nC));
		tRightFollow.nY = tMidFollow.nY - a * math.abs(math.cos(nC));
		tLeftFollow.nX = tMidFollow.nX - a * math.abs(math.sin(nC));
		tLeftFollow.nY = tMidFollow.nY + a * math.abs(math.cos(nC));
	elseif nDir <= nMaxDir/2 then
		tMidFollow.nX = nX + nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY - nDis1 * math.abs(math.sin(nC));
		tRightFollow.nX = tMidFollow.nX + a * math.abs(math.sin(nC));
		tRightFollow.nY = tMidFollow.nY + a * math.abs(math.cos(nC));
		tLeftFollow.nX = tMidFollow.nX - a * math.abs(math.sin(nC));
		tLeftFollow.nY = tMidFollow.nY - a * math.abs(math.cos(nC));
	elseif nDir <= nMaxDir*3/4 then 
		tMidFollow.nX = nX + nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY + nDis1 * math.abs(math.sin(nC));
		tRightFollow.nX = tMidFollow.nX - a * math.abs(math.sin(nC));
		tRightFollow.nY = tMidFollow.nY + a * math.abs(math.cos(nC));
		tLeftFollow.nX = tMidFollow.nX + a * math.abs(math.sin(nC));
		tLeftFollow.nY = tMidFollow.nY - a * math.abs(math.cos(nC));
	else
		tMidFollow.nX = nX - nDis1 * math.abs(math.cos(nC));
		tMidFollow.nY = nY + nDis1 * math.abs(math.sin(nC));
		tRightFollow.nX = tMidFollow.nX + a * math.abs(math.sin(nC));
		tRightFollow.nY = tMidFollow.nY + a * math.abs(math.cos(nC));
		tLeftFollow.nX = tMidFollow.nX - a * math.abs(math.sin(nC));
		tLeftFollow.nY = tMidFollow.nY - a * math.abs(math.cos(nC));
	end

	return tMidFollow, tLeftFollow, tRightFollow;
end


-- 函数名	: CustomFunction.GetValueByBit
-- 函数描述	: 获得数字的某一比特位值
-- 参数列表	:  nValue：值；nBit：取值范围[0,31]
-- 返回值	: 1 or 0
-- 备注		: CustomFunction.GetValueByBit(10, 31)，表示获取数字“10”的第31个Bit位的值。
function CustomFunction.GetValueByBit(nValue, nBit)
	return math.floor(nValue / 2 ^ nBit) % 2
end


-- 函数名	: CustomFunction.IfStartAdventure
-- 函数描述	: 是否开启/触发某个奇遇.
-- 其实是尝试对玩家发起指定奇遇的意思，一旦检查奇遇不在cd中就会尝试对玩家发起奇遇，需要在两端的on_qiyu.lua里面配置表才能正常使用。-xutong
-- 参数列表	:  player，nAdventureID：见表 ui/Scheme/Case/Adventure.txt。
-- 返回值	: 无
-- 备注		: 
function CustomFunction.IfStartAdventure(player, nAdventureID)
	if not player or not nAdventureID or nAdventureID <= 0 then
		return
	end
	if player.GetBuff(9186, 1) then
		return
	end
	player.AddBuff(0, 99, 9186, 1)
	if player.GetCustomUnsigned2(387) == 0 then
		RemoteCallToCenter("On_QiYu_CheckCD", player.dwID, nAdventureID)
	end
end

-- 函数名	: CustomFunction.FinishAdventure
-- 函数描述	: 完成某个奇遇线
-- 参数列表	:  player，nAdventureID：见表 ui/Scheme/Case/Adventure.txt。
-- 返回值	: 无
-- 备注		: 
function CustomFunction.FinishAdventure(player, nAdventureID)
	if not player or not nAdventureID or nAdventureID <= 0 then
		return
	end
	player.SetCustomUnsigned2(387, 0)
	player.SetCustomUnsigned4(383, 0)
	RemoteCallToClient(player.dwID, "OpenAdventure", nAdventureID, true)
	-- 完成奇遇 成就
	local tAchList = {
		[1] = 4605, -- 三山四海
		[2] = 4606, -- 三尺青峰
		[3] = 4607, -- 阴阳两界
		[4] = 4608, -- 黑白路
		[5] = 4608, -- 黑白路
		[6] = 4609, -- 少年行
		[7] = 4610, -- 茶馆奇缘
		[8] = 4611, -- 谈判大师
		[9] = 4611, -- 谈判大师
		[10] = 5176, -- 炼狱厨神
		[19] = 5177, -- 大唐神捕
		[20] = 5178, -- 梅花桩
		[21] = 5179, -- 塞外名驹
		[22] = 5187, -- 天涯无归
		[31] = 5445, -- 护佑苍生
		[32] = 5446, -- 虎啸山林
		[33] = 5447, -- 乱世舞姬
        --宠物奇遇
		[12] = 5198, -- 清茗经
		[13] = 5199, -- 胜负局
		[14] = 5200, -- 归乡路
		[15] = 5194, -- 枫林酒
		[16] = 5195, -- 红衣歌
		[17] = 5197, -- 捉妖记
		[18] = 5196, -- 孩童书
		[25] = 5329, --沙海谣
		[26] = 5330, --石敢当
		[27] = 5328, --荆轲刺
		[28] = 5441, --破晓鸣
		[29] = 5442, --竹马情
		[30] = 5443, --至尊宝
		[34] = 5448, --兽王佩
		[35] = 5659, --稚子心
		[36] = 5658, --青草歌
		[37] = 5657, --滇南行
		[40] = 5690, --奇经恩仇录
		[41] = 5691,--平生心愿	
	}
	if tAchList[nAdventureID] then
		player.AddAchievementCount(tAchList[nAdventureID], 1)
	end
end


--[[
-- 函数名	: CustomFunction.StartAdventure
-- 函数描述	: 开启某个奇遇线
-- 参数列表	:  player；nAdventureID：见表 ui/Scheme/Case/Adventure.txt.
-- 返回值	: 无
-- 备注		: 
function CustomFunction.StartAdventure(player, nAdventureID)
	if not player or not nAdventureID or nAdventureID <= 0 then
		return
	end
	player.SetCustomUnsigned2(383, nAdventureID)
	RemoteCallToClient(player.dwID, "OpenAdventure", nAdventureID, false)
end
--]]

-- 函数名	: CustomFunction.CheckMapForRepresentApply
-- 函数描述	: 检查相关表现（比如夜幕星河）能否在当前地图展示
-- 参数列表	: player
-- 返回值	: true or false
-- 备注		: 后续有新的地图需要特殊处理在这里直接处理就OK
function CustomFunction.CheckMapForRepresentApply(scene)
	if (scene.nType == MAP_TYPE.DUNGEON and scene.dwMapID ~= 246 and scene.dwMapID ~= 258 and scene.dwMapID ~= 261 and scene.dwMapID ~= 274) or scene.nType == MAP_TYPE.BATTLE_FIELD or scene.dwMapID == 25 or scene.dwMapID == 27 then
		return false 
	end
	return true
end

-- 函数名	: CustomFunction.CheckPlayerForRepresentApply
-- 函数描述	: 检查玩家当前状态能否使用相关表现（比如夜幕星河）
-- 参数列表	: player
-- 返回值	: true or false
-- 备注		: 
function CustomFunction.CheckPlayerForRepresentApply(player)
	if player.dwIdentityVisiableID ~= 0 then
		player.SendSystemMessage(GetEditorString(10, 9476))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 9477), 4)
		return false
	end
	
	return true
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com