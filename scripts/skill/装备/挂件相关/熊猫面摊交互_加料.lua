---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��è��̯����_����.lua
-- ����ʱ��:	2016/2/20 15:22:10
-- �����û�:	FENGMENGJIE
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

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
		"skill/װ��/�Ҽ����/��è��̯����_����.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 1027);

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
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --������ʱ����жϴ���
		return false
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	
	local npc = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
	if not npc then
		player.SendSystemMessage(GetEditorString(9, 8870))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8870), 4)
		return
	end
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
	if not scene then
		return
	end
	
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --������ʱ����жϴ���
		return
	end

	if player.dwModelID ~= 0 then -- ����ǲ��ǻ�װ��
		return
	end

	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return
	end

	if player.bFightState then
		return
	end

	if player.bOnHorse then
		return
	end

	local npc = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
	if not npc then
		player.SendSystemMessage(GetEditorString(9, 8871))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8871), 4)
		return
	end

	-----�ж�������ϵ�CD buff----- 
	local buff_CD = player.GetBuff(10506, 0)
	
	local nValueZ = 400
	
	local nA_xm1 = -10 --���ƫ�ƽǶ�
	local nL_xm1 = 0.5 * 64 --���ƫ�ƾ���
	local nH1 = ((npc.nFaceDirection + nA_xm1) / 256 * 360) / 360 * 2 * 3.1415926
	local dwX_POINT1 = npc.nX + nL_xm1 * math.cos(nH1)
	local dwY_POINT1 = npc.nY + nL_xm1 * math.sin(nH1)

	local nA_xm2 = 45 --���ƫ�ƽǶ�
	local nL_xm2 = 0.9 * 64 --���ƫ�ƾ���
	local nH2 = ((npc.nFaceDirection + nA_xm2) / 256 * 360) / 360 * 2 * 3.1415926
	local dwX_POINT2 = npc.nX + nL_xm2 * math.cos(nH2)
	local dwY_POINT2 = npc.nY + nL_xm2 * math.sin(nH2)
	
	if buff_CD and buff_CD.nStackNum == 2 then
		player.SendSystemMessage(GetEditorString(9, 8874))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8875), 4)
		return
	elseif buff_CD and buff_CD.nStackNum == 1 then
		
		local nBuff_id = 10506
		local nBuff_lv = 1
		AddBuff_nStackNum_Max2(player, nBuff_id, nBuff_lv)

		local doodad1 = scene.GetDoodadByNickName("mw1_fxf" .. player.dwID)
		local newdoodad1 = nil
		if doodad1 then
			scene.DestroyDoodad(doodad1.dwID)
			newdoodad1 = scene.CreateDoodad(6013, dwX_POINT1, dwY_POINT1, npc.nZ + nValueZ, npc.nFaceDirection, "mw1_fxf" .. player.dwID)
			--������
		else
			newdoodad1 = scene.CreateDoodad(6013, dwX_POINT1, dwY_POINT1, npc.nZ + nValueZ, npc.nFaceDirection, "mw1_fxf" .. player.dwID)	--������
		end
		newdoodad1.SetCustomUnsigned4(0, npc.dwID)
		player.SendSystemMessage(GetEditorString(9, 8876))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8876), 4)
		return
	else
	
		local nBuff_id = 10506
		local nBuff_lv = 1
		AddBuff_nStackNum_Max2(player, nBuff_id, nBuff_lv)

		local doodad2 = scene.GetDoodadByNickName("mw2_fxf" .. player.dwID)
		local newdoodad2 = nil
		if doodad2 then
			scene.DestroyDoodad(doodad2.dwID)
			newdoodad2 = scene.CreateDoodad(6013, dwX_POINT2, dwY_POINT2, npc.nZ + nValueZ, npc.nFaceDirection, "mw2_fxf" .. player.dwID)	--������
		else
			newdoodad2 = scene.CreateDoodad(6013, dwX_POINT2, dwY_POINT2, npc.nZ + nValueZ, npc.nFaceDirection, "mw2_fxf" .. player.dwID)	--������
		end
		newdoodad2.SetCustomUnsigned4(0, npc.dwID)
		player.SendSystemMessage(GetEditorString(9, 8876))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8876), 4)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function AddBuff_nStackNum_Max2(player, nBuff_id, nBuff_lv)
	--===========================================================================		
	local buff_x = player.GetBuff(nBuff_id, nBuff_lv)
	
	local nCurrentTime = GetCurrentTime()
	local tTime = TimeToDate(nCurrentTime)
	local nLineTime = DateToTime(tTime.year, tTime.month, tTime.day + 1, 7, 0, 0)           --�ڶ���7���ʱ��ֵ
	local nLineTime2 = DateToTime(tTime.year, tTime.month, tTime.day, 7, 0, 0)              --����7���ʱ��ֵ
	local nLastTime = 1
	if nCurrentTime > nLineTime2 then
		nLastTime = nLineTime - nCurrentTime                                                  --���ں��¸�������7�ֵ�ʱ���
	else
		--���С��7�㣬��ӵ�����7��
		nLastTime = nLineTime2 - nCurrentTime   
	end
		
	if buff_x then
		if buff_x.nStackNum < 2 then
			player.AddBuff(0, 99, nBuff_id, nBuff_lv, nLastTime)
		end
	else
		player.AddBuff(0, 99, nBuff_id, nBuff_lv, nLastTime)
	end
	--===========================================================================
end

--function GetPoint_xyf(nX,nY,nF,nA,nL)
	--local nA_xm1 = nA --���ƫ�ƽǶ�
	--local nL_xm1 = nL --���ƫ�ƾ���
	--local nH_xm1 = ((nF + nA) / 256 * 360) / 360 * 2 * math.pi
	--local nX_New = nX + (nL_xm1) * math.cos(nH_xm1)
	--local nY_New = nY + (nL_xm1) * math.sin(nH_xm1)
	--local nF_New = nF
	--return nX_New,nY_New,nF_New
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com