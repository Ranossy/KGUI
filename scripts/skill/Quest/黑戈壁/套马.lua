---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�ڸ��/����.lua
-- ����ʱ��:	2015/10/20 16:57:53
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
		"skill/Quest/�ڸ��/����.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	--skill.nPrepareFrames  	= 160;				-- ����֡��
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 11 * LENGTH_BASE;		-- ����ʩ�ŵ�������

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
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 4839), 4)
		player.SendSystemMessage(GetEditorString(8, 4839))
		return
	end

	local target = GetNpc(dwTargetID)
	if not target then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 1307), 3)
		player.SendSystemMessage(GetEditorString(8, 2789))
		return
	end

	if target.dwTemplateID ~= 47021 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 4839), 4)
		player.SendSystemMessage(GetEditorString(8, 4839))
		return
	end
	if target.bFightState then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 7469), 4)
		player.SendSystemMessage(GetEditorString(7, 7469))
		return
	end

	if target.GetCustomInteger1(1) > 0 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 8307), 4)
		player.SendSystemMessage(GetEditorString(8, 8307))
		return
	end

	player.TurnToCharacter(target.dwID)
	local nQuestID = 14595   --�����Ҵ���
	local nQuestPhase = player.GetQuestPhase(nQuestID)
	local nQuestIndex = player.GetQuestIndex(nQuestID)
	if nQuestIndex and nQuestPhase == 1 then
		--player.SetQuestValue(nQuestIndex, 0, 1)
		local scene = player.GetScene()
		if not scene then
			return
		end
		local npc = scene.GetNpcByNickName("beizhuayema" .. player.dwID)
		if npc then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 8308), 4)
			player.SendSystemMessage(GetEditorString(8, 8308))
			return
		end

		local newnpc = scene.CreateNpc(48078, target.nX, target.nY, target.nZ, target.nFaceDirection, 300 * GLOBAL.GAME_FPS, "beizhuayema" .. player.dwID)  --��˽��NPC
		if newnpc then
			newnpc.SetCustomUnsigned4(0, player.dwID)
			newnpc.SetModelID(target.dwModelID + 1082)  --3�б��ֶ��Ƕ�Ӧ������ID��ֱ�Ӽ��ϲ���
			target.SetDisappearFrames(16, 1)
			target.SetCustomInteger1(1, 1)
			player.SetQuestValue(nQuestIndex, 1, target.dwID)
			player.SetQuestValue(nQuestIndex, 0, 1)
			player.AddBuff(0, 99, 10142, 1, 300)
			target.DoAction(0, 10054)
		end
		--[[
		if player.CanAddItem(ITEM_TABLE_TYPE.OTHER, 25756) then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 25744, 1)
			player.AddItem(ITEM_TABLE_TYPE.OTHER, 25756, 1)
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "�����������޷���õ��ߡ�", 4)
			player.SendSystemMessage("�����������޷���õ��ߡ�")
		end
		--]]
	end
end
--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com