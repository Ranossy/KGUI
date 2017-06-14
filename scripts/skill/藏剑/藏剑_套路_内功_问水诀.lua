---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��·_�ڹ�_��ˮ��.lua
-- ����ʱ��:	2015/9/25 17:13:41
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 114, nPhysicsAttackPower = 10, nDodge = 1, nPhysicsCri = 1, nPhysicsHit = 2}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 200, nPhysicsAttackPower = 17, nDodge = 3, nPhysicsCri = 2, nPhysicsHit = 3}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 457, nPhysicsAttackPower = 27, nDodge = 5, nPhysicsCri = 4, nPhysicsHit = 6}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 661, nPhysicsAttackPower = 39, nDodge = 6, nPhysicsCri = 5, nPhysicsHit = 8}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 865, nPhysicsAttackPower = 51, nDodge = 8, nPhysicsCri = 6, nPhysicsHit = 10}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 1069, nPhysicsAttackPower = 61, nDodge = 10, nPhysicsCri = 8, nPhysicsHit = 12}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 1274, nPhysicsAttackPower = 73, nDodge = 12, nPhysicsCri = 9, nPhysicsHit = 14}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 1478, nPhysicsAttackPower = 85, nDodge = 14, nPhysicsCri = 11, nPhysicsHit = 16}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 1609, nPhysicsAttackPower = 95, nDodge = 15, nPhysicsCri = 12, nPhysicsHit = 19}, --level 9	--90
	{ DecriticalDamagePowerBase = 244, nMP = 1609, nPhysicsAttackPower = 296, nDodge = 35, nPhysicsCri = 28, nPhysicsHit = 42}, --level 10	--95
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
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
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		4087,
		1
	);

--�ؽ� �ؽ������ñ��
	--���� ��-�⹦����ֵ �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
		0
	);

	--���� ��-1.6�⹦AP �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.AGILITY_TO_PHYSICS_ATTACK_POWER_COF,
		1638,
		0
	);
	--������0.12�⹦�Ʒ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.AGILITY_TO_PHYSICS_OVERCOME_COF,
		123,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_USE_BIG_SWORD_FLAG,
		0,
		0
	);

	--��Ϫ���� ����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		279,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		334,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_RAGE,
		100,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.RAGE_REPLENISH,
		-2, --��ֵӦ��Ϊ-12�����ڲ��Ը�Ϊ100
		0
	);
--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_LIFE_ADDITIONAL,
		tSkillData[dwSkillLevel].nHP,
		0
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --��������
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_ADDITIONAL,
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --����
		ATTRIBUTE_TYPE.DODGE,
		tSkillData[dwSkillLevel].nDodge,
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
		ATTRIBUTE_TYPE.PHYSICS_HIT_VALUE,
		tSkillData[dwSkillLevel].nPhysicsHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		277,
		0
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		412,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		363,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		663,
		1
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_��·_�ڹ�_��ˮ��.lua",
		0
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 339);
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
	if player.dwForceID == 8 and player.GetSkillLevel(10201) < 1 then		--ѧϰ������·
		player.LearnSkill(10201)
	end
	--player.LearnSkill(1720);
	player.LearnSkillLevel(1720, dwSkillLevel, player.dwID)
	player.LearnSkill(1721)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetSkillLevel(6799) == 1 and not player.GetBuff(9900, 1) then
		player.AddBuff(player.dwID, player.nLevel, 9900, 1)
	end

	if player.GetBuff(9701, 1) then
		player.DelBuff(9701, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetBuff(9900, 1) then
		player.DelBuff(9900, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com