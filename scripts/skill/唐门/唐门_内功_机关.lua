---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_�ڹ�_����.lua
-- ����ʱ��:	2015/8/17 10:13:19
-- �����û�:	mengxiangfei11
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nNeHit = 2, nPhysicsCri = 2, nPoisonAttackPower = 11, nMagicDefence = 1}, --15��
	{DecriticalDamagePowerBase = 22, nNeHit = 5, nPhysicsCri = 3, nPoisonAttackPower = 18, nMagicDefence = 2}, --20��
	{DecriticalDamagePowerBase = 35, nNeHit = 8, nPhysicsCri = 6, nPoisonAttackPower = 29, nMagicDefence = 4}, --30��
	{DecriticalDamagePowerBase = 47, nNeHit = 10, nPhysicsCri = 8, nPoisonAttackPower = 42, nMagicDefence = 5}, --40��
	{DecriticalDamagePowerBase = 60, nNeHit = 13, nPhysicsCri = 10, nPoisonAttackPower = 55, nMagicDefence = 6}, --50��
	{DecriticalDamagePowerBase = 72, nNeHit = 16, nPhysicsCri = 12, nPoisonAttackPower = 66, nMagicDefence = 8}, --60��
	{DecriticalDamagePowerBase = 85, nNeHit = 19, nPhysicsCri = 14, nPoisonAttackPower = 78, nMagicDefence = 9}, --70��
	{DecriticalDamagePowerBase = 98, nNeHit = 22, nPhysicsCri = 16, nPoisonAttackPower = 92, nMagicDefence = 11}, --80��
	{DecriticalDamagePowerBase = 110, nNeHit = 25, nPhysicsCri = 19, nPoisonAttackPower = 102, nMagicDefence = 12}, --90��
	{DecriticalDamagePowerBase = 244, nNeHit = 56, nPhysicsCri = 42, nPoisonAttackPower = 320, nMagicDefence = 28}, --95��
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
		"skill/����/����_�ڹ�_����.lua",
		0
	);
	--���� Ԫ��-�ڹ�AP �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DROP_DEFENCE,
		250,
		0
	);
	--����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.DECRITICAL_DAMAGE_POWER_BASE,
		tSkillData[dwSkillLevel].DecriticalDamagePowerBase,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
		);
	--Ԫ������1.75�ڹ�AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_POISON_ATTACK_POWER_COF,
		1792,
		0
	);

	--���� Ԫ��-0.23�⹦���� �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_PHYSICS_CRITICAL_STRIKE_COF,
		236,
		0
		);
	--Ԫ������0.08��Ч
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_PHYSICS_CRITICAL_DAMAGE_POWER_COF,
		82,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --��������
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_HIT_VALUE, --�⹦����
		tSkillData[nSkillLevel].nNeHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --�ڹ�AP
		ATTRIBUTE_TYPE.POISON_ATTACK_POWER_BASE,
		tSkillData[nSkillLevel].nPoisonAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_CRITICAL_STRIKE,
		tSkillData[dwSkillLevel].nPhysicsCri,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  �ڹ�����ֵ
		tSkillData[nSkillLevel].nMagicDefence,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_ENERGY,
		100,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ENERGY_REPLENISH,
		10,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --÷�����Ϻ��Ĭ�ڹ�
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		580,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_PERCENT, -- ����ÿ��ظ�
		1024,
		0
	);

--���̽÷���ƻ����������¼�  2011-12-8
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		639,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		640,
		0
	);

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD,SetNormalCoolDown(posi, id)���ü���CD,����posiΪCoolDownλ(��3λ),id��Ҫ��CoolDownList.tab
--	skill.SetNormalCoolDown(1, 493);
	--skill.SetNormalCoolDown(2, 152);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= 0;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nMinRadius		= 0											--����ʩ����С�뾶
	--skill.nMaxRadius        = 2 * LENGTH_BASE;							--����ʩ�����뾶
	--skill.nAngleRange       = 128; 										--ʩ�ŽǶ�

	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��

	--skill.nBulletVelocity   = 12;										--�ӵ��ٶ�,��/֡

	--skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е������������,�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵���,��ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ��,ע��,�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬,���ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���,����skillΪ�������skill,��һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end
	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 7 and player.GetSkillLevel(10230) < 1 then		--ѧϰ������·
		player.LearnSkill(10230)
	end
	if player.GetSkillLevel(3373) < 1 then				--����
		player.LearnSkill(3373)
	end
	if player.GetSkillLevel(3374) < 1 then
		player.LearnSkill(3374)
	end
	--player.LearnSkill(3211);
	player.LearnSkillLevel(3211, dwSkillLevel, player.dwID)
	player.LearnSkill(3212);
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/����/����_�ڹ�_����.lua",0,0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nparam1, nparam2)
	if not player then
		return
	end
if player.IsFormationLeader() then
		player.CastSkill(3217,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com