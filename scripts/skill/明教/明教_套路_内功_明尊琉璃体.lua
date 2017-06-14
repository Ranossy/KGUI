---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��·_�ڹ�_����������.lua
-- ����ʱ��:	2015/8/17 8:44:05
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nHP = 275, nMP = 114, nPhysicsDefence = 3, nMagicDefence = 3, nDodge = 7, nPhysicsCri = 5, nPhysicsHit = 4  }, --level 1	--15
	{ nHP = 470, nMP = 200, nPhysicsDefence = 6, nMagicDefence = 6, nDodge = 12, nPhysicsCri = 6, nPhysicsHit = 5  }, --level 2	--20
	{ nHP = 1004, nMP = 457, nPhysicsDefence = 9, nMagicDefence = 9, nDodge = 19, nPhysicsCri = 9, nPhysicsHit = 7  }, --level 3	--30
	{ nHP = 1450, nMP = 661, nPhysicsDefence = 13, nMagicDefence = 13, nDodge = 26, nPhysicsCri = 11, nPhysicsHit = 9  }, --level 4	--40
	{ nHP = 1895, nMP = 865, nPhysicsDefence = 16, nMagicDefence = 16, nDodge = 33, nPhysicsCri = 13, nPhysicsHit = 11 }, --level 5	--50
	{ nHP = 2340, nMP = 1069, nPhysicsDefence = 20, nMagicDefence = 20, nDodge = 39, nPhysicsCri = 16, nPhysicsHit = 13 }, --level 6	--60
	{ nHP = 3180, nMP = 1274, nPhysicsDefence = 23, nMagicDefence = 23, nDodge = 46, nPhysicsCri = 18, nPhysicsHit = 15 }, --level 7	--70
	{ nHP = 6731, nMP = 1478, nPhysicsDefence = 27, nMagicDefence = 27, nDodge = 53, nPhysicsCri = 21, nPhysicsHit = 15 }, --level 8	--80
	{ nHP = 6731, nMP = 1478, nPhysicsDefence = 30, nMagicDefence = 30, nDodge = 60, nPhysicsCri = 21, nPhysicsHit = 15 }, --level 9	--90
	{ nHP = 6731, nMP = 1478, nPhysicsDefence = 66, nMagicDefence = 66, nDodge = 133, nPhysicsCri = 21, nPhysicsHit = 15 }, --level 10	--95
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_��·_�ڹ�_����������.lua",
		0
	);
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
	--���� ����-1.25��Ѫ���� �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_LIFE_COF,
		1280,
		0
	);

	--���� ����-0.225���ܵȼ� �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_DODGE_COF,
		230,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-1024,
		0
	);
	--�������ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_SUN_ENERGY,
		10000,
		0
	);

	--�������ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MOON_ENERGY,
		10000,
		0
	);

	--��ս��������ÿ��˥��ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SUN_ENERGY_FALL_OFF,
		100,
		0
	);

	--��ս��������ÿ��˥��ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MOON_ENERGY_FALL_OFF,
		100,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --��������
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(25 + 2 * dwSkillLevel) / 100 * 1024,
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
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  �ڹ�����ֵ
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_BASE,
		tSkillData[dwSkillLevel].nPhysicsDefence,
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

	--������·Ϊ����޵��ؼ�
	for i = 1154, 1163 do
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
			i,
			1
		);
	end
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		512
	);
	--������ȫ������в����������Ŀ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		838,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		892,
		1
		);
	--����ҫ����¼�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1296,
		1
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --������ħ�����и���
	--ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
	--893,
	--0
	--);
	--12�����ѨЧ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1335,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1336,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1337,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1338,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1339,
		1
		);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		1340,
		1
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 565);
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
	if player.dwForceID == 10  and player.GetSkillLevel(10240) < 1 then		--ѧϰ������·
		player.LearnSkill(10240)
	end
	--player.LearnSkill(4260);
	player.LearnSkillLevel(4260, dwSkillLevel, player.dwID)
	player.LearnSkill(4261);
	player.LearnSkill(4432);
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/����/����_��·_�ڹ�_����������.lua",0,0)
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
		player.CastSkill(4687,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com