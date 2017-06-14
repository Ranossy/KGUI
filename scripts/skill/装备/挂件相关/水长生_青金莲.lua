---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ˮ����_�����.lua
-- ����ʱ��:	2015/7/1 1:40:28
-- �����û�:	zhangyan3
-- �ű�˵��:
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
		"skill/װ��/�Ҽ����/ˮ����_�����.lua",
		0
	);

	skill.SetPublicCoolDown(16);							-- ����CD 1.5��

	skill.SetNormalCoolDown(1, 871)							-- װˮ3��CD
	
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.dwBackItemIndex ~= 13906 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end

	if player.dwModelID ~= 0 then -- ����ǲ��ǻ�װ��
		return false
	end

	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
	if player.bFightState then
		return false
	end

	if player.bOnHorse then
		return false
	end
	if player.dwIdentityVisiableID ~= 0 then
		return SKILL_RESULT_CODE.FAILED
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

	if player.dwBackItemIndex ~= 13906 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return
	end

	for i = 1, 100 do
		player.DelGroupBuff(409, i)--����ɾ��
	end

	local scene = player.GetScene()

	--------------------------��������ֲ�������ϵ��ٻ�����--------------------------
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(0, 1399), 4)
		player.SendSystemMessage(GetEditorString(0, 112))
		return
	end

	if scene.nType == MAP_TYPE.BATTLE_FIELD then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	local dwMapID = scene.dwMapID

	---------------------
	--�������ʹ���̬�������л�
	player.AddBuff(0, 99, 9153, 1)
	player.Jump(1,0)
	---------------------
	--local buff_zhuren = player.GetBuff(8660, 1)
	--if buff_zhuren then
	--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "�Ѿ���һ������", 4)
	--player.SetDynamicSkillGroup(184)
	--return
	--end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com