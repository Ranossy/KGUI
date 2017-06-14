---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�ڹ�_������.lua
-- ����ʱ��:	2015/8/17 9:49:52
-- �����û�:	mengxiangfei11
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{DecriticalDamagePowerBase = 13, nMaxMana = 322, nSpunkAttackPower = 12, nNeHit = 2, nLifeReplenish = 1, nMagicDefence = 1}, --15��
	{DecriticalDamagePowerBase = 22, nMaxMana = 1962, nSpunkAttackPower = 20, nNeHit = 3, nLifeReplenish = 2, nMagicDefence = 2}, --20��
	{DecriticalDamagePowerBase = 35, nMaxMana = 2926, nSpunkAttackPower = 32, nNeHit = 6, nLifeReplenish = 3, nMagicDefence = 4}, --30��
	{DecriticalDamagePowerBase = 47, nMaxMana = 3891, nSpunkAttackPower = 47, nNeHit = 8, nLifeReplenish = 5, nMagicDefence = 5}, --40��
	{DecriticalDamagePowerBase = 60, nMaxMana = 4855, nSpunkAttackPower = 61, nNeHit = 10, nLifeReplenish = 6, nMagicDefence = 6}, --50��
	{DecriticalDamagePowerBase = 72, nMaxMana = 5820, nSpunkAttackPower = 73, nNeHit = 12, nLifeReplenish = 8, nMagicDefence = 8}, --60��
	{DecriticalDamagePowerBase = 85, nMaxMana = 6784, nSpunkAttackPower = 87, nNeHit = 14, nLifeReplenish = 9, nMagicDefence = 9}, --70��
	{DecriticalDamagePowerBase = 98, nMaxMana = 13270, nSpunkAttackPower = 102, nNeHit = 16, nLifeReplenish = 11, nMagicDefence = 11}, --80��
	{DecriticalDamagePowerBase = 110, nMaxMana = 22656, nSpunkAttackPower = 113, nNeHit = 19, nLifeReplenish = 12, nMagicDefence = 12}, --90��
	{DecriticalDamagePowerBase = 244, nMaxMana = 30748, nSpunkAttackPower = 355, nNeHit = 42, nLifeReplenish = 27, nMagicDefence = 28}, --95��
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local nSkillLevel = skill.dwLevel
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_�ڹ�_������.lua",
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
	);
	--���� Ԫ��-1.95��Ԫ���ڹ�AP �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_NEUTRAL_ATTACK_POWER_COF,
		1997,
		0
		);
	--Ԫ������0.09�Ʒ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPUNK_TO_NEUTRAL_OVERCOME_COF,
		92,
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
		ATTRIBUTE_TYPE.MAX_MANA_BASE, -- �������ֵ
		tSkillData[nSkillLevel].nMaxMana,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.NEUTRAL_HIT_VALUE, -- ��Ԫ���ڹ�����
		tSkillData[nSkillLevel].nNeHit,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_ATTACK_POWER_BASE, -- �ڹ�AP
		tSkillData[nSkillLevel].nSpunkAttackPower,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LIFE_REPLENISH_EXT, -- ��Ѫÿ��ظ�
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

	--�˴��������ָ��������ļ����¼�
--	for i = 1, 7 do
--	    skill.AddAttribute(
--	        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
--	        ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,						-- �����¼�153���������˺����ܣ����������˹���Ŀ��20%����598��������Ѫ1-7��.
--	        152 + i,
--	        0
--	    );
--    end							-- ȥ������������Ѫ  2009-6-29 CBG

--	if nSkillLevel >= 5 then		--2009.6.29 ȥ��5���ڹ����� CBG
--		skill.AddAttribute(
--			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
--			ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,						-- �����¼�162������-����ָ������10%����601-����BUFF��714��666��711��647.
--			162,
--			1
--		);
--	end

	--������� Ԫ���ظ����� ����ս����ά�ֵ�Ч����
--[[	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	ATTRIBUTE_TYPE.MANA_REPLENISH_COEFFICIENT,
	1024,
	0
	);	]]--

--[[	if nSkillLevel >= 2 then		--2009.8.19 ����2���ڹ���������Ѫ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		260,
		1
	);
end

if nSkillLevel >= 4 then 			--2010.2.26 ����4���ڹ�����Ч��, ���ټ��ܳ��20%
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-204
	);
end

if nSkillLevel >= 5 then		--2009.6.29 ����5���ڹ�����ָˢ��ܽ�ز���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		243, -- �����¼�243������-����ָ��100%��������ܽ�ز���CD
		1
	);
end

if nSkillLevel >= 6 then		-- 2009.6.30���� ��ʯ���30%����ΪĿ��Ӷ���  ����6���ڹ� --CBG
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_EVENT_HANDLER,
		246, -- �����¼�246������-��ʯ��٣�30%������Ŀ�궨��4s
		1
	);
end   ]]--
----------------- ����CoolDown ---------------------------------------------------------------------
--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--skill.SetNormalCoolDown(1, 8);
--skill.SetNormalCoolDown(1, 155);
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
	--player.LearnSkill(487);
	player.LearnSkillLevel(487, dwSkillLevel, player.dwID)
	player.LearnSkill(491)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetTimer(16,"scripts/skill/��/��_�ڹ�_������.lua",0,0)
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
		player.CastSkill(230,1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com