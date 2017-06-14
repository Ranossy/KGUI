---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������_�ڶ���.lua
-- ����ʱ��:	2014/7/20 10:34:57
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
	{nDamageBase = 37, nDamageRand = 5, nCostMana = 0}, --level 1
	{nDamageBase = 40, nDamageRand = 5, nCostMana = 0}, --level 2
	{nDamageBase = 43, nDamageRand = 5, nCostMana = 0}, --level 3
	{nDamageBase = 46, nDamageRand = 5, nCostMana = 0}, --level 4
	{nDamageBase = 49, nDamageRand = 5, nCostMana = 0}, --level 5
	{nDamageBase = 52, nDamageRand = 5, nCostMana = 0}, --level 6
	{nDamageBase = 55, nDamageRand = 5, nCostMana = 0}, --level 7
	{nDamageBase = 58, nDamageRand = 5, nCostMana = 0}, --level 8
	{nDamageBase = 61, nDamageRand = 5, nCostMana = 0}, --level 9
	{nDamageBase = 64, nDamageRand = 5, nCostMana = 0}, --level 10
	{nDamageBase = 67, nDamageRand = 10, nCostMana = 0}, --level 11
	{nDamageBase = 70, nDamageRand = 10, nCostMana = 0}, --level 12
	{nDamageBase = 73, nDamageRand = 10, nCostMana = 0}, --level 13
	{nDamageBase = 76, nDamageRand = 10, nCostMana = 0}, --level 1
	{nDamageBase = 79, nDamageRand = 10, nCostMana = 0}, --level 2
	{nDamageBase = 82, nDamageRand = 10, nCostMana = 0}, --level 3
	{nDamageBase = 85, nDamageRand = 10, nCostMana = 0}, --level 4
	{nDamageBase = 88, nDamageRand = 10, nCostMana = 0}, --level 5
	{nDamageBase = 91, nDamageRand = 10, nCostMana = 0}, --level 6
	{nDamageBase = 94, nDamageRand = 10, nCostMana = 0}, --level 7
	{nDamageBase = 97, nDamageRand = 10, nCostMana = 0}, --level 8
	{nDamageBase = 100, nDamageRand = 10, nCostMana = 0}, --level 9
	{nDamageBase = 103, nDamageRand = 15, nCostMana = 0}, --level 10
	{nDamageBase = 106, nDamageRand = 15, nCostMana = 0}, --level 11
	{nDamageBase = 109, nDamageRand = 15, nCostMana = 0}, --level 12
	{nDamageBase = 112, nDamageRand = 15, nCostMana = 0}, --level 13
	{nDamageBase = 115, nDamageRand = 15, nCostMana = 0}, --level 1
	{nDamageBase = 118, nDamageRand = 15, nCostMana = 0}, --level 2
	{nDamageBase = 121, nDamageRand = 20, nCostMana = 0}, --level 3
	{nDamageBase = 124, nDamageRand = 20, nCostMana = 0}, --level 4
	{nDamageBase = 127, nDamageRand = 20, nCostMana = 0}, --level 5
	{nDamageBase = 130, nDamageRand = 20, nCostMana = 0}, --level 6
	{nDamageBase = 135, nDamageRand = 20, nCostMana = 0}, --level 7
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*1.1,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*1.1,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --������
		ATTRIBUTE_TYPE.CAST_SKILL,
		4031,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		4025,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --��Ǵ���BUFF
		ATTRIBUTE_TYPE.CALL_BUFF,
		4025,
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
		2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(503);	--���̹���CD
	skill.SetNormalCoolDown(1, 507);	--����֮��CD
	--skill.nDamageToManaForParty = 51;	-- �˺���5%תΪ�������

	skill.AddSlowCheckSelfBuff(4025, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);
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
		skill.nChannelInterval = 25*1.2;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = (25 + (dwSkillLevel - 9) * 1.5)*1.2
	else
		skill.nChannelInterval = 77*1.2;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval	= 96;
	skill.nAreaRadius = 4 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 3;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)
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

	RemoteCallToClient(player.dwID, "ChangeSkillSurfaceNum", 3962, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com