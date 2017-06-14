---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�ڹ�_�뾭�׵�.lua
-- ����ʱ��:	2015/8/17 9:58:19
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nMaxMana = 359, nTherapyPower = 100, nLifeReplenish = 2, nManaReplenish = 1, nMagicDefence = 1},
	{DecriticalDamagePowerBase = 22, nMaxMana = 2185, nTherapyPower = 200, nLifeReplenish = 5, nManaReplenish = 2, nMagicDefence = 3},
	{DecriticalDamagePowerBase = 35, nMaxMana = 3259, nTherapyPower = 300, nLifeReplenish = 7, nManaReplenish = 2, nMagicDefence = 5},
	{DecriticalDamagePowerBase = 47, nMaxMana = 4334, nTherapyPower = 400, nLifeReplenish = 10, nManaReplenish = 3, nMagicDefence = 6},
	{DecriticalDamagePowerBase = 60, nMaxMana = 5408, nTherapyPower = 500, nLifeReplenish = 13, nManaReplenish = 4, nMagicDefence = 8},
	{DecriticalDamagePowerBase = 72, nMaxMana = 6482, nTherapyPower = 600, nLifeReplenish = 16, nManaReplenish = 5, nMagicDefence = 10},
	{DecriticalDamagePowerBase = 85, nMaxMana = 7557, nTherapyPower = 700, nLifeReplenish = 19, nManaReplenish = 5, nMagicDefence = 12},
	{DecriticalDamagePowerBase = 98, nMaxMana = 14780, nTherapyPower = 800, nLifeReplenish = 22, nManaReplenish = 6, nMagicDefence = 14},
	{DecriticalDamagePowerBase = 110, nMaxMana = 25235, nTherapyPower = 900, nLifeReplenish = 25, nManaReplenish = 7, nMagicDefence = 15},
	{DecriticalDamagePowerBase = 244, nMaxMana = 34248, nTherapyPower = 1369, nLifeReplenish = 55, nManaReplenish = 7, nMagicDefence = 35},
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_�ڹ�_�뾭�׵�.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1711,
		1
	);
	--��ͨ�����Ŵ���
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
		tSkillData[dwSkillLevel].nMaxMana / 240,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMaxMana / 1200,
		0
		);
	--�������1.6����AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_THERAPY_POWER_COF,
		1638,
		0
	);
	--���� ����-0.15��Ԫ���� �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_NEUTRAL_CRITICAL_STRIKE_COF,
		154,
		0
		);
	--�������0.05����Ч��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_NEUTRAL_CRITICAL_DAMAGE_POWER_COF,
		51,
		0
	);
	--���ʼ�������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		2304,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-819,
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
		ATTRIBUTE_TYPE.MAX_MANA_BASE, --  �������ֵ
		tSkillData[nSkillLevel].nMaxMana,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_BASE, --  ��������
		tSkillData[nSkillLevel].nTherapyPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LIFE_REPLENISH_EXT, --  ��Ѫÿ��ظ�
		tSkillData[nSkillLevel].nLifeReplenish,
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
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- �����¼�100������-��ϼ��ܣ����������˹���Ŀ��100%����144-585BUFF-��Ĭ3��
		100,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER, -- �����¼�153���������˺����ܣ����������˹���Ŀ��20%����598��������Ѫ1-7��.
		152 + nSkillLevel,
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

--[[	if nSkillLevel >= 2 then		--2009.8.19 ����2���ڹ�̫�ؾ��뱩����Ŀ����������
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
			261,
			1
		);
	end

	if nSkillLevel >= 5 then
	    skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,					-- �����¼�115������-̫�ؾ��룩ʹ��20%����292-721BUFF-ÿ���3����.
	        115,
	        0
	    );

	    skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,					-- �����¼�276������-̫�ؾ��룩��������1682BUFF-AP���210��.
	        276,
	        0
	    );
	end

    if nSkillLevel >= 7 then
	    skill.AddAttribute(
	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,					-- �����¼�116������-̫�ؾ��룩ʹ��10%����293-722BUFF-6���������˲������˲��
	        116,
	        0
	    );
	end--]]

	--������� Ԫ���ظ����� ����ս����ά�ֵ�Ч����

	--skill.SetNormalCoolDown(1, 155);
	--skill.SetNormalCoolDown(2, 152);

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);

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

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	local MountKf = player.GetKungfuMount();
	if not MountKf then
		player.MountKungfu(skill.dwSkillID, skill.dwLevel)
	end

	local dwSkillLevel = skill.dwLevel;
	if player.dwForceID == 2 and player.GetSkillLevel(10198) < 1 then		--ѧϰ������·
		player.LearnSkill(10198)
	end
	--player.LearnSkill(492);
	player.LearnSkillLevel(492, dwSkillLevel, player.dwID)
	player.LearnSkill(493)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/��/��_�ڹ�_�뾭�׵�.lua",0,0)
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
		player.CastSkill(1020,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com