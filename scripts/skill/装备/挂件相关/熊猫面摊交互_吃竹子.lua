---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��è��̯����_������.lua
-- ����ʱ��:	2016/2/20 14:25:25
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
		"skill/װ��/�Ҽ����/��è��̯����_������.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1027);

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
	if npc then
		player.SendSystemMessage(GetEditorString(9, 8869))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8869), 4)
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
	if npc then
		player.SendSystemMessage(GetEditorString(9, 8869))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8869), 4)
		return
	end
	
	player.DoAction(0, 110030)--���ҳ�����
	player.SetTimer(6 * GLOBAL.GAME_FPS, "scripts/skill/װ��/�Ҽ����/��è��̯����_������.lua", 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --������ʱ����жϴ���
		return
	end

	if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) ~= 321 then
		return
	end
	
	player.DoAction(0, 110031)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com