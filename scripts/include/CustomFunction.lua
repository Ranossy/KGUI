---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/CustomFunction.lua
-- ����ʱ��:	2013/10/18 14:33:14
-- �����û�:	yule
-- �ű�˵��:	
----------------------------------------------------------------------<
function AppendCustomFunctionToGlobal()
	_G.CustomFunction = CustomFunction
end
CustomFunction = CustomFunction or {}
-- ������	: CustomFunction.Jx3Log
-- ��������	: ��DEBUG��DEBUG_LEVELֵ���ʱprint��������
-- �����б�	: DEBUG, DEBUG_LEVEL, ...
-- ����ֵ	: ��
-- ��ע		: ����ʱ������DEBUG == DEBUG_LEVEL,��ʽ�ύʱ����ȼ���
function CustomFunction.Jx3Log(DEBUG, DEBUG_LEVEL, ...)
	if DEBUG and DEBUG == DEBUG_LEVEL then
		print(...)
	end
end
-- ������	: CustomFunction.CheckMapTraffic
-- ��������	: ���NPC�Ƿ�����н�ͨ����
-- �����б�	: npc, player
-- ����ֵ	: ����ֵ
-- ��ע		:
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
-- ������	: CustomFunction.MapTrafficByID
-- ��������	: �����ڲ���ͨNPCͨ�ú�����ͨ��ID����
-- �����б�	: npc, player, tNPC, dwMapID, dwWorldNpcID, nNodeID
-- ����ֵ	: ��
-- ��ע		:local tNPC = {[2136] = 1, [2137] = 2,}
--			dwMapID������ID��, dwWorldNpcID�����罻ͨNPCID��, nNodeID����ͨID��
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
-- ������	: CustomFunction.MapTrafficByName
-- ��������	: �����ڲ���ͨNPCͨ�ú�����ͨ��NickName����
-- �����б�	: npc, player, tNPC, dwMapID, szWorldNpcName, nNodeID
-- ����ֵ	: ��
-- ��ע		:local tNPC = {["nickName1"] = 1, ["nickName2"] = 2,}
--			dwMapID������ID��, szWorldNpcName�����罻ͨNPC������, nNodeID����ͨID��
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
-- ������	: CustomFunction.FindTarget
-- ��������	: ���Ҷ���ĵ�ǰĿ�꣨npc����player��������ָ�����͡�
-- �����б�	: npc, nType
-- ����ֵ	: Ŀ�����
-- ��ע		:����ΪTARGET.NPC����Ŀ����npc����ʱ���أ�����Ϊfalse
--			����ΪTARGET.PLAYER����Ŀ����player����ʱ���أ�����Ϊfalse
--			����Ϊ����ֵʱ���ص�ǰĿ����󣬲�����npc����player��û��Ŀ���򷴻�false��
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
-- ������	: CustomFunction.GetSpace2D
-- ��������	: ������������֮���2D���롣
-- �����б�	: npc, player
-- ����ֵ	: ����(��λ��,64��Ϊ1��||��)
-- ��ע		:������npc,player,doodad����{nX = 1, nY = 1, nZ = 1}��Table
function CustomFunction.GetSpace2D(npc, player)
	local x, y = npc.nX, npc.nY
	local TargetX, TargetY, TargetZ = player.nX, player.nY, player.nZ
	local Npc_2D_X = TargetX - x
	local Npc_2D_Y = TargetY - y
	return math.sqrt(Npc_2D_X ^ 2 + Npc_2D_Y ^ 2)
end
-- ������	: CustomFunction.GetSpace3D
-- ��������	: ������������֮���3D���롣
-- �����б�	: npc, player
-- ����ֵ	: ����(��λ��,64��Ϊ1��||��)
-- ��ע		:������npc,player,doodad����{nX = 1, nY = 1, nZ = 1}��Table
function CustomFunction.GetSpace3D(npc, player)
	local x, y, z = npc.nX, npc.nY, npc.nZ
	local TargetX, TargetY, TargetZ = player.nX, player.nY, player.nZ
	local Npc_2D_X = TargetX - x
	local Npc_2D_Y = TargetY - y
	local Npc_3D_X = math.sqrt(Npc_2D_X ^ 2 + Npc_2D_Y ^ 2)
	local Npc_3D_Y = TargetZ / 8 - z / 8
	return math.sqrt(Npc_3D_X ^ 2 + Npc_3D_Y ^ 2)
end
-- ������	: CustomFunction.GetAllPlayer
-- ��������	: ��ȡ������������ҡ�
-- �����б�	: scene, bDeath
-- ����ֵ	: ��Ҷ���table��û����ҷ���false
-- ��ע		:bDeath���Ƿ������������ң�
--			ֻ������ս�����߸�������������Ұ�ⳡ����
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
-- ������	: CustomFunction.GetRandomPlayer
-- ��������	: �����ȡ�����ڵļ�����ҡ�
-- �����б�	: scene, bDeath, nCount
-- ����ֵ	: ��Ҷ���table��û����ҷ���false
-- ��ע		:bDeath���Ƿ������������ң�, nCount��������������
--			ֻ������ս�����߸�������������Ұ�ⳡ����
--			�����Ҳ����ظ���
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
-- ������	: CustomFunction.GetAngle
-- ��������	: ������������֮��ĽǶȣ���npcת������ǶȺ������player��
-- �����б�	: npc, player
-- ����ֵ	: �Ƕ�ֵ
-- ��ע		:������npc,player,doodad����{nX = 1, nY = 1, nZ = 1}��Table
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
-- ������	: CustomFunction.CreatNpcAndDooadaInAllMaps
-- ��������	: ���ݴ���ı���npc��
-- �����б�	: tScene
-- ����ֵ	: û�С�
-- ��ע		:������server����������ֻ�ܴ����������������ĵ�ͼ�������ڻ����������ʹ�á�
--			����ʹ�ñ�������һ��centerԶ�̵�����ʽRemoteCallToCenter("On_Activity_CCreatNPC",tScene)��ȷ�������ɹ���
--			tScene��д��
--			local tScene = {
--				[1] = {
--					��ʽ��npcID��x, y, z, dir, nickname, type��trueΪnpc  falseΪdoodad��,nDisAppearFrame(ȱʡ��Ϊ�����)
--					{2590, 3633, 31138, 1068736, 188, "qm_gongpin_1", false},
--					{11721, 2735, 30349, 1068800, 66, "qm_wangyifengsuicong", true},
--				}, --"�����", 
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
-- ������	: CustomFunction.DelActNpcAndDooadaInAllMaps
-- ��������	: ���ݴ���ı�ɾ��npc��ɾ����Ӧ������npc��doodad.ֻ�б���������Ϊ��Ҫ�Ĳ�����
-- �����б�	: tScene
-- ����ֵ	: û�С�
-- ��ע		:������server����������ֻ��ɾ���������������ĵ�ͼ�������ڻ����������ʹ�á�
--			tScene��д��
--			local tScene = {
--				[1] = {
--					��ʽ��npcID��x, y, z, dir, nickname, type��trueΪnpc  falseΪdoodad��,nDisAppearFrame(ȱʡ��Ϊ�����)
--					{2590, 3633, 31138, 1068736, 188, "qm_gongpin_1", false}, --��������Ĺ
--				}, --"�����", 
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
-- ������	: CustomFunction.GetPos
-- ��������	: ����ĳ���ǶȾ���ĵ�����ꡣ
-- �����б�	: nAngle, nSpace
-- ����ֵ	: �Ƕ�ֵ������ֵ
-- ��ע		:
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

-- ������	: CustomFunction.GetOffsetPos
-- ��������	: ����ĳ��������ĳ���Ƕ�ƫ��ĳ���������
-- �����б�	: ĳ����, ƫ�ƽǶ�(��Ϸ��2����256��), ƫ�ƾ���
-- ����ֵ	: X����, Y����
-- ��ע		:
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

-- ������	: CustomFunction.AddQuestValue
-- ��������	: �����������ֵ��
-- �����б�	: player, dwQuestID, nIndex, bTeam, [nSpace]
-- ����ֵ	: û�С�
-- ��ע		:player����Ҷ���, dwQuestID������ID��, nIndex������λ��, bTeam�������Ƿ�Ҳ�ӣ�, [nSpace������ͬ������,��λ��,Ĭ��Ϊ32�ߣ�]
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


-- ������	: CustomFunction.GetFrontNpcPosition
-- ��������	: ���ĳ����ǰ��nDis��������꣬
-- �����б�	: nX,nY��nDir����ǰ������ͷ���nDis1����
-- ����ֵ	: tMidFollow = {nX = xxx, nY = xxx, nDir = 222}
-- ��ע		:
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


-- ������	: CustomFunction.GetFollowsPosition
-- ��������	: ���ĳ������nDis�����3�����棨npc�������꣬
-- �����б�	: nX,nY��nDir����ǰ������ͷ���;nDis1�ࣺ���м�λ�õĸ��棨npc���뵱ǰ����ľ��룻a: ����2�����棨npc�����м���棨npc���ľ���
-- ����ֵ	: tMidFollow = {nX = xxx, nY = xxx, nZ= xxx}�� tLeftFollow = {nX = xxx, nY = xxx, nZ= xxx}��tRightFollow = {nX = xxx, nY = xxx, nZ= xxx}
-- ��ע		:
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


-- ������	: CustomFunction.GetValueByBit
-- ��������	: ������ֵ�ĳһ����λֵ
-- �����б�	:  nValue��ֵ��nBit��ȡֵ��Χ[0,31]
-- ����ֵ	: 1 or 0
-- ��ע		: CustomFunction.GetValueByBit(10, 31)����ʾ��ȡ���֡�10���ĵ�31��Bitλ��ֵ��
function CustomFunction.GetValueByBit(nValue, nBit)
	return math.floor(nValue / 2 ^ nBit) % 2
end


-- ������	: CustomFunction.IfStartAdventure
-- ��������	: �Ƿ���/����ĳ������.
-- ��ʵ�ǳ��Զ���ҷ���ָ����������˼��һ�������������cd�оͻ᳢�Զ���ҷ�����������Ҫ�����˵�on_qiyu.lua�������ñ��������ʹ�á�-xutong
-- �����б�	:  player��nAdventureID������ ui/Scheme/Case/Adventure.txt��
-- ����ֵ	: ��
-- ��ע		: 
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

-- ������	: CustomFunction.FinishAdventure
-- ��������	: ���ĳ��������
-- �����б�	:  player��nAdventureID������ ui/Scheme/Case/Adventure.txt��
-- ����ֵ	: ��
-- ��ע		: 
function CustomFunction.FinishAdventure(player, nAdventureID)
	if not player or not nAdventureID or nAdventureID <= 0 then
		return
	end
	player.SetCustomUnsigned2(387, 0)
	player.SetCustomUnsigned4(383, 0)
	RemoteCallToClient(player.dwID, "OpenAdventure", nAdventureID, true)
	-- ������� �ɾ�
	local tAchList = {
		[1] = 4605, -- ��ɽ�ĺ�
		[2] = 4606, -- �������
		[3] = 4607, -- ��������
		[4] = 4608, -- �ڰ�·
		[5] = 4608, -- �ڰ�·
		[6] = 4609, -- ������
		[7] = 4610, -- �����Ե
		[8] = 4611, -- ̸�д�ʦ
		[9] = 4611, -- ̸�д�ʦ
		[10] = 5176, -- ��������
		[19] = 5177, -- ������
		[20] = 5178, -- ÷��׮
		[21] = 5179, -- ��������
		[22] = 5187, -- �����޹�
		[31] = 5445, -- ���Ӳ���
		[32] = 5446, -- ��Хɽ��
		[33] = 5447, -- �����輧
        --��������
		[12] = 5198, -- ������
		[13] = 5199, -- ʤ����
		[14] = 5200, -- ����·
		[15] = 5194, -- ���־�
		[16] = 5195, -- ���¸�
		[17] = 5197, -- ׽����
		[18] = 5196, -- ��ͯ��
		[25] = 5329, --ɳ��ҥ
		[26] = 5330, --ʯ�ҵ�
		[27] = 5328, --�����
		[28] = 5441, --������
		[29] = 5442, --������
		[30] = 5443, --����
		[34] = 5448, --������
		[35] = 5659, --������
		[36] = 5658, --��ݸ�
		[37] = 5657, --������
		[40] = 5690, --�澭����¼
		[41] = 5691,--ƽ����Ը	
	}
	if tAchList[nAdventureID] then
		player.AddAchievementCount(tAchList[nAdventureID], 1)
	end
end


--[[
-- ������	: CustomFunction.StartAdventure
-- ��������	: ����ĳ��������
-- �����б�	:  player��nAdventureID������ ui/Scheme/Case/Adventure.txt.
-- ����ֵ	: ��
-- ��ע		: 
function CustomFunction.StartAdventure(player, nAdventureID)
	if not player or not nAdventureID or nAdventureID <= 0 then
		return
	end
	player.SetCustomUnsigned2(383, nAdventureID)
	RemoteCallToClient(player.dwID, "OpenAdventure", nAdventureID, false)
end
--]]

-- ������	: CustomFunction.CheckMapForRepresentApply
-- ��������	: �����ر��֣�����ҹĻ�Ǻӣ��ܷ��ڵ�ǰ��ͼչʾ
-- �����б�	: player
-- ����ֵ	: true or false
-- ��ע		: �������µĵ�ͼ��Ҫ���⴦��������ֱ�Ӵ����OK
function CustomFunction.CheckMapForRepresentApply(scene)
	if (scene.nType == MAP_TYPE.DUNGEON and scene.dwMapID ~= 246 and scene.dwMapID ~= 258 and scene.dwMapID ~= 261 and scene.dwMapID ~= 274) or scene.nType == MAP_TYPE.BATTLE_FIELD or scene.dwMapID == 25 or scene.dwMapID == 27 then
		return false 
	end
	return true
end

-- ������	: CustomFunction.CheckPlayerForRepresentApply
-- ��������	: �����ҵ�ǰ״̬�ܷ�ʹ����ر��֣�����ҹĻ�Ǻӣ�
-- �����б�	: player
-- ����ֵ	: true or false
-- ��ע		: 
function CustomFunction.CheckPlayerForRepresentApply(player)
	if player.dwIdentityVisiableID ~= 0 then
		player.SendSystemMessage(GetEditorString(10, 9476))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 9477), 4)
		return false
	end
	
	return true
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com