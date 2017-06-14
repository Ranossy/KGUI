------------------------------------------------
-- �ļ���    :  NPC_����_һ������_2.lua
-- ������    :  zhangqi		
-- ����ʱ��  :  2008-12-31
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  NPC_����_һ������_2
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 13  *0.8, nTherapyRand = 13  *0.4, nCostMana = 0},		--level 1 
	{nTherapy = 26  *0.8, nTherapyRand = 26  *0.4, nCostMana = 0},		--level 2 
	{nTherapy = 76  *0.8, nTherapyRand = 76  *0.4, nCostMana = 0},		--level 3 
	{nTherapy = 131 *0.8, nTherapyRand = 131 *0.4, nCostMana = 0},		--level 4 
	{nTherapy = 174 *0.8, nTherapyRand = 174 *0.4, nCostMana = 0},		--level 5 
	{nTherapy = 218 *0.8, nTherapyRand = 218 *0.4, nCostMana = 0},		--level 6 
	{nTherapy = 262 *0.8, nTherapyRand = 262 *0.4, nCostMana = 0},		--level 7 
	{nTherapy = 307 *0.8, nTherapyRand = 307 *0.4, nCostMana = 0},		--level 8 
	{nTherapy = 353 *0.8, nTherapyRand = 353 *0.4, nCostMana = 0},		--level 9 
	{nTherapy = 398 *0.8, nTherapyRand = 398 *0.4, nCostMana = 0},		--level 10
	{nTherapy = 442 *0.8, nTherapyRand = 442 *0.4, nCostMana = 0},		--level 11
	{nTherapy = 487 *0.8, nTherapyRand = 487 *0.4, nCostMana = 0},		--level 12
	{nTherapy = 533 *0.8, nTherapyRand = 533 *0.4, nCostMana = 0},		--level 13
	{nTherapy = 578 *0.8, nTherapyRand = 578 *0.4, nCostMana = 0},		--level 14
	{nTherapy = 623 *0.8, nTherapyRand = 623 *0.4, nCostMana = 0},		--level 15
	{nTherapy = 981 *0.8, nTherapyRand = 981 *0.4, nCostMana = 0},		--level 16
	{nTherapy = 1010*0.8, nTherapyRand = 1010*0.4, nCostMana = 0},		--level 17
	{nTherapy = 1039*0.8, nTherapyRand = 1039*0.4, nCostMana = 0},		--level 18
	{nTherapy = 1069*0.8, nTherapyRand = 1069*0.4, nCostMana = 0},		--level 19
	{nTherapy = 1098*0.8, nTherapyRand = 1098*0.4, nCostMana = 0},		--level 20
	{nTherapy = 1127*0.8, nTherapyRand = 1127*0.4, nCostMana = 0},		--level 21
	{nTherapy = 1157*0.8, nTherapyRand = 1157*0.4, nCostMana = 0},		--level 22
	{nTherapy = 1186*0.8, nTherapyRand = 1186*0.4, nCostMana = 0},		--level 23
	{nTherapy = 1256*0.8, nTherapyRand = 1256*0.4, nCostMana = 0},		--level 24
	{nTherapy = 1332*0.8, nTherapyRand = 1332*0.4, nCostMana = 0},		--level 25
	{nTherapy = 1368*0.8, nTherapyRand = 1368*0.4, nCostMana = 0},		--level 26
	{nTherapy = 1403*0.8, nTherapyRand = 1403*0.4, nCostMana = 0},		--level 27
	{nTherapy = 1439*0.8, nTherapyRand = 1439*0.4, nCostMana = 0},		--level 28
	{nTherapy = 1474*0.8, nTherapyRand = 1474*0.4, nCostMana = 0},		--level 29
	{nTherapy = 1510*0.8, nTherapyRand = 1510*0.4, nCostMana = 0},		--level 30
	{nTherapy = 1546*0.8, nTherapyRand = 1546*0.4, nCostMana = 0},		--level 31
	{nTherapy = 1581*0.8, nTherapyRand = 1581*0.4, nCostMana = 0},		--level 32
	{nTherapy = 1617*0.8, nTherapyRand = 1617*0.4, nCostMana = 0},		--level 33
	{nTherapy = 1652*0.8, nTherapyRand = 1652*0.4, nCostMana = 0},		--level 34
	{nTherapy = 1688*0.8, nTherapyRand = 1688*0.4, nCostMana = 0},		--level 35
	{nTherapy = 1723*0.8, nTherapyRand = 1723*0.4, nCostMana = 0},		--level 36
	{nTherapy = 1759*0.8, nTherapyRand = 1759*0.4, nCostMana = 0},		--level 37
	{nTherapy = 1795*0.8, nTherapyRand = 1795*0.4, nCostMana = 0},		--level 38
	{nTherapy = 1830*0.8, nTherapyRand = 1830*0.4, nCostMana = 0},		--level 39
	{nTherapy = 1866*0.8, nTherapyRand = 1866*0.4, nCostMana = 0},		--level 40
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
	);

	
   	----------------- ħ������ -------------------------------------------------

--   	skill.AddAttribute(
--   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
--   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
--   		nAttributeValue1,											-- ����ֵ1
--   		nAttributeValue2											-- ����ֵ2
--   		);

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetCoolDown(1, 16);						-- ����CD 1.5��
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

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
	--skill.nMaxRadius		= 3 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
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
    --skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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