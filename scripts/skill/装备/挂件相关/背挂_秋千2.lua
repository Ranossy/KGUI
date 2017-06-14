---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_��ǧ2.lua
-- ����ʱ��:	2017/2/9 20:19:06
-- �����û�:	FENGMENGJIE-PC
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
print(123)
tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/����_��ǧ2.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1177);
	print(234)
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 20294 then
		return false
	end
	print(345)
	return nPreResult;	
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()

	if not player.nMoveState == MOVE_STATE.ON_STAND then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(8, 444), 4)
		player.SendSystemMessage(GetEditorString(8, 445))
		return
	end

	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end

	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 20294 then
		return
	end

	--����ɾ��
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local buff1 = player.GetBuff(10014, 1)
	if buff1 then
		player.SendSystemMessage(GetEditorString(10, 5165))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 5166), 4)
		return
	end

	local npc = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
	if npc then
		player.SendSystemMessage(GetEditorString(10, 1210))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1272), 4)
		return
	else
		player.ClearCDTime(1177)
		player.DoCustomOTAction(0, 1, GLOBAL.GAME_FPS * 1, TARGET.PLAYER, player.dwID, "scripts/skill/װ��/�Ҽ����/����_��ǧ2.lua", GetEditorString(10, 1312))

		local scene = player.GetScene()
		scene.CreateNpc(41160, player.nX + 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_JC_1" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_2" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_JC_3" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_4" .. player.dwID)

		--	player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/װ��/�Ҽ����/����_��ǧ.lua", 0, 0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnCustomEvent(player, target)

	local scene = player.GetScene()
	if not scene then
		return
	end

	local szName1 = "FXF_JC_1" .. player.dwID
	local szName2 = "FXF_JC_2" .. player.dwID
	local szName3 = "FXF_JC_3" .. player.dwID
	local szName4 = "FXF_JC_4" .. player.dwID
	local npc1 = scene.GetNpcByNickName(szName1)
	local npc2 = scene.GetNpcByNickName(szName2)
	local npc3 = scene.GetNpcByNickName(szName3)
	local npc4 = scene.GetNpcByNickName(szName4)
	if npc1 and npc2 and npc3 and npc4 then
		local tZ_yutou = {
			npc1.nZ,
			npc2.nZ,
			npc3.nZ,
			npc4.nZ,
			player.nZ,
		}
		table.sort(tZ_yutou)
		local nNum = math.abs(tZ_yutou[5] - tZ_yutou[1])
		if nNum >= 150 then
			--��᫣�������
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1273), 4)
			return
		else

			--	player.AddBuff(0, 99, 10822, 1)
			player.PlaySfx(1087, 0, 0, 0)

			if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 379 then
				player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
			end

			--����NPC--��ǧ
			local npc_Q = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
			if not npc_Q then
				scene.CreateNpc(55599, player.nX, player.nY, player.nZ, player.nFaceDirection, 16 * 3, "QIUQ_fxf0124" .. player.dwID)
			end

			--����NPC--����
			local npc_T = scene.GetNpcByNickName("QIUT_fxf0124" .. player.dwID)
			if not npc_T then
				scene.CreateNpc(55598, player.nX, player.nY, player.nZ, player.nFaceDirection, 16 * 3, "QIUT_fxf0124" .. player.dwID)
			end

			player.AddBuff(0, 99, 11687, 1)
			player.AddBuff(0, 99, 11686, 1)
			local buff_fj = player.GetBuff(11688, 1)--����
			if buff_fj then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1304), 4)
				return
			end

			local tCheckBuffList = {7049, 7525, 7561, 9982} --С����buff
			for _, v in pairs(tCheckBuffList) do
				if player.GetBuff(v, 0) then
					RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", GetEditorString(9, 111), "yellow")
					return
				end
			end

			if player.dwModelID ~= 0 then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 455), 4)
				return
			end

			if player.bOnHorse then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 453), 4)
				return
			end

			if player.bFightState then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 454), 4)
				return
			end

			if player.nMoveState ~= MOVE_STATE.ON_STAND then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 455), 4)
				return
			end

			local npc_T = scene.GetNpcByNickName("QIUT_fxf0124" .. player.dwID)
			if npc_T then
				npc_T.SetDisappearFrames(16 * 420, 0)
				npc_T.SetCustomUnsigned4(0, player.dwID)
			end
			
			local npc_Q = scene.GetNpcByNickName("QIUQ_fxf0124" .. player.dwID)
			if npc_Q then
				player.ResetCD(1177)
				npc_Q.SetDisappearFrames(16 * 420, 0)
				npc_Q.SetCustomUnsigned4(0, player.dwID)
				npc_Q.SetPlayerToSocket(0, player.dwID)
				npc_Q.AddBuff(0, 99, 11689, 1, 1000)

				if player.nRoleType == ROLE_TYPE.STANDARD_MALE then
					player.SetDynamicSkillGroup(325)
				elseif player.nRoleType == ROLE_TYPE.STANDARD_FEMALE then
					player.SetDynamicSkillGroup(324)
				elseif player.nRoleType == ROLE_TYPE.LITTLE_BOY then
					player.SetDynamicSkillGroup(325)
				else
					player.SetDynamicSkillGroup(324)
				end
			end
			------------------------------
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com