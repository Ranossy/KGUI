---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�����/���/�����������ͨ��.lua
-- ����ʱ��:	2015/8/31 15:33:54
-- �����û�:	mantong2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 9577, nDamageRand = 1, nCostMana = 0}, --level 1--��¶��
	{nDamageBase = 9578, nDamageRand = 1, nCostMana = 0}, --level 2--������
	{nDamageBase = 9579, nDamageRand = 1, nCostMana = 0}, --level 3--���̥
	{nDamageBase = 9580, nDamageRand = 1, nCostMana = 0}, --level 4--������
	{nDamageBase = 9581, nDamageRand = 1, nCostMana = 0}, --level 5--С����
	{nDamageBase = 9582, nDamageRand = 1, nCostMana = 0}, --level 6--������
	{nDamageBase = 9583, nDamageRand = 1, nCostMana = 0}, --level 7--���޶�
	{nDamageBase = 9592, nDamageRand = 1, nCostMana = 0}, --level 8--�������б�
	{nDamageBase = 9593, nDamageRand = 1, nCostMana = 0}, --level 9--�˷���ʳ��
	{nDamageBase = 9594, nDamageRand = 1, nCostMana = 0}, --level 10--ͬ��������
	{nDamageBase = 9623, nDamageRand = 1, nCostMana = 0}, --level 11--������
	{nDamageBase = 9624, nDamageRand = 1, nCostMana = 0}, --level 12--������
	{nDamageBase = 9595, nDamageRand = 1, nCostMana = 0}, --level 13--����յ�ڶ�
	{nDamageBase = 9596, nDamageRand = 1, nCostMana = 0}, --level 14--����������
	{nDamageBase = 9597, nDamageRand = 1, nCostMana = 0}, --level 15--������ĸ��
	{nDamageBase = 9598, nDamageRand = 1, nCostMana = 0}, --level 16--ͨ����ţ��
	{nDamageBase = 9599, nDamageRand = 1, nCostMana = 0}, --level 17--�����»���
	{nDamageBase = 9600, nDamageRand = 1, nCostMana = 0}, --level 18--�컨����
	{nDamageBase = 9577, nDamageRand = 2, nCostMana = 0}, --level 19--�ѡ���¶��
	{nDamageBase = 9578, nDamageRand = 2, nCostMana = 0}, --level 20--�ѡ�������
	{nDamageBase = 9579, nDamageRand = 2, nCostMana = 0}, --level 21--�ѡ����̥
	{nDamageBase = 9580, nDamageRand = 2, nCostMana = 0}, --level 22--�ѡ�������
	{nDamageBase = 9581, nDamageRand = 2, nCostMana = 0}, --level 23--�ѡ�С����
	{nDamageBase = 9582, nDamageRand = 2, nCostMana = 0}, --level 24--�ѡ�������
	{nDamageBase = 9583, nDamageRand = 2, nCostMana = 0}, --level 25--�ѡ����޶�
	{nDamageBase = 9592, nDamageRand = 2, nCostMana = 0}, --level 26--�ѡ��������б�
	{nDamageBase = 9593, nDamageRand = 2, nCostMana = 0}, --level 27--�ѡ��˷���ʳ��
	{nDamageBase = 9594, nDamageRand = 2, nCostMana = 0}, --level 28--�ѡ�ͬ��������
	{nDamageBase = 9623, nDamageRand = 2, nCostMana = 0}, --level 29--�ѡ�������
	{nDamageBase = 9624, nDamageRand = 2, nCostMana = 0}, --level 30--�ѡ�������
	{nDamageBase = 9595, nDamageRand = 2, nCostMana = 0}, --level 31--�ѡ�����յ�ڶ�
	{nDamageBase = 9596, nDamageRand = 2, nCostMana = 0}, --level 32--�ѡ�����������
	{nDamageBase = 9597, nDamageRand = 2, nCostMana = 0}, --level 33--�ѡ�������ĸ��
	{nDamageBase = 9598, nDamageRand = 2, nCostMana = 0}, --level 34--�ѡ�ͨ����ţ��
	{nDamageBase = 9599, nDamageRand = 2, nCostMana = 0}, --level 35--�ѡ������»���
	{nDamageBase = 9600, nDamageRand = 2, nCostMana = 0}, --level 36--�ѡ��컨����
	{nDamageBase = 9791, nDamageRand = 1, nCostMana = 0}, --level 37--��ʤū
	{nDamageBase = 9792, nDamageRand = 1, nCostMana = 0}, --level 38--������
	{nDamageBase = 9793, nDamageRand = 1, nCostMana = 0}, --level 39--ˮ����
	{nDamageBase = 9794, nDamageRand = 1, nCostMana = 0}, --level 40--������
	{nDamageBase = 9791, nDamageRand = 2, nCostMana = 0}, --level 41--�ѡ���ʤū
	{nDamageBase = 9792, nDamageRand = 2, nCostMana = 0}, --level 42--�ѡ�������
	{nDamageBase = 9793, nDamageRand = 2, nCostMana = 0}, --level 43--�ѡ�ˮ����
	{nDamageBase = 9794, nDamageRand = 2, nCostMana = 0}, --level 44--�ѡ�������
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		tSkillData[dwSkillLevel].nDamageBase,
		tSkillData[dwSkillLevel].nDamageRand
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
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
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	--skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = PRE_FRAMES;			-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com