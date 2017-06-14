---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_��·_�ڹ�_��Ѫս��.lua
-- ����ʱ��:	2014/7/16 20:06:01
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_��·_�ڹ�ϵ_��Ѫս��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-03-24
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �ڹ�
-- �书��·  :  ��
-- ��������  :  �ڹ�ϵ
-- ����Ч��  :  �书��·��װ������������⹦AP,����ֵ���⹦����ֵ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--������Ч�������ѩս��,ÿ��AP�ӳ�
tSkillData =
{
	{ DecriticalDamagePowerBase = 13, nMP = 283, nPhysicsAttackPower = 11, nPhysicsShield = 1, nPhysicsHit = 3}, --level 1	--15
	{ DecriticalDamagePowerBase = 22, nMP = 1728, nPhysicsAttackPower = 19, nPhysicsShield = 2, nPhysicsHit = 5}, --level 2	--20
	{ DecriticalDamagePowerBase = 35, nMP = 2578, nPhysicsAttackPower = 30, nPhysicsShield = 4, nPhysicsHit = 9}, --level 3	--30
	{ DecriticalDamagePowerBase = 47, nMP = 3428, nPhysicsAttackPower = 43, nPhysicsShield = 6, nPhysicsHit = 12}, --level 4	--40
	{ DecriticalDamagePowerBase = 60, nMP = 4278, nPhysicsAttackPower = 56, nPhysicsShield = 7, nPhysicsHit = 15}, --level 5	--50
	{ DecriticalDamagePowerBase = 72, nMP = 5128, nPhysicsAttackPower = 67, nPhysicsShield = 9, nPhysicsHit = 18}, --level 6	--60
	{ DecriticalDamagePowerBase = 85, nMP = 5977, nPhysicsAttackPower = 80, nPhysicsShield = 11, nPhysicsHit = 22}, --level 7	--70
	{ DecriticalDamagePowerBase = 98, nMP = 11691, nPhysicsAttackPower = 94, nPhysicsShield = 12, nPhysicsHit = 25}, --level 8	--80
	{ DecriticalDamagePowerBase = 110, nMP = 19962, nPhysicsAttackPower = 105, nPhysicsShield = 14, nPhysicsHit = 28}, --level 9	--90
	{ DecriticalDamagePowerBase = 244, nMP = 27091, nPhysicsAttackPower = 326, nPhysicsShield = 31, nPhysicsHit = 63},	--level 10	--95
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
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
		"skill/���/���_��·_�ڹ�_��Ѫս��.lua",
		0
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
	--ȫ��޽���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
		);
	--�����������1.6AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_ATTACK_POWER_COF,
		1638,
		0
		);
	--������������⹦�Ʒ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.STRENGTH_TO_PHYSICS_OVERCOME_COF,
		123,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
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


	--������� �Ƽ�����ʩ���ļ����¼�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		114,
		0
	);

	--������� �����ʩ���ļ����¼�,�ֳ�5��,��ʵ���˺���ͬ��Ч��.
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		148,
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
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1110,
		2
	);
	--��Ĭ������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
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

	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 3 and player.GetSkillLevel(10197) < 1 then		--ѧϰ������·
		player.LearnSkill(10197)
	end
	--player.LearnSkill(520);
	player.LearnSkillLevel(520, dwSkillLevel, player.dwID)
	player.LearnSkill(521)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/���/���_��·_�ڹ�_��Ѫս��.lua",0,0)
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
		player.CastSkill(754,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com