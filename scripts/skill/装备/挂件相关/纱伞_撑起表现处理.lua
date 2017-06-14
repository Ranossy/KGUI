---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ɴɡ_������ִ���.lua
-- ����ʱ��:	2015/7/29 16:20:29
-- �����û�:	zhangyan3
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
		"skill/װ��/�Ҽ����/ɴɡ_������ִ���.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 931);

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
	if player.dwBackItemIndex ~= 13914 and player.dwBackItemIndex ~= 19196 and player.dwBackItemIndex ~= 19256 then --������ʱ���ж�
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
	local scene = player.GetScene()
	
	if not player.nMoveState == MOVE_STATE.ON_STAND then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(8, 444), 4)
		player.SendSystemMessage(GetEditorString(8, 445))
		return
	end

	--  �޸�ǰ
	--if scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD or scene.dwMapID == 25 or scene.dwMapID == 27 then
		--player.SendSystemMessage("��ǰ��������ʹ�á�")
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "��ǰ��������ʹ��", 4)
		--return 
	--end
	-- �޸ĺ�
	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end
	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 13914 and player.dwBackItemIndex ~= 19196 and player.dwBackItemIndex ~= 19256 then --������ʱ���ж�
		return
	end
	
	--����ɾ��
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local npcX = scene.GetNpcByNickName("ss_yt150813_" .. player.dwID)
	if npcX then
		player.SendSystemMessage(GetEditorString(8, 446))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 446), 4)
		return
	else
		--player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 0)  --ж�±����Ҽ�
		--player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 13126)
--		player.AddBuff(0, 99, 8640, 1, 10) --���
		--	player.AddBuff(0, 99, 7194, 1) --CD
		local scene = player.GetScene()
		scene.CreateNpc(41160, player.nX + 70, player.nY + 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_1_" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_2_" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_3_" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "YUTOU_DZ_4_" .. player.dwID)

		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/װ��/�Ҽ����/ɴɡ_������ִ���.lua", 0, 0)
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
		local szName1 = "YUTOU_DZ_1_" .. player.dwID
		local szName2 = "YUTOU_DZ_2_" .. player.dwID
		local szName3 = "YUTOU_DZ_3_" .. player.dwID
		local szName4 = "YUTOU_DZ_4_" .. player.dwID
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
				player.ClearCDTime(931)
				return
			else
				--����NPC
				scene.CreateNpc(44133, player.nX, player.nY, player.nZ, player.nFaceDirection, 100 * 16, "ss_yt150813_" .. player.dwID)
				
				local npcX = scene.GetNpcByNickName("ss_yt150813_" .. player.dwID)
				if npcX then
					npcX.SetCustomUnsigned4(0, player.dwID)
				end

				--ȥ���ֳ֣�����ӱ��ұ��ִ����ж�NPC������񣬴����򲻴�����ӱ���ɡ�������ڴ˱�עscripts/skill/���ܵ���/ʦͽϵͳ_ɡ�Ҽ�14.lua
				player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
				local buff_san = player.GetBuff(1575, 0)
				if buff_san then
					player.DelBuff(1575, buff_san.nLevel)
				end
				return
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com