---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����Ǳ�/��ʸ_Զ�̹���.lua
-- ����ʱ��:	2016/9/21 15:17:32
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
--������Ե������� ǧ������ һͳ����
--�书����
--NPC-��ͨ����
--����Ч����˵����NPC��ͨ��������
--����	2007-5-23

--------------����ķָ���-----------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--tSkillData =
--{
	--{nDamageBase = 2500, nDamageRand = 0, nCostMana = 0}, --level 1
	--{nDamageBase = 6500, nDamageRand = 0, nCostMana = 0}, --level 2
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	--{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
--};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	--local dwSkillLevel = skill.dwLevel;
	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		--ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		--tSkillData[dwSkillLevel].nDamageBase,
		--0
	--);

	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		--ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		--tSkillData[dwSkillLevel].nDamageRand,
		--0
	--);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);

	----------------- ����������� ----------------------------------------

	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 35.0 * LENGTH_BASE;
	skill.nAngleRange = 128;

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com