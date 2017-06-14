---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ˮǹ��ˮ������.lua
-- ����ʱ��:	2015/7/1 1:45:23
-- �����û�:	zhangyan3
-- �ű�˵��:
--[[
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
--]]
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/ˮǹ��ˮ������.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- ����CD 1.5��

	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.dwBackItemIndex ~= 13905 and player.dwBackItemIndex ~= 13906 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end
	--���ˮ��
	--��ȡˮ��-----------------------------------------------------
	local nValue_SHUILIANG = 0
	local nValue_buffid = 0
	for i = 9093, 9102 do
		local buff = player.GetBuff(i, 1)
		if buff then
			nValue_buffid = i
			break
		end
	end
	if nValue_buffid ~= 0 then
		nValue_SHUILIANG = (nValue_buffid - 9093 + 1) * 20
	end
	---------------------------------------------------------------
	if nValue_SHUILIANG < 20 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7466), 4)
		return false
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
	
	local nTargetType, dwTargetID = player.GetTarget()
	if nTargetType ~= TARGET.PLAYER then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7467), 4)
		player.SendSystemMessage(GetEditorString(7, 7467))	
		return
	end
	if dwTargetID == player.dwID then
		return
	end
	local target = GetPlayer(dwTargetID)	
	if not target then
		return
	end
	
	local nValue_buffid = 961
	local nValue_bufflv = 1
	local buff_tx = target.GetBuff(nValue_buffid, nValue_bufflv)
	if buff_tx then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 283), 4)
		player.SendSystemMessage(GetEditorString(8, 283))
		return
	end

	if target.GetBuff(10970, 1) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end

	if target.GetBuff(11638, 1) then -- ������ֱ������ɧ��
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end
	
	if GetCharacterDistance(player.dwID, target.dwID) <= 255 then		-- 4��
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(0, 3270), 4)
		player.SendSystemMessage(GetEditorString(0, 3270))
		return
	end
	
	if GetCharacterDistance(player.dwID, target.dwID) >= 64 * 20 then		-- 10��
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(0, 3267), 4)
		player.SendSystemMessage(GetEditorString(0, 3267))
		return
	end
	
	--if target.nMoveState ~= MOVE_STATE.ON_STAND then
	--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "ֻ�ܶ�վ����ֹ��Ŀ��ʹ�á�", 4)
	--player.SendSystemMessage("ֻ�ܶ�վ����ֹ��Ŀ��ʹ�á�")
	--return
	--end
	
	if target.bFightState then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7469), 4)
		player.SendSystemMessage(GetEditorString(7, 7469))
		return
	end
	
	if target.bOnHorse then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7470), 4)
		player.SendSystemMessage(GetEditorString(7, 7470))
		return
	end
--��ͨ����----
	if target.nMoveState == MOVE_STATE.ON_AUTO_FLY then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end

	if target.nMoveState == MOVE_STATE. ON_START_AUTO_FLY then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 3046), 4)
		player.SendSystemMessage(GetEditorString(10, 3046))
		return
	end
	----------------------------
	local nValue_XIAOHAO = 20
	--��ˮ��---------------------------------------------------------------------------
	--��ȡˮ��---------------------------------------
	local nValue_SHUILIANG = 0
	local nValue_buffid = 0
	for i = 9093, 9102 do
		local buff = player.GetBuff(i, 1)
		if buff then
			nValue_buffid = i
			break
		end
	end
	if nValue_buffid ~= 0 then
		nValue_SHUILIANG = (nValue_buffid - 9093 + 1) * 20
	end
	------------------------------------------------
	if nValue_SHUILIANG < nValue_XIAOHAO then
		return
	end
	local nValue_NOW = nValue_SHUILIANG - nValue_XIAOHAO
	if nValue_NOW == 0 then
		player.DelBuff(nValue_buffid, 1)
	elseif nValue_NOW > 0 then
		player.DelBuff(nValue_buffid, 1)
		-----------------
		--ˮ��תbuff
		local nBuff_NOW = nValue_NOW / 20 - 1 + 9093
		if nBuff_NOW >= 9093 and nBuff_NOW <= 9102 then
			player.AddBuff(0, 99, nBuff_NOW, 1)
		end
		-----------------
	end
	-------------------------------------------------------------------------------------------
	RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7887), 3)
	player.TurnToCharacter(target.dwID)
	player.CastSkill(14038, 1) --���ڴ�������
	target.SetTimer(3 * 16, "scripts/skill/װ��/�Ҽ����/ˮǹ��ˮ������.lua", 0, 0)
	--Ŀ�괦��
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)

	if player.bFightState then
		return
	end
	
	if player.bOnHorse then
		return
	end
	--��ͨ����--
	if player.nMoveState == MOVE_STATE.ON_AUTO_FLY then
		return
	end

	if player.nMoveState == MOVE_STATE.ON_START_AUTO_FLY then
		return
	end
	------------
	player.Stop()
	player.AddBuff(0, 99, 9154, 1)--Ŀ���Ч��
	player.Jump(1,0)
	local scene = player.GetScene()
	if not scene then
		return
	end

	if scene.dwMapID == 74 or scene.nType == MAP_TYPE.DUNGEON then
		player.AddBuff(0, 99, 9168, 1)--Ŀ���Ч��
	end
	
	if scene.dwMapID == 222 or scene.dwMapID == 200 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(7, 7913), 3)
		player.AddBuff(0, 99, 8936, 1, 600)--Ŀ���Ч��
	end
	----------------------------
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com