---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_���϶�����ͨ������.lua
-- ����ʱ��:	2014/7/2 14:48:24
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��ڤ����_���϶���.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2008-07-01
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��ڤ����
-- ��������  :  ���϶���
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 33, nDamageRand = 4}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 67, nDamageRand = 7}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 100, nDamageRand = 10}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 134, nDamageRand = 14}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 167, nDamageRand = 17}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 201, nDamageRand = 20}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 234, nDamageRand = 24}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 268, nDamageRand = 27}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 301, nDamageRand = 30}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 335, nDamageRand = 34}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 368, nDamageRand = 37}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 402, nDamageRand = 40}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 435, nDamageRand = 44}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 469, nDamageRand = 47}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 502, nDamageRand = 50}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 536, nDamageRand = 54}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 569, nDamageRand = 57}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 603, nDamageRand = 60}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 636, nDamageRand = 64}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 670, nDamageRand = 67}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 703, nDamageRand = 71}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 737, nDamageRand = 74}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 770, nDamageRand = 77}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 804, nDamageRand = 81}, -- Level 24
	{nAddRage = 0, nCostRage = 0, nDamageBase = 837, nDamageRand = 84}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 871, nDamageRand = 87}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 904, nDamageRand = 91}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 938, nDamageRand = 94}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 971, nDamageRand = 97}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1005, nDamageRand = 101}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1038, nDamageRand = 104}, -- Level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
		);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(1, 555, 1);						-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);
	--skill.SetNormalCoolDown(1, 730);	--������ͨCD
	--skill.SetCheckCoolDown(1, 444);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostManaBasePercent = 708;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 25 * LENGTH_BASE;					-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit = 6;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinChannelInterval = 1;-- ͨ�������ʱ��
	skill.nChannelInterval = 280*0.55*0.7; 				-- ͨ�������ʱ��
	--skill.nChannelFrame = 8 * 5;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;		-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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