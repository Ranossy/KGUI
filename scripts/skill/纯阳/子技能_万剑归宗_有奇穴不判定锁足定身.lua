---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�Ӽ���_�򽣹���_����Ѩ���ж����㶨��.lua
-- ����ʱ��:	2015/9/20 10:11:42
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 67, nDamageRand = 7}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 103, nDamageRand = 10}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 138, nDamageRand = 14}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 174, nDamageRand = 17}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 209, nDamageRand = 21}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 245, nDamageRand = 24}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280, nDamageRand = 28}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 316, nDamageRand = 31}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 351, nDamageRand = 35}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 387, nDamageRand = 38}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 422, nDamageRand = 42}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 458, nDamageRand = 46}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 493, nDamageRand = 49}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 529, nDamageRand = 53}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 564, nDamageRand = 56}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 600, nDamageRand = 60}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 635, nDamageRand = 63}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 671, nDamageRand = 67}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 706, nDamageRand = 70}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 742, nDamageRand = 74}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 777, nDamageRand = 78}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 813, nDamageRand = 81}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 848, nDamageRand = 85}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 884, nDamageRand = 88}, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 919, nDamageRand = 92}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 955, nDamageRand = 95}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 990, nDamageRand = 99}, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1026, nDamageRand = 102}, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1061, nDamageRand = 106}, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1097, nDamageRand = 109}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1132, nDamageRand = 113}, -- Level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase / 10,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand / 10,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--����CD
	--skill.SetNormalCoolDown(1, 83);	--����CD

	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	--skill.AddCheckSelfLearntSkill(14806, 1, SKILL_COMPARE_FLAG.EQUAL);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 24*1.25;
	elseif dwSkillLevel < 31 then
		skill.nChannelInterval = (24 + (dwSkillLevel - 9) * 3)*1.25;
	else
		skill.nChannelInterval = 100*1.25;
	end
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�

	--skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com