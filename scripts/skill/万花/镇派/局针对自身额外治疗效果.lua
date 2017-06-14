---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/����/����������������Ч��.lua
-- ����ʱ��:	2014/7/2 9:09:53
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 103, nTherapyRand = 10, nCostMana = 21 * 1.2},
	{ nTherapyBase = 116, nTherapyRand = 12, nCostMana = 33 * 1.2},
	{ nTherapyBase = 128, nTherapyRand = 13, nCostMana = 50 * 1.2},
	{ nTherapyBase = 141, nTherapyRand = 14, nCostMana = 64 * 1.2},
	{ nTherapyBase = 153, nTherapyRand = 15, nCostMana = 77 * 1.2},
	{ nTherapyBase = 166, nTherapyRand = 17, nCostMana = 91 * 1.2},
	{ nTherapyBase = 178, nTherapyRand = 18, nCostMana = 104 * 1.2},
	{ nTherapyBase = 191, nTherapyRand = 19, nCostMana = 104 * 1.2},
	{ nTherapyBase = 203, nTherapyRand = 20, nCostMana = 104 * 1.2},
	{ nTherapyBase = 216, nTherapyRand = 22, nCostMana = 21 * 1.2},
	{ nTherapyBase = 228, nTherapyRand = 23, nCostMana = 33 * 1.2},
	{ nTherapyBase = 241, nTherapyRand = 24, nCostMana = 50 * 1.2},
	{ nTherapyBase = 253, nTherapyRand = 25, nCostMana = 64 * 1.2},
	{ nTherapyBase = 266, nTherapyRand = 27, nCostMana = 77 * 1.2},
	{ nTherapyBase = 278, nTherapyRand = 28, nCostMana = 91 * 1.2},
	{ nTherapyBase = 291, nTherapyRand = 29, nCostMana = 104 * 1.2},
	{ nTherapyBase = 303, nTherapyRand = 30, nCostMana = 104 * 1.2},
	{ nTherapyBase = 316, nTherapyRand = 32, nCostMana = 104 * 1.2},
	{ nTherapyBase = 328, nTherapyRand = 33, nCostMana = 21 * 1.2},
	{ nTherapyBase = 341, nTherapyRand = 34, nCostMana = 33 * 1.2},
	{ nTherapyBase = 353, nTherapyRand = 35, nCostMana = 50 * 1.2},
	{ nTherapyBase = 366, nTherapyRand = 37, nCostMana = 64 * 1.2},
	{ nTherapyBase = 378, nTherapyRand = 38, nCostMana = 77 * 1.2},
	{ nTherapyBase = 391, nTherapyRand = 39, nCostMana = 91 * 1.2},
	{ nTherapyBase = 403, nTherapyRand = 40, nCostMana = 104 * 1.2},
	{ nTherapyBase = 416, nTherapyRand = 42, nCostMana = 104 * 1.2},
	{ nTherapyBase = 428, nTherapyRand = 43, nCostMana = 104 * 1.2},
	{ nTherapyBase = 441, nTherapyRand = 44, nCostMana = 104 * 1.2},
	{ nTherapyBase = 453, nTherapyRand = 45, nCostMana = 104 * 1.2},
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
	{ nReducePercent = 0},
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- ħ������
		tSkillData[dwSkillLevel].nTherapyBase * (1 - tPit[dwSkillLevel].nReducePercent)/3, --����ֵ1
		0																--����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- ħ������
		tSkillData[dwSkillLevel].nTherapyRand * (1 - tPit[dwSkillLevel].nReducePercent)/3, --����ֵ1
		0																--����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_THERAPY, -- ħ������
		0, --����ֵ1
		0																--����ֵ2
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
	--skill.nCostManaBasePercent = 308;	-- �������ĵ�����
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
	--skill.nPrepareFrames = 24;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48*0.2;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 1)*0.2
	else
		skill.nChannelInterval = 80*0.2;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval = 72; 				-- ͨ�������ʱ��
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
function Apply(dwCharacterID, dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com