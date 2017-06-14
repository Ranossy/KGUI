---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_����_��ɫ��.lua
-- ����ʱ��:	2016/9/12 17:53:25
-- �����û�:	FENGMENGJIE
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/����_����_��ɫ��.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16); -- ����CD 1.5��

	skill.SetNormalCoolDown(1, 1120); -- ������ͨCD

	----------------- ����������� ---------------------------------------------
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE; -- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE; -- ����ʩ�ŵ�������
	----------------- ���÷�Χ -------------------------------------------------
	-- skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	-- skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	-- skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256; -- ������Χ�����νǶȷ�Χ
	-- skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	-- skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult) -- �ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.dwBackItemIndex ~= 19081 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return SKILL_RESULT_CODE.FAILED
	end

	if player.dwModelID ~= 0 then -- ����ǲ��ǻ�װ��
		return SKILL_RESULT_CODE.FAILED
	end

	local scene = player.GetScene()
	if scene.dwMapID ~= 258  then
		return SKILL_RESULT_CODE.FAILED
	end
	
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if not player.nMoveState == MOVE_STATE.ON_STAND then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(8, 444), 4)
		player.SendSystemMessage(GetEditorString(8, 445))
		return
	end

	local scene = player.GetScene()
	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	if player.dwBackItemIndex ~= 19081 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return
	end

	--ɾ������---
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local nH = ((player.nFaceDirection + 10) / 256 * 360) / 360 * 2 * 3.1415926
	local dwX_POINT = player.nX + (3 * 64) * math.cos(nH)
	local dwY_POINT = player.nY + (3 * 64) * math.sin(nH)

	local scene = player.GetScene()

	local  npcX = scene.GetNpcByNickName("rabbit_fxf1609_" .. player.dwID)
	if npcX then
		player.SendSystemMessage(GetEditorString(10, 5929))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 5929), 4)
		return
	else

		scene.CreateNpc(41160, dwX_POINT, dwY_POINT, player.nZ, 0, 16 * 2, "FXF_JC_160901" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_160902" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_JC_160903" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_JC_160904" .. player.dwID)

		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/װ��/�Ҽ����/����_����_��ɫ��.lua", 0, 0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nParam1 == 0 then
		local szName1 = "FXF_JC_160901" .. player.dwID
		local szName2 = "FXF_JC_160902" .. player.dwID
		local szName3 = "FXF_JC_160903" .. player.dwID
		local szName4 = "FXF_JC_160904" .. player.dwID
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
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 425), 4)
				player.ClearCDTime(1120)
				return
			else
				local nH = ((player.nFaceDirection + 10) / 256 * 360) / 360 * 2 * 3.1415926
				local dwX_POINT_T = player.nX + (3 * 64) * math.cos(nH)
				local dwY_POINT_T = player.nY + (3 * 64) * math.sin(nH)

				--����NPC--���ΰ�
				scene.CreateNpc(52769, dwX_POINT_T, dwY_POINT_T, player.nZ, player.nFaceDirection, 60 * 16, "rabbit_fxf1609_" .. player.dwID)
				local npcX = scene.GetNpcByNickName("rabbit_fxf1609_" .. player.dwID)
				if npcX then
					npcX.SetCustomUnsigned4(0, player.dwID)
					npcX.SetModelID(54569)
				end
				
				--����NPC--��
				scene.CreateNpc(52707, dwX_POINT_T, dwY_POINT_T, player.nZ, player.nFaceDirection, 60 * 16, "tree_fxf1609_" .. player.dwID)
				local npcY = scene.GetNpcByNickName("tree_fxf1609_" .. player.dwID)
				if npcY then
					npcY.SetCustomUnsigned4(0, player.dwID)
					npcY.SetModelID(54568)
				end
				
				player.AddBuff(0, 99, 11173, 1, 65)

				if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 355 then
					player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
				end
			end
		end
	end
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com