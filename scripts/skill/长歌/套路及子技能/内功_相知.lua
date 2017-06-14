---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�ڹ�_��֪.lua
-- ����ʱ��:	2015/10/13 15:19:06
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�ڹ�_��֪.lua
-- ����ʱ��:	2015/8/14 17:03:28
-- �����û�:	mengxiangfei11
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nMaxMana = 347, nTherapy = 100, nLifeReplenish = 2, nMagicDefence = 1, DecriticalDamagePowerBase = 13}, --15��
	{nMaxMana = 2110, nTherapy = 200, nLifeReplenish = 3, nMagicDefence = 3, DecriticalDamagePowerBase = 22}, --20��
	{nMaxMana = 3148, nTherapy = 300, nLifeReplenish = 5, nMagicDefence = 5, DecriticalDamagePowerBase = 35}, --30��
	{nMaxMana = 4187, nTherapy = 400, nLifeReplenish = 8, nMagicDefence = 6, DecriticalDamagePowerBase = 47}, --40��
	{nMaxMana = 5224, nTherapy = 500, nLifeReplenish = 10, nMagicDefence = 8, DecriticalDamagePowerBase = 60}, --50��
	{nMaxMana = 6262, nTherapy = 600, nLifeReplenish = 12, nMagicDefence = 10, DecriticalDamagePowerBase = 72}, --60��
	{nMaxMana = 7300, nTherapy = 700, nLifeReplenish = 14, nMagicDefence = 12, DecriticalDamagePowerBase = 85}, --70��
	{nMaxMana = 14278, nTherapy = 800, nLifeReplenish = 16, nMagicDefence = 14, DecriticalDamagePowerBase = 98}, --80��
	{nMaxMana = 24378, nTherapy = 900, nLifeReplenish = 18, nMagicDefence = 15, DecriticalDamagePowerBase = 110}, --90��
	{nMaxMana = 33084, nTherapy = 1464, nLifeReplenish = 41, nMagicDefence = 35, DecriticalDamagePowerBase = 244}, --95��
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
		tSkillData[dwSkillLevel].nMaxMana,
		0
	);
	--����ÿ��ظ�����ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH,
		tSkillData[dwSkillLevel].nMaxMana / 240,
		0
	);
	--ÿ�����ظ�����ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MANA_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nMaxMana / 1200,
		0
	);
	--������������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --��������
		ATTRIBUTE_TYPE.MAX_LIFE_PERCENT_ADD,
		(dwSkillLevel * 1 + 10) / 100 * 1024,
		0
	);
	--���ʼ�������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.VITALITY_TO_MAX_MANA_COF,
		2304,
		0
	);
	--����AP
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.THERAPY_POWER_BASE,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);

	--�ڹ�����ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_SHIELD,
		tSkillData[dwSkillLevel].nMagicDefence,
		0
	);

	--��Ѫÿ��ظ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LIFE_REPLENISH_EXT,
		tSkillData[dwSkillLevel].nLifeReplenish,
		0
	);
	--���Ƕ����������1.65
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_THERAPY_POWER_COF,
		1690,
		0
	);
	--���Ƕ������0.1���ĵȼ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_STRIKE_COF,
		102,
		0
	);
	--���Ƕ������0.04����Ч��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SPIRIT_TO_LUNAR_CRITICAL_DAMAGE_POWER_COF,
		41,
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

	--�л��ķ�ִ�нű��������buff��ͼ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��·���Ӽ���/�ڹ�_��֪.lua",
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
	player.LearnSkillLevel(14088, skill.dwLevel, player.dwID)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.SetTimer(4, "scripts/skill/����/��·���Ӽ���/�ڹ�_��֪.lua", 0, 0)
	--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10448)

	--print(222222)
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
	local shang_lev = player.GetSkillLevel(14138)
	if shang_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14065, 14138, shang_lev)	--�л��̼���
	end
	--�л��Ǽ���
	local jue_lev = player.GetSkillLevel(14139)
	if jue_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14066, 14139, jue_lev)	--�л��Ǽ���
	end
	--�л��缼��
	local zhi_lev = player.GetSkillLevel(14140)
	if zhi_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14067, 14140, zhi_lev)	--�л��缼��
	end
	--�л�����
	local yu_lev = player.GetSkillLevel(14141)
	if yu_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14068, 14141, yu_lev)	--�л�����
	end
	--�л�������������
	local gong_lev = player.GetSkillLevel(14137)
	if gong_lev ~= 0 then
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14064, 14137, gong_lev)	--�л�����������
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14302, 14137, gong_lev)	--�л�����������
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 14298, 14137, gong_lev)	--�л�����������
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

	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "FireUIEvent", "UPDATE_MOUNT_KUNG_FU", 10448)
	if player.IsFormationLeader() then
		player.CastSkill(14172,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com