---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�ڹ�_Ī��.lua
-- ����ʱ��:	2015/10/13 15:17:42
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�ڹ�_Ī��.lua
-- ����ʱ��:	2015/8/14 17:33:12
-- �����û�:	mengxiangfei11
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nMP = 315, nSpunkAttackPower = 11, nNeHit = 2, nMagicDefence = 1, nLunarCritical = 2, DecriticalDamagePowerBase = 13}, --15��
	{nMP = 1917, nSpunkAttackPower = 18, nNeHit = 5, nMagicDefence = 2, nLunarCritical = 3, DecriticalDamagePowerBase = 22}, --20��
	{nMP = 2860, nSpunkAttackPower = 29, nNeHit = 8, nMagicDefence = 4, nLunarCritical = 6, DecriticalDamagePowerBase = 35}, --30��
	{nMP = 3803, nSpunkAttackPower = 42, nNeHit = 10, nMagicDefence = 5, nLunarCritical = 8, DecriticalDamagePowerBase = 47}, --40��
	{nMP = 4746, nSpunkAttackPower = 55, nNeHit = 13, nMagicDefence = 6, nLunarCritical = 10, DecriticalDamagePowerBase = 60}, --50��
	{nMP = 5688, nSpunkAttackPower = 66, nNeHit = 16, nMagicDefence = 8, nLunarCritical = 12, DecriticalDamagePowerBase = 72}, --60��
	{nMP = 6631, nSpunkAttackPower = 78, nNeHit = 19, nMagicDefence = 9, nLunarCritical = 14, DecriticalDamagePowerBase = 85}, --70��
	{nMP = 12971, nSpunkAttackPower = 92, nNeHit = 22, nMagicDefence = 11, nLunarCritical = 16, DecriticalDamagePowerBase = 98}, --80��
	{nMP = 22145, nSpunkAttackPower = 102, nNeHit = 25, nMagicDefence = 12, nLunarCritical = 19, DecriticalDamagePowerBase = 110}, --90��
	{nMP = 30055, nSpunkAttackPower = 320, nNeHit = 56, nMagicDefence = 28, nLunarCritical = 42, DecriticalDamagePowerBase = 244}, --95��
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	--��ˤ
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
	--�������������˵ļ���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.BEAT_BACK_RATE,
		-819,
		0
	);
	--����вֵ����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-307
	);
	--�ķ�������ߵ�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_MANA_BASE, -- �������ֵ
		tSkillData[dwSkillLevel].nMP,
		0
	);
	--����ÿ��ظ�����ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMP / 240,
		0
	);
	--ÿ�����ظ�����ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMP / 1200,
		0
	);
	--������������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	--���ʼ�������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		1536,
		0
	);

	--�ڹ�AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_ATTACK_POWER_BASE, -- �ڹ�AP
		tSkillData[dwSkillLevel].nSpunkAttackPower,
		0
	);
	--�����ڹ�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_HIT_VALUE, -- �����ڹ�����
		tSkillData[dwSkillLevel].nNeHit,
		0
	);
	--�����ڹ�����ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE, -- �����ڹ�����ֵ
		tSkillData[dwSkillLevel].nLunarCritical,
		0
	);
	--�ڹ�����ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD, --  �ڹ�����ֵ
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);

	--���ǼӲ������ڹ�AP(1024����)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_ATTACK_POWER_COF,
		1895,
		0
	);
	--���� ����-�����ڹ�����ֵ �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_STRIKE_COF,
		154,
		0
	);
	--���� ����-�����ڹ�����ֵ �ӳ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		51,
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
	--�л��ķ�ʱɾ������buff���л�����ͼ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��·���Ӽ���/�ڹ�_Ī��.lua",
		0
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 339);
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
	player.LearnSkillLevel(14087, skill.dwLevel, player.dwID)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.SetTimer(4, "scripts/skill/����/��·���Ӽ���/�ڹ�_Ī��.lua", 0, 0)
	--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10447)

	--ɾ��������������Ч��
	--��ɽ��ˮ
	if player.GetBuff(9377, 1) then
		player.DelBuff(9377, 1)
	end

	--��ӳ����ж�buff
	player.AddBuff(player.dwID, player.nLevel, 9641, 1)
	
	--ɾ�����ı���Ч��
	for i = 1, 4 do
		if player.GetBuff(9318 + i, 1) then
			player.DelBuff(9318 + i, 1)
		end
	end

	--ɾ�����Ӱ��Ӱ��״̬���buff
	if player.GetBuff(9506, 1) then
		player.DelBuff(9506, 1)
	end

	--�л��ķ��Զ��л��������϶�Ӧ��˫�ķ�ͼ��
	--�л��̼���
	local shang_lev = player.GetSkillLevel(14065)
	if shang_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14138, 14065, shang_lev)	--�л��̼���
	end
	--�л��Ǽ���
	local jue_lev = player.GetSkillLevel(14066)
	if jue_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14139, 14066, jue_lev)	--�л��Ǽ���
	end
	--�л��缼��
	local zhi_lev = player.GetSkillLevel(14067)
	if zhi_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14140, 14067, zhi_lev)	--�л��缼��
	end
	--�л�����
	local yu_lev = player.GetSkillLevel(14068)
	if yu_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14141, 14068, yu_lev)	--�л�����
	end
	--�л������ܣ�Ҫ�ж���ǰ��Ѩ��
	local gong_lev = player.GetSkillLevel(14064)
	if gong_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14137, 14064, gong_lev)	--�л�������
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14303, 14064, gong_lev)	--�л�������
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14300, 14064, gong_lev)	--�л�������
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetBuff(9641, 1) then
		player.DelBuff(9641, 1)
	end

	for i = 1, 4 do
		if player.GetBuff(9318 + i, 1) then
			player.DelBuff(9318 + i, 1)
		end
	end
end


function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end

	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10447)
	if player.IsFormationLeader() then
		player.CastSkill(14181,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com