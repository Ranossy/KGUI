---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/����/����������������Ч��.lua
-- ����ʱ��:	2014/7/2 9:15:32
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_̫�ؾ���_����.lua
-- ������    :  ���
-- ����ʱ��  :  2008-08-20
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :
-- �书��·  :  ̫�ؾ���
-- ��������  :  ����
-- ����Ч��  :  ֱ��������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 207, nTherapyRand = 21, nCostMana = 65},
	{ nTherapyBase = 226, nTherapyRand = 23, nCostMana = 92},
	{ nTherapyBase = 245, nTherapyRand = 25, nCostMana = 112},
	{ nTherapyBase = 264, nTherapyRand = 26, nCostMana = 132},
	{ nTherapyBase = 283, nTherapyRand = 28, nCostMana = 152},
	{ nTherapyBase = 302, nTherapyRand = 30, nCostMana = 172},
	{ nTherapyBase = 321, nTherapyRand = 32, nCostMana = 192},
	{ nTherapyBase = 340, nTherapyRand = 34, nCostMana = 211},
	{ nTherapyBase = 359, nTherapyRand = 36, nCostMana = 211},
	{ nTherapyBase = 378, nTherapyRand = 38, nCostMana = 65},
	{ nTherapyBase = 397, nTherapyRand = 40, nCostMana = 92},
	{ nTherapyBase = 416, nTherapyRand = 42, nCostMana = 112},
	{ nTherapyBase = 435, nTherapyRand = 44, nCostMana = 132},
	{ nTherapyBase = 454, nTherapyRand = 45, nCostMana = 152},
	{ nTherapyBase = 473, nTherapyRand = 47, nCostMana = 172},
	{ nTherapyBase = 492, nTherapyRand = 49, nCostMana = 192},
	{ nTherapyBase = 511, nTherapyRand = 51, nCostMana = 211},
	{ nTherapyBase = 530, nTherapyRand = 53, nCostMana = 211},
	{ nTherapyBase = 549, nTherapyRand = 55, nCostMana = 65},
	{ nTherapyBase = 568, nTherapyRand = 57, nCostMana = 92},
	{ nTherapyBase = 587, nTherapyRand = 59, nCostMana = 112},
	{ nTherapyBase = 606, nTherapyRand = 61, nCostMana = 132},
	{ nTherapyBase = 625, nTherapyRand = 63, nCostMana = 152},
	{ nTherapyBase = 644, nTherapyRand = 64, nCostMana = 172},
	{ nTherapyBase = 663, nTherapyRand = 66, nCostMana = 192},
	{ nTherapyBase = 682, nTherapyRand = 68, nCostMana = 211},
	{ nTherapyBase = 701, nTherapyRand = 70, nCostMana = 211},
	{ nTherapyBase = 720, nTherapyRand = 72, nCostMana = 211},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- ħ������
		tSkillData[dwSkillLevel].nTherapyBase/3, --����ֵ1
		0							--����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- ħ������
		tSkillData[dwSkillLevel].nTherapyRand/3, --����ֵ1
		0							--����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_THERAPY, -- ħ������
		0, --����ֵ1
		0							--����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(1, 592, 1);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 617);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	-- skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	--skill.nCostManaBasePercent = 393;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 40;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64*0.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 4)*0.2
	else
		skill.nChannelInterval = 143*0.2;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval = 143; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
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