---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Default.lua
-- ����ʱ��:	2013/9/9 16:05:17
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 1000, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 1.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 1.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 1.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 1.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 2.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 2.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 2.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 2.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 3, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 3.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 3.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 3.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 3.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 4.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 4.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 4.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 4.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 5, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 5.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 5.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 5.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 5.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 6.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 7, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 7.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 7.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 7.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 7.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 8.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 8.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 8.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 8.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 9, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 9.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 9.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 9.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 9.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 10, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 10.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 10.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 10.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 10.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 11, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 11.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 11.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 11.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 11.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 12, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 12.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 12.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 12.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 12.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 13, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 13.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 13.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 13.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 13.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 14, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 14.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 14.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 14.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 14.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 15, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 15.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 15.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 15.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 15.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 16, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 16.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 16.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 16.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 16.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 17, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 17.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 17.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 17.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 17.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 18, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 18.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 18.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 18.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 18.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 19, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 19.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 19.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 19.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 19.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 20, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 20.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 20.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 20.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 20.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 21, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 21.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 21.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 21.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 21.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 22, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 22.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 22.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 22.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 22.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 23, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 23.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 23.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 23.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 23.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 24, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 24.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 24.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 24.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 24.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 25, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 25.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 25.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 25.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 25.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 26, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 26.2, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 26.4, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 26.6, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 26.8, nDamageRand = 0, nCostMana = 0},
	{nDamageBase = 1000 * 27, nDamageRand = 0, nCostMana = 0},
	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
   		nAttributeValue1,											-- ����ֵ1
   		nAttributeValue2											-- ����ֵ2
   		);
    --]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	skill.AddSlowCheckDestOwnBuff(8473, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff   --��ǽ״̬�±��buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ
	
	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�
	
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
	
	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	
	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------

	skill.nChannelInterval = 16;     -- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
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
	skill.nWeaponDamagePercent = 1024;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID,dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com