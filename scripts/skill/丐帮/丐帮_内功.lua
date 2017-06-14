---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/ؤ��_�ڹ�.lua
-- ����ʱ��:	2015/8/17 8:49:24
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--������Ч�������ѩս��,ÿ��AP�ӳ�
tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 285, nPhysicsAttackPower = 11, nPhysicsShield = 1, nPhysicsCri = 0, nPhysicsHit = 3}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 1737, nPhysicsAttackPower = 18, nPhysicsShield = 2, nPhysicsCri = 0, nPhysicsHit = 6}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 2591, nPhysicsAttackPower = 28, nPhysicsShield = 3, nPhysicsCri = 0, nPhysicsHit = 10}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 3445, nPhysicsAttackPower = 41, nPhysicsShield = 4, nPhysicsCri = 0, nPhysicsHit = 13}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 4299, nPhysicsAttackPower = 54, nPhysicsShield = 6, nPhysicsCri = 0, nPhysicsHit = 17}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 5153, nPhysicsAttackPower = 64, nPhysicsShield = 7, nPhysicsCri = 0, nPhysicsHit = 21}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 6007, nPhysicsAttackPower = 77, nPhysicsShield = 8, nPhysicsCri = 0, nPhysicsHit = 24}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 11750, nPhysicsAttackPower = 89, nPhysicsShield = 10, nPhysicsCri = 0, nPhysicsHit = 28}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 20062, nPhysicsAttackPower = 100, nPhysicsShield = 11, nPhysicsCri = 0, nPhysicsHit = 31},
	{ DecriticalDamagePowerBase = 244, nMP = 27227, nPhysicsAttackPower = 311, nPhysicsShield = 25, nPhysicsCri = 0, nPhysicsHit = 70},
};
--����ı������_��_��ϳɹ�Ч��֮����˺������¼�ID,ͨ���ڹ���ͬ�ȼ�������,�Դ��������˺�.
tSkillEventData =
{
	{nLevel = 1, nEventID = 118 };
	{nLevel = 2, nEventID = 118 };
	{nLevel = 3, nEventID = 118 };	--����һ�γ�����32��-��-���������˹���Ŀ��100%����483���˺�+���
	{nLevel = 4, nEventID = 145 };	--40
	{nLevel = 5, nEventID = 146 };	--50
	{nLevel = 6, nEventID = 147 };	--60
	{nLevel = 7, nEventID = 148 }	--�������70��

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
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
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMP / 1200,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
		);
	--����ת1.5AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_ATTACK_POWER_COF,
		1536,
		0
		);
	--����0.25�Ʒ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_OVERCOME_COF,
		256,
		0
	);
	--���ʼ�������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		1536,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MOVE_SPEED_PERCENT,
		105,
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
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nMP,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_BASE,
		tSkillData[dwSkillLevel].nPhysicsAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_BASE,
		tSkillData[dwSkillLevel].nPhysicsShield,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_HIT_VALUE,
		tSkillData[dwSkillLevel].nPhysicsHit,
		0
	);

--������� Ԫ������ ����ս����ά�ֵ�Ч����
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.MANA_REPLENISH_COEFFICIENT,
	--1024,
	--0
	--);

--������� �Ƽ�����ʩ���ļ����¼�

--����50%����518SKILL����540BUFF����
--[[	if dwSkillLevel >= 2 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
			144,
			0
		);
	end--]]

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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1127,
		0
	);
--������� ��Ѫս��40������Ч��, ���ټ��ܳ��30%
--[[	if dwSkillLevel >= 4 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
			0,
			-303
		);
	end--]]

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--	skill.SetNormalCoolDown(1, 153);
--	skill.SetNormalCoolDown(2, 152);

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

	skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
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
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end

	local dwSkillLevel = skill.dwLevel;
	--if player.dwForceID == 9 and player.GetSkillLevel(10197) < 1 then		--ѧϰ������·
	--player.LearnSkill(10197)
	--end
	--player.LearnSkill(5308);
	player.LearnSkillLevel(5308, dwSkillLevel, player.dwID)
	player.LearnSkill(5309)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com