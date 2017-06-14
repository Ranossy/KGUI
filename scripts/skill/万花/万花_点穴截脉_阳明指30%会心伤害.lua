---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_��Ѩ����_����ָ10%�����˺�.lua
-- ����ʱ��:	2015/9/27 21:27:28
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, nDamageRand = 5, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, nDamageRand = 5, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, nDamageRand = 5, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, nDamageRand = 5, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, nDamageRand = 5, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 63, nDamageRand = 5, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, nDamageRand = 5, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 71, nDamageRand = 5, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, nDamageRand = 5, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, nDamageRand = 10, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 11, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 79, nDamageRand = 12, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, nDamageRand = 13, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 83, nDamageRand = 14, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, nDamageRand = 15, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 86, nDamageRand = 16, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 90, nDamageRand = 17, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94, nDamageRand = 18, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 98, nDamageRand = 19, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 102, nDamageRand = 20, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 105, nDamageRand = 21, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 110, nDamageRand = 22, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115, nDamageRand = 23, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120, nDamageRand = 24, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125, nDamageRand = 25, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 135, nDamageRand = 26, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, nDamageRand = 27, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 155, nDamageRand = 28, }, -- Level 28
};

tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.NEUTRAL_CRITICAL_STRIKE_BASE_RATE, -- ħ������
		1500, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.MAGIC_CRITICAL_DAMAGE_POWER_BASE_KILONUM_RATE,
		153,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase * (1 - tPit[dwSkillLevel].nReducePercent), -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent), -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ����AP�ӳ�
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1116,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		2726, -- ����ֵ1
		1																	-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_��Ѩ����_����ָ�����˺�.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	--skill.SetNormalCoolDown(1, 175);
	--skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 28;				-- ����֡��  09��6��27��Ϊ32 ����CBG
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48 * 1.365*1.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 4) * 1.365*1.2
	else
		skill.nChannelInterval = 130 * 1.365*1.2;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval = 130; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval = 1;
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 85;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com