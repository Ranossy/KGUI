------------------------------------------------
-- �ļ���    :  NPC_����_��������_2.lua
-- ������    :  zhangqi		
-- ����ʱ��  :  2008-12-31
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  NPC_����_��������_2
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 50  *0.8, nTherapyRand = 50  *0.4, nCostMana = 0},		--level 1 
	{nTherapy = 69  *0.8, nTherapyRand = 69  *0.4, nCostMana = 0},		--level 2 
	{nTherapy = 124 *0.8, nTherapyRand = 124 *0.4, nCostMana = 0},		--level 3 
	{nTherapy = 194 *0.8, nTherapyRand = 194 *0.4, nCostMana = 0},		--level 4 
	{nTherapy = 252 *0.8, nTherapyRand = 252 *0.4, nCostMana = 0},		--level 5 
	{nTherapy = 311 *0.8, nTherapyRand = 311 *0.4, nCostMana = 0},		--level 6 
	{nTherapy = 370 *0.8, nTherapyRand = 370 *0.4, nCostMana = 0},		--level 7 
	{nTherapy = 430 *0.8, nTherapyRand = 430 *0.4, nCostMana = 0},		--level 8 
	{nTherapy = 491 *0.8, nTherapyRand = 491 *0.4, nCostMana = 0},		--level 9 
	{nTherapy = 551 *0.8, nTherapyRand = 551 *0.4, nCostMana = 0},		--level 10
	{nTherapy = 610 *0.8, nTherapyRand = 610 *0.4, nCostMana = 0},		--level 11
	{nTherapy = 670 *0.8, nTherapyRand = 670 *0.4, nCostMana = 0},		--level 12
	{nTherapy = 731 *0.8, nTherapyRand = 731 *0.4, nCostMana = 0},		--level 13
	{nTherapy = 791 *0.8, nTherapyRand = 791 *0.4, nCostMana = 0},		--level 14
	{nTherapy = 851 *0.8, nTherapyRand = 851 *0.4, nCostMana = 0},		--level 15
	{nTherapy = 1265*0.8, nTherapyRand = 1265*0.4, nCostMana = 0},		--level 16
	{nTherapy = 1308*0.8, nTherapyRand = 1308*0.4, nCostMana = 0},		--level 17
	{nTherapy = 1350*0.8, nTherapyRand = 1350*0.4, nCostMana = 0},		--level 18
	{nTherapy = 1392*0.8, nTherapyRand = 1392*0.4, nCostMana = 0},		--level 19
	{nTherapy = 1434*0.8, nTherapyRand = 1434*0.4, nCostMana = 0},		--level 20
	{nTherapy = 1476*0.8, nTherapyRand = 1476*0.4, nCostMana = 0},		--level 21
	{nTherapy = 1518*0.8, nTherapyRand = 1518*0.4, nCostMana = 0},		--level 22
	{nTherapy = 1560*0.8, nTherapyRand = 1560*0.4, nCostMana = 0},		--level 23
	{nTherapy = 1654*0.8, nTherapyRand = 1654*0.4, nCostMana = 0},		--level 24
	{nTherapy = 1755*0.8, nTherapyRand = 1755*0.4, nCostMana = 0},		--level 25
	{nTherapy = 1805*0.8, nTherapyRand = 1805*0.4, nCostMana = 0},		--level 26
	{nTherapy = 1855*0.8, nTherapyRand = 1855*0.4, nCostMana = 0},		--level 27
	{nTherapy = 1905*0.8, nTherapyRand = 1905*0.4, nCostMana = 0},		--level 28
	{nTherapy = 1955*0.8, nTherapyRand = 1955*0.4, nCostMana = 0},		--level 29
	{nTherapy = 2005*0.8, nTherapyRand = 2005*0.4, nCostMana = 0},		--level 30
	{nTherapy = 2055*0.8, nTherapyRand = 2055*0.4, nCostMana = 0},		--level 31
	{nTherapy = 2105*0.8, nTherapyRand = 2105*0.4, nCostMana = 0},		--level 32
	{nTherapy = 2155*0.8, nTherapyRand = 2155*0.4, nCostMana = 0},		--level 33
	{nTherapy = 2205*0.8, nTherapyRand = 2205*0.4, nCostMana = 0},		--level 34
	{nTherapy = 2255*0.8, nTherapyRand = 2255*0.4, nCostMana = 0},		--level 35
	{nTherapy = 2305*0.8, nTherapyRand = 2305*0.4, nCostMana = 0},		--level 36
	{nTherapy = 2355*0.8, nTherapyRand = 2355*0.4, nCostMana = 0},		--level 37
	{nTherapy = 2405*0.8, nTherapyRand = 2405*0.4, nCostMana = 0},		--level 38
	{nTherapy = 2455*0.8, nTherapyRand = 2455*0.4, nCostMana = 0},		--level 39
	{nTherapy = 2505*0.8, nTherapyRand = 2505*0.4, nCostMana = 0},		--level 40
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
    skill.nPrepareFrames  	= 32;				-- ����֡��
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
  skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
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