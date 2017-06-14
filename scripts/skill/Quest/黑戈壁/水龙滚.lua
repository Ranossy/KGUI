---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�ڸ��/ˮ����.lua
-- ����ʱ��:	2015/9/17 15:21:54
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
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
		"skill/Quest/�ڸ��/ˮ����.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- ����CD 1.5��

	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 3 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 35;	
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������

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
	if nTargetType ~= TARGET.NPC then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2788), 4)
		player.SendSystemMessage(GetEditorString(8, 2788))
		return
	end

	local target = GetNpc(dwTargetID)
	if not target then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 1307), 3)
		player.SendSystemMessage(GetEditorString(8, 2789))
		return
	end

	if target.dwTemplateID ~= 45949 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2788), 4)
		player.SendSystemMessage(GetEditorString(8, 2788))
		return
	end

	local nValue_buffid = 9817
	local nValue_bufflv = 1
	local buff_tx = target.GetBuff(nValue_buffid, nValue_bufflv)
	if buff_tx then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2790), 4)
		player.SendSystemMessage(GetEditorString(8, 2790))
		return
	end

	if GetCharacterDistance(player.dwID, target.dwID) <= 255 then		-- 4��
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(0, 3270), 4)
		player.SendSystemMessage(GetEditorString(0, 3270))
		return
	end

	if GetCharacterDistance(player.dwID, target.dwID) >= 64 * 20 then		-- 20��
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

	player.TurnToCharacter(target.dwID)
	player.CastSkill(14038, 1) --���ڴ�������
	--target.AddBuff(player.dwID, player.nLevel, nValue_buffid, nValue_bufflv)
	player.SetTimer(3 * 16, "scripts/skill/Quest/�ڸ��/ˮ����.lua", 0, target.dwID)
	--Ŀ�괦��
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
---[[
function OnTimer(player, nParam1, nParam2)
	local npc = GetNpc(nParam2)
	if not npc then
		return
	end
	if npc.GetBuff(9817, 1) then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 2795), 4)
		player.SendSystemMessage(GetEditorString(8, 2795))
		
    	return
    end
	npc.AddBuff(player.dwID, player.nLevel, 9817, 1)

end
--]]
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com