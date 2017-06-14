---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�������_���ɾ���.lua
-- ����ʱ��:	2016/5/11 20:49:44
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �������_���ɾ���.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �������
-- ��������  :  ���ɾ���
-- ����Ч��  :  ���賤����ʹĿ��ֱ���ܵ��⹦�˺�.
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 56, nDamageRand = 28, nCostMana = 130},
	{ nDamageBase = 70, nDamageRand = 35, nCostMana = 165},
	{ nDamageBase = 83, nDamageRand = 41, nCostMana = 200},
	{ nDamageBase = 96, nDamageRand = 48, nCostMana = 235},
	{ nDamageBase = 109, nDamageRand = 54, nCostMana = 270},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 5

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�������_���ɾ���.lua",
		0
	);

	skill.BindBuff(1, 1097, 1);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 86);
	skill.SetCheckCoolDown(1, 444)
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 119;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;		-- ���ܱ���ϵĸ���.����1024
	skill.nBreakRate = PERCENT_BASE;					-- ���Ŀ��ʩ���ĸ���,����1024
	skill.nDismountingRate = PERCENT_BASE;					-- ��Ŀ�����������,����1024��Ĭ��0

	skill.nWeaponDamagePercent = 0;					-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	ModityCDToUI(player, 310, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com