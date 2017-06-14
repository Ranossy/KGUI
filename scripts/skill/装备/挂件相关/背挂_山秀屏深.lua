---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/����_ɽ������.lua
-- ����ʱ��:	2017/5/27 15:19:10
-- �����û�:	ZHANGYAN0-PC
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/����_ɽ������.lua",
		0
	);

	skill.SetPublicCoolDown(938);
	skill.SetNormalCoolDown(1, 1218);

	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������

	local dwRepresentID = player.GetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND)
	if dwRepresentID ~= 398 then
		return false
	end

	--��黻װ
	if player.dwModelID ~= 0 then
		return false
	end
	--���״̬
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
	--���ս��
	if player.bFightState then
		return false
	end
	--������
	if player.bOnHorse then
		return false
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--
	for i = 1, 100 do
		player.DelGroupBuff(409, i)--����ɾ��
	end
	--

	player.ApplyDoEmotionAction(105)--���鶯��ID
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
-------------------------------------------------------
--����ұ�������жϡ�BY��ͷ

--�жϵ��ߵı���ID
--dwRepresentID = player.GetRepresentID(nRepresentIndex)
--EQUIPMENT_REPRESENT.FACE_EXTEND		--��
--EQUIPMENT_REPRESENT.BACK_EXTEND   	--��
--EQUIPMENT_REPRESENT.WAIST_EXTEND   	--��
--EQUIPMENT_REPRESENT.L_SHOULDER_EXTEND	--���
--EQUIPMENT_REPRESENT.R_SHOULDER_EXTEND	--���
--EQUIPMENT_REPRESENT.BACK_CLOAK_EXTEND	--�������磩
--EQUIPMENT_REPRESENT.CHEST_STYLE			--��װ

-- ����ǲ���װ�˹Ҽ����жϵ���ID
-- ���������� player.dwBackItemIndex
-- �沿������ player.dwFaceItemIndex
-- ���������� player.dwWaistItemIndex
------------------------------------------------------------
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com