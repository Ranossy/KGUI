---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_����.lua
-- ����ʱ��:	2016/6/8 10:49:00
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/������̬/include/IdentityBaseFunc.lua")
Include("scripts/Map/��¹��ԭ/include/�ݵ�����_Data.lh")
Include("scripts/Map/������̬/��ʿ/include/��ʿ_Data.lua")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/������̬/��ʿ_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	)
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��

	skill.SetNormalCoolDown(1, 1055);	--������ͨCD���붨�ͻ���CDһ������ֹ�����л�

	skill.nPrepareFrames = 48;				-- ����֡��

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������	
	local scene = player.GetScene()
	if not scene then
		return SKILL_RESULT_CODE.FAILED
	end

	--��ֹͨ��/cast �����붨 �ظ�ʹ�ü���
	if player.GetBuff(10827,1) then
		return SKILL_RESULT_CODE.FAILED
	end
		
	--�󹥷�
	if scene.bGongFangFightFlag == true then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1910), 5)
		player.SendSystemMessage(GetEditorString(10, 1910))
		return SKILL_RESULT_CODE.FAILED
	end

	--С����׼��ʱ�䣬�˻��С����ǰһСʱ��ʼ����С��������ʱ������ֱ���ж��������
	if CastleFight.CheckPrepareTime() then		
		local tActivityMap = CastleFight.GetMapActivityState()
		if tActivityMap[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1910), 5)
			player.SendSystemMessage(GetEditorString(10, 1910))
			return SKILL_RESULT_CODE.FAILED
		end
	end
	if scene.dwMapID == 152 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1910), 5)
		player.SendSystemMessage(GetEditorString(10, 1910))
		return SKILL_RESULT_CODE.FAILED
	end
	local npc = scene.GetNpcByNickName(Identity_Wizard.BodyControlName)
	if npc then
		local nCount = npc.GetCustomUnsigned4(0)
		if nCount >= Identity_Wizard.BodyMaxCount then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 6144), 5)
			player.SendSystemMessage(GetEditorString(10, 6144))
			return SKILL_RESULT_CODE.FAILED
		end
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

local tWizardData = {
	[1] = {nVisiableID = 2, time = 15},
	[2] = {nVisiableID = 3, time = 15},
	[3] = {nVisiableID = 4, time = 20},
	[4] = {nVisiableID = 5, time = 20},
	[5] = {nVisiableID = 5, time = 30},
}
function Apply(dwCharacterID, dwSkillSrcID)
	--�������������������
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
--[[	local GV = GetGameVersion()
	if GV and GV.VersionEx == "exp" then
		local scene = player.GetScene()
		local tMap = {
			[6] = 1,
			[150] = 1,
			[102] = 1,
			}
		if scene and not tMap[scene.dwMapID ] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", "�˴��޷���Ӧ���������Ϣ��", 5)
			player.SendSystemMessage("�˴��޷���Ӧ���������Ϣ��")
			return
		end
	end--]]
	
	player.CastSkill(16713, 1)
	player.SetTimer(8, "scripts/skill/Quest/������̬/��ʿ_����.lua", 0, 3)
	-- 
end

function OnTimer(player, nParam1, nParam2)
	--[[if not player.GetBuff(10827, 1) then
		return
	end--]]
	if nParam2 == 0 then		
		player.SetTimer(0.9 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", nParam1, nParam2 + 1)
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ShowFullScreenSFX", "WIZARD_VISIABLE_OPEN")
		RemoteCallToClient(player.dwID, "SceneSfx", "Insert", {key = "WIZARD_VISIABLE_OPEN", sfxid = "WIZARD_VISIABLE_OPEN", px = -0.5, py = -0.2, pw = 2.0, ph = 1.4, loop = false})				

	elseif  nParam2 == 1 then
		--��������Ķ���
		local body = GetNpc(nParam1)
		if body then 
			--body.DoAction(0, 60060)
		end
		local scene = player.GetScene()
		if not scene then
			return
		end
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "enter camera Post render 2")
		--RemoteCallToClient(player.dwID, "EnableColorShift", true)
		local IdentifyManager = player.GetPlayerIdentityManager()
		if not IdentifyManager then
			return
		end
		if IdentifyManager.dwCurrentIdentityType ~= PLAYER_IDENTITY_TYPE.WIZARD then
			return
		end
		local Identity_MapID = IdentifyManager.GetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13)
		if scene.dwMapID ~= Identity_MapID then    --����ͬһ������
			return	
		end
		local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --�����ݾ��飬ת������ݵȼ�
		local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)               

		--player.SetIdentityVisiableID(tWizardData[nIdentifyLevel].nVisiableID)                                  --������ݵȼ����벻ͬλ��
		player.SetIdentityVisiableID(3)		
		--player.SetDynamicSkillGroup(264)	--�л���̬������
		RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3003)
		if player.bOnHorse then
			player.DownHorse()
		end
		if player.IsFollower() then
			player.FollowStop()
		end
		player.AddBuff(0, 99, 2587, 1)  --��ֹ����BUFF
		--player.SetTimer(2.1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", nParam1, nParam2 + 1)
		--elseif  nParam2 == 2 then
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction","ShowFullScreenSFX","WIZARD_VISIABLE_KEEP")
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "SetBalloonGray", true)	-- �������ݱ��
		local nIndex = 1
		local tList = {
			[6] = 1,
			[150] = 2,
			[102] = 3,
			[193] = 4,
			[158] = 5,
		}
		if tList[scene.dwMapID] then
			nIndex = tList[scene.dwMapID]
		end
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "load custom environment " .. nIndex)	-- �ı���պ�
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "Play dynamicWeather 111")	-- �ı�����
		RemoteCallToClient(player.dwID, "OpenSpringCompass")	-- �ر��ڱ�����

		-- �ر�Ӱ��Ч��
		RemoteCallToClient(player.dwID, "Save3DOption", "IdentityWizard")	-- �Ȱ�������ü�¼
		RemoteCallToClient(player.dwID, "Set3DOption", "ModelShadowType", 0)
		RemoteCallToClient(player.dwID, "Set3DOption", "bHighShadow", false)
	elseif nParam2 == 3 then
		if player.GetBuff(11177, 1) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 6076), 5)
			player.SendSystemMessage(GetEditorString(10, 6077))
			player.ClearCDTime(1055)
			return
		end
		local scene = player.GetScene()
		if not scene then
			return
		end
		local IdentifyManager = player.GetPlayerIdentityManager()
		if not IdentifyManager then
			return
		end
		if IdentifyManager.dwCurrentIdentityType ~= PLAYER_IDENTITY_TYPE.WIZARD then
			return
		end
		local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --�����ݾ��飬ת������ݵȼ�
		local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
		local tMapList = {
			[6] = 1,
			[150] = 2,
			[102] = 3,
			[193] = 4,
			[158] = 5,
		}
		if not tMapList[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 5021), 5)
			player.ClearCDTime(1055)
			return
		end
		if nIdentifyLevel < tMapList[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 5022), 5)
			player.ClearCDTime(1055)
			return
		end
		local npc = scene.GetNpcByNickName(Identity_Wizard.BodyControlName)
		if npc then
			local nCount = npc.GetCustomUnsigned4(0)
			if nCount >= Identity_Wizard.BodyMaxCount then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 6144), 5)
				player.SendSystemMessage(GetEditorString(10, 6144))
				return
			else
				npc.SetCustomUnsigned4(0, nCount + 1)
			end
		else
			npc = scene.CreateNpc(52910, 1, 1, 1, 0, - 1, Identity_Wizard.BodyControlName)
			npc.SetCustomUnsigned4(0, 1)
		end
		
		local tBodyID = {
			[ROLE_TYPE.STANDARD_FEMALE] = 51713,
			[ROLE_TYPE.LITTLE_GIRL] = 51714,
			[ROLE_TYPE.LITTLE_BOY] = 51715,
			[ROLE_TYPE.STANDARD_MALE] = 51506,
		}
		local nBodyID = 51506
		if tBodyID[player.nRoleType] then
			nBodyID = tBodyID[player.nRoleType]
		end
		local body = scene.CreateNpcWithEmployerID(nBodyID, player.nX, player.nY, player.nZ, player.nFaceDirection, (tWizardData[nIdentifyLevel].time * 60 + 2) * GLOBAL.GAME_FPS, player.dwID, false, 0)
		--scene.CreateNpc(51506, player.nX, player.nY, player.nZ, player.nFaceDirection, time * GLOBAL.GAME_FPS, "body" .. player.dwID)
		if body then
			body.SetRelationProxyID(player.dwID)                          --���ó����˵�ս����ϵ
			body.SetNpcCopyRepresentByPlayerID(body.dwID, player.dwID)   --�������ó��������
			body.CopyPlayerRelatedNpcAttrParam(player.dwID)               --���ó����˵�����	
			player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", body.dwID, 0)  --�ӳٲ�������Ĵ������������򲥲�����
			body.SetCustomInteger4(1, player.dwID) 					     --�洢���ID
			body.AddBuff(0, 99, 11176, 1)
			--if player.bCampFlag then
			if player.nCamp == CAMP.EVIL then
				body.SetForceID(49)
			elseif player.nCamp == CAMP.GOOD then
				body.SetForceID(50)
			end
			--end
			--body.AddBuff(player.dwID, player.nLevel, 10857, 1)                                 --�ͻ���ͬ�����BUFF�����������á�
			player.AddBuff(player.dwID, player.nLevel, 10826, 1)       						 --��ֹ����
			player.AddBuff(player.dwID, player.nLevel, 10827, 1, tWizardData[nIdentifyLevel].time)  	     --���״̬���
			player.AddBuff(player.dwID, player.nLevel, 11494, 1, tWizardData[nIdentifyLevel].time)  	     --���״̬͸����buff
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "PlayBgMusic", GetEditorString(10, 2197), 0, 1)  --�����������֣����Ҳ��ᱻ�滻
			--RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
			--------------�����¼����ݱ�����---------
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1, player.nX)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5, player.nY)
			IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9, player.nZ)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13, scene.dwMapID)
			IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 15, player.nFaceDirection) 
	
			--��ѧ����
			local tQuestId = {15459, 15460, 15461}
			for _, nQuestId in pairs(tQuestId) do
				local nQuestIndex = player.GetQuestIndex(nQuestId)
				local nQuestPhase = player.GetQuestPhase(nQuestId)
				if nQuestIndex and nQuestPhase == 1 then
					player.SetQuestValue(nQuestIndex, 0, 1)
				end
			end
			local nQuestId_15459 = 15459
			local nQuestIndex_15459 = player.GetQuestIndex(nQuestId_15459)
			local nQuestPhase_15459 = player.GetQuestPhase(nQuestId_15459)
			if nQuestIndex_15459 and nQuestPhase_15459 == 1 then
				player.SetQuestValue(nQuestIndex_15459, 1, 1)
			end
			local nQuestId_15461 = 15461
			local nQuestIndex_15461 = player.GetQuestIndex(nQuestId_15461)
			local nQuestPhase_15461 = player.GetQuestPhase(nQuestId_15461)
			if nQuestIndex_15461 and nQuestPhase_15461 == 1 then
				if player.dwLastScriptID == GetFileNameHash("scripts/Map/������̬/��ʿ/trap/����ȴ��������.lua") then
					player.SetQuestValue(nQuestIndex_15461, 1, 1)
				end
			end
		end
		--�г�����ɾ��
		local dwPetId = player.dwPetID
		local npc_pet = GetNpc(player.dwFellowPetID)
		if npc_pet then	
			npc_pet.SetDisappearFrames(1)
			RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseNewPetSkillPanel")
		end
		--�ٻ�����״̬�µ�NPC���裬�С�Ϸ�α�����������ٻ�NPC
		if player.IsFellowPetAcquired(208) then
			local npcLight = scene.GetNpcByNickName("IdentityWizardLight" .. player.dwID)
			if not npcLight then
				local tLight = {
					[1] = 51726,
					[2] = 51926,
					[3] = 51927,
					[4] = 51928,
					[5] = 51928,
				}
				npcLight = scene.CreateNpc(tLight[nIdentifyLevel], player.nX, player.nY, player.nZ, player.nFaceDirection, -1, "IdentityWizardLight" .. player.dwID)
				npcLight.SetCustomUnsigned4(0, player.dwID)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com