---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���ӽ���_��������_�ƶ�.lua
-- ����ʱ��:	2015/10/18 22:29:31
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 80 * 0.95, nDamageRand = 80 * 0.1, nCostMana = 42 },
	{nDamage = 91 * 0.95, nDamageRand = 91 * 0.1, nCostMana = 42 },
	{nDamage = 105 * 0.95, nDamageRand = 105 * 0.1, nCostMana = 42 },
	{nDamage = 115 * 0.95, nDamageRand = 115 * 0.1, nCostMana = 42 },
	{nDamage = 125 * 0.95, nDamageRand = 125 * 0.1, nCostMana = 42 },
	{nDamage = 137 * 0.95, nDamageRand = 137 * 0.1, nCostMana = 42 },
	{nDamage = 158 * 0.95, nDamageRand = 158 * 0.1, nCostMana = 42 },
	{nDamage = 163 * 0.95, nDamageRand = 163 * 0.1, nCostMana = 42 },
	{nDamage = 181 * 0.95, nDamageRand = 181 * 0.1, nCostMana = 42 },
	{nDamage = 202 * 0.95, nDamageRand = 202 * 0.1, nCostMana = 42 },
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
	--Ŀ�������˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6234,
		dwSkillLevel
	);

	--����buff,dot
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		2919,
		1
	);

	--����buff2,����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		7796,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/���Ҽ���ʵ���˺�.lua", --����ֵ1
		0															--����ֵ2
	);

	--AOE����dot
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3009,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9347,
		dwSkillLevel
	);
	--[[
	--AOE����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		9146,
		dwSkillLevel
		);
	--]]

	skill.AddSlowCheckSelfBuff(10121, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	
	--���Ṧ
	skill.BindBuff(1, 562, 9);
	--����
	skill.BindBuff(2, 3484, 1);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 404 * 0.2 * 0.9;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 404 * 0.4 * 0.9;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 404 * 0.6 * 0.9;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 404 * 0.8 * 0.9;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 404 * 0.9;	-- �������ĵ�����
	end
	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- ����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- ����ʩ�����뾶
	skill.nAngleRange = 128; 									-- ʩ�ŽǶ�

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	skill.nChannelInterval = 16; 			-- ͨ�������ʱ��
	skill.nChannelFrame = 48;			-- ͨ��������ʱ�䣬��λ֡��
	skill.nBulletVelocity = 0;					-- �ӵ��ٶȣ���λ ��/֡
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 1;
	skill.nBreakRate = 1024;					--����ϵĸ���,Ĭ��1024��ʾһ�������
	skill.nMinChannelInterval = 1;     -- ͨ�������ʱ��
	skill.nMinChannelFrame = 1
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
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	player.AddBuff(0, 99, 409, nLevel)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com