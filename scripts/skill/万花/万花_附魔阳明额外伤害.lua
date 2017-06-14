---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_����_����ָ����25%�˺�.lua
-- ����ʱ��:	2014/4/7 14:08:39
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_��Ѩ����_����ָ.lua
-- ������    :  ����ǿ
-- ����ʱ��  :  2008-8-12
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��������
-- �书��·  :  ��Ѩ����
-- ��������  :  ����ָ
-- ����Ч��  :  Զ�������ڹ��˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40 * 0.95, nDamageRand = 40 * 0.1, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55 * 0.95, nDamageRand = 55 * 0.1, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 70 * 0.95, nDamageRand = 70 * 0.1, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85 * 0.95, nDamageRand = 85 * 0.1, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 100 * 0.95, nDamageRand = 100 * 0.1, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115 * 0.95, nDamageRand = 115 * 0.1, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 130 * 0.95, nDamageRand = 130 * 0.1, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145 * 0.95, nDamageRand = 145 * 0.1, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160 * 0.95, nDamageRand = 160 * 0.1, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 175 * 0.95, nDamageRand = 175 * 0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 190 * 0.95, nDamageRand = 190 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 205 * 0.95, nDamageRand = 205 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 220 * 0.95, nDamageRand = 220 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 235 * 0.95, nDamageRand = 235 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 250 * 0.95, nDamageRand = 250 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 265 * 0.95, nDamageRand = 265 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280 * 0.95, nDamageRand = 280 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 295 * 0.95, nDamageRand = 295 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 310 * 0.95, nDamageRand = 310 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 325 * 0.95, nDamageRand = 325 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 340 * 0.95, nDamageRand = 340 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 355 * 0.95, nDamageRand = 355 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 370 * 0.95, nDamageRand = 370 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 385 * 0.95, nDamageRand = 385 * 0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 400 * 0.95, nDamageRand = 400 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 415 * 0.95, nDamageRand = 415 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 430 * 0.95, nDamageRand = 430 * 0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 445 * 0.95, nDamageRand = 445 * 0.1, }, -- Level 28
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
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase * 0.7 * (1 - tPit[dwSkillLevel].nReducePercent), -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand * 0.7 * (1 - tPit[dwSkillLevel].nReducePercent), -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
		);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		7691, -- ����ֵ1
		1																-- ����ֵ2
	);
	--]]
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(7691, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
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
	--skill.nCostManaBasePercent = 264;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 28;				-- ����֡��  09��6��27��Ϊ32 ����CBG
	--[[
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = 48 + (dwSkillLevel - 9) * 4
	else
		skill.nChannelInterval =130;     -- ͨ�������ʱ��
	end
	--]]
	skill.nChannelInterval = (130 + 28) * (1+dwSkillLevel*0.1);     -- ͨ�������ʱ��
	--skill.nChannelInterval = 130; 				-- ͨ�������ʱ��
	skill.nMinChannelInterval = 1;
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
	--skill.nBrokenRate = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
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