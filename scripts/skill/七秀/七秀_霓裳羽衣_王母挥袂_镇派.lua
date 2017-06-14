---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��������_��ĸ����_����.lua
-- ����ʱ��:	2016/6/29 22:09:09
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_��������_��ĸ����_����.lua
-- ������    :  �ź�
-- ����ʱ��  :  2011-04-16
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :
-- �书��·  :  ��������
-- ��������  :  ��ĸ����
-- ����Ч��  :  Զ�̴������ƣ���Ҫ����״̬
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 516 * 0.95, nTherapyRand = 516 * 0.1, nCostMana = 115 }, -- level 1
	{nTherapy = 557 * 0.95, nTherapyRand = 557 * 0.1, nCostMana = 166 }, -- level 2
	{nTherapy = 598 * 0.95, nTherapyRand = 598 * 0.1, nCostMana = 205 }, -- level 3
	{nTherapy = 639 * 0.95, nTherapyRand = 639 * 0.1, nCostMana = 243 }, -- level 4
	{nTherapy = 680 * 0.95, nTherapyRand = 680 * 0.1, nCostMana = 282 }, -- level 5
	{nTherapy = 721 * 0.95, nTherapyRand = 721 * 0.1, nCostMana = 321 }, -- level 6
	{nTherapy = 762 * 0.95, nTherapyRand = 762 * 0.1, nCostMana = 359 }, -- level 7
	{nTherapy = 803 * 0.95, nTherapyRand = 803 * 0.1, nCostMana = 398 }, -- level 8
	{nTherapy = 844 * 0.95, nTherapyRand = 844 * 0.1, nCostMana = 398 }, -- level 9
	{nTherapy = 885 * 0.95, nTherapyRand = 885 * 0.1, nCostMana = 115 }, -- level 1
	{nTherapy = 926 * 0.95, nTherapyRand = 926 * 0.1, nCostMana = 166 }, -- level 2
	{nTherapy = 967 * 0.95, nTherapyRand = 967 * 0.1, nCostMana = 205 }, -- level 3
	{nTherapy = 1008 * 0.95, nTherapyRand = 1008 * 0.1, nCostMana = 243 }, --level 4
	{nTherapy = 1049 * 0.95, nTherapyRand = 1049 * 0.1, nCostMana = 282 }, --level 5
	{nTherapy = 1090 * 0.95, nTherapyRand = 1090 * 0.1, nCostMana = 321 }, --level 6
	{nTherapy = 1131 * 0.95, nTherapyRand = 1131 * 0.1, nCostMana = 359 }, --level 7
	{nTherapy = 1172 * 0.95, nTherapyRand = 1172 * 0.1, nCostMana = 398 }, --level 8
	{nTherapy = 1213 * 0.95, nTherapyRand = 1213 * 0.1, nCostMana = 398 }, --level 9
	{nTherapy = 1254 * 0.95, nTherapyRand = 1254 * 0.1, nCostMana = 115 }, --level 1
	{nTherapy = 1295 * 0.95, nTherapyRand = 1295 * 0.1, nCostMana = 166 }, --level 2
	{nTherapy = 1336 * 0.95, nTherapyRand = 1336 * 0.1, nCostMana = 205 }, --level 3
	{nTherapy = 1377 * 0.95, nTherapyRand = 1377 * 0.1, nCostMana = 243 }, --level 4
	{nTherapy = 1418 * 0.95, nTherapyRand = 1418 * 0.1, nCostMana = 282 }, --level 5
	{nTherapy = 1459 * 0.95, nTherapyRand = 1459 * 0.1, nCostMana = 321 }, --level 6
	{nTherapy = 1500 * 0.95, nTherapyRand = 1500 * 0.1, nCostMana = 359 }, --level 7
	{nTherapy = 1541 * 0.95, nTherapyRand = 1541 * 0.1, nCostMana = 398 }, --level 8
	{nTherapy = 1582 * 0.95, nTherapyRand = 1582 * 0.1, nCostMana = 398 }, --level 9
	{nTherapy = 1623 * 0.95, nTherapyRand = 1623 * 0.1, nCostMana = 398 }, --level 9
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[ �Ƴ�ԭ�����ļӳɵ�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_CRITICAL_STRIKE_BASE_RATE,
		2000,
		0
		);
	--]]

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy / 7,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand / 7,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(1, 592, 1);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);					--����CD1.5��
	skill.SetNormalCoolDown(1, 441);					--����CD15��

	skill.nTargetLifePercentMax = 40;			-- Ѫ�����ֵ<=
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 22 * LENGTH_BASE;					-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 48;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64 * 1.05 * 1.4;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 2) * 1.05 * 1.4
	else
		skill.nChannelInterval = 150 * 1.05 * 1.4;     -- ͨ�������ʱ��
	end
	--skill.nChannelFrame		= 48;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024

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
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com