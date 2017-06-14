---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������_�ڶ���.lua
-- ����ʱ��:	2014/7/20 11:01:17
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ֣����
-- ����ʱ��  :  20120613
-- ����Ч��  :  ���̼���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 100 * 0.95, nDamageRand = 25 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 110 * 0.95, nDamageRand = 40 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 120 * 0.95, nDamageRand = 56 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 130 * 0.95, nDamageRand = 71 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 140 * 0.95, nDamageRand = 87 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 150 * 0.95, nDamageRand = 102 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 160 * 0.95, nDamageRand = 118 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 170 * 0.95, nDamageRand = 133 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 180 * 0.95, nDamageRand = 149 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 190 * 0.95, nDamageRand = 164 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 200 * 0.95, nDamageRand = 180 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 210 * 0.95, nDamageRand = 195 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 220 * 0.95, nDamageRand = 211 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 230 * 0.95, nDamageRand = 226 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 242 * 0.95, nDamageRand = 242 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 257 * 0.95, nDamageRand = 257 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 273 * 0.95, nDamageRand = 273 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 288 * 0.95, nDamageRand = 288 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 304 * 0.95, nDamageRand = 304 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 319 * 0.95, nDamageRand = 319 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 335 * 0.95, nDamageRand = 335 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 350 * 0.95, nDamageRand = 350 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 366 * 0.95, nDamageRand = 366 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 381 * 0.95, nDamageRand = 381 * 0.1, nCostMana = 0}, --level 11
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, --�����10%����
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE_BASE_RATE,
		500,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/5,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/5,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_MOON_ENERGY,
		2000,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		4019,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --��Ǵ���BUFF
		ATTRIBUTE_TYPE.CALL_BUFF,
		4019,
		2
	);

--���������˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);

	--�������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_������_�ڶ���.lua",
		0
	);
	--���Զ��ͷ���һ�����ܵ�buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9486,
		4
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(503);	--���̹���CD
	skill.SetNormalCoolDown(1, 504);	--����֮��CD
	--skill.nDamageToManaForParty = 51;	-- �˺���5%תΪ�������

	skill.AddSlowCheckSelfBuff(4019, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/10)*195;	-- �������ĵ�����
	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0		 									--����ʩ����С�뾶
	skill.nMaxRadius = 6 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�
	skill.nWeaponDamagePercent = 1024;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 32*1.2;
	elseif dwSkillLevel < 24 then
		skill.nChannelInterval = (32 + (dwSkillLevel - 9) * 2)*1.2
	else
		skill.nChannelInterval = 70*1.2;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval	= 88;

	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡

	--skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������

end

function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 3959, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com