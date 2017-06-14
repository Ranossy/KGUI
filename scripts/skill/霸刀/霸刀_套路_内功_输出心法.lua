---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ե�/�Ե�_��·_�ڹ�_����ķ�.lua
-- ����ʱ��:	2016/6/28 17:04:20
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 283, nPhysicsAttackPower = 11, nPhysicsShield = 2, nPhysicsHit = 4}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 1728, nPhysicsAttackPower = 18, nPhysicsShield = 3, nPhysicsHit = 6}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 2578, nPhysicsAttackPower = 29, nPhysicsShield = 4, nPhysicsHit = 10}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 3428, nPhysicsAttackPower = 42, nPhysicsShield = 6, nPhysicsHit = 14}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 4278, nPhysicsAttackPower = 55, nPhysicsShield = 7, nPhysicsHit = 17}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 5128, nPhysicsAttackPower = 66, nPhysicsShield = 9, nPhysicsHit = 21}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 5977, nPhysicsAttackPower = 79, nPhysicsShield = 10, nPhysicsHit = 25}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 11691, nPhysicsAttackPower = 92, nPhysicsShield = 12, nPhysicsHit = 28}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 19962, nPhysicsAttackPower = 103, nPhysicsShield = 13, nPhysicsHit = 32}, --level 9	--90
	{ DecriticalDamagePowerBase = 244, nMP = 27091, nPhysicsAttackPower = 320, nPhysicsShield = 30, nPhysicsHit = 71}, --level 10	--95
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�Ե�/�Ե�_��·_�ڹ�_����ķ�.lua",
		0
	);
	--�趨����������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_RAGE,
		100,
		0
	);
	--�趨��󵶻�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_ENERGY,
		100,
		0
	);

	--����ֹͣת��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STOP_MAKE_SUN_POWER,
		0,
		0
	);

	--�������ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_SUN_ENERGY,
		100,
		0
	);
	
	--�ķ���ˤ
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
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMP / 1200,
		0
	);
	--ȫ��޽���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
 		- 512
	);
	--�����������1.55AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_ATTACK_POWER_COF,
		1587,
		0
	);
	--�����������0.19�⹦�Ʒ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_OVERCOME_COF,
		195,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
 		- 819,
		0
	);
	--���ʼ�������
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		1536,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --��������
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE,
		tSkillData[dwSkillLevel].nMP,
		0
	);
	--]]
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

	--��ͨ�����Ƿ����Ч�ж�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1427,
		0
	);
	
	--Miss�����齭��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1429,
		0
		);


	--�ؼ������齭��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1441,
		0
		);

	--�����������Ļظ�5��ŭ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1446,
		0
		);

	--��Х�������Ļ�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1435,
		0
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 153);
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
	player.LearnSkillLevel(16023, skill.dwLevel, player.dwID)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	player.DelBuff(10814, 1) --˫��
	player.DelBuff(10815, 1) --��
	player.DelBuff(10816, 1) --�ʵ� 
	player.AddBuff(player.dwID, player.nLevel, 11157, 1)
	--]]
	player.AddBuff(player.dwID, player.nLevel, 10919, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	player.DelBuff(10919, 1) --��̬���
	--[[
	player.DelBuff(10814, 1) --˫��
	player.DelBuff(10815, 1) --��
	player.DelBuff(10816, 1) --�ʵ� 
	player.DelBuff(11157, 1) --����̬
	--]]
end

function OnTimer(player, nparam1, nparam2)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com