------------------------------------------------
-- �ļ���    :  NPC_����_һ������_5.lua
-- ������    :  zhangqi		
-- ����ʱ��  :  2008-12-31
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  NPC_����_һ������_5
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 42  *0.8, nTherapyRand = 42  *0.4, nCostMana = 0},		--level 1 
	{nTherapy = 53  *0.8, nTherapyRand = 53  *0.4, nCostMana = 0},		--level 2 
	{nTherapy = 78  *0.8, nTherapyRand = 78  *0.4, nCostMana = 0},		--level 3 
	{nTherapy = 115 *0.8, nTherapyRand = 115 *0.4, nCostMana = 0},		--level 4 
	{nTherapy = 147 *0.8, nTherapyRand = 147 *0.4, nCostMana = 0},		--level 5 
	{nTherapy = 180 *0.8, nTherapyRand = 180 *0.4, nCostMana = 0},		--level 6 
	{nTherapy = 213 *0.8, nTherapyRand = 213 *0.4, nCostMana = 0},		--level 7 
	{nTherapy = 246 *0.8, nTherapyRand = 246 *0.4, nCostMana = 0},		--level 8 
	{nTherapy = 279 *0.8, nTherapyRand = 279 *0.4, nCostMana = 0},		--level 9 
	{nTherapy = 312 *0.8, nTherapyRand = 312 *0.4, nCostMana = 0},		--level 10
	{nTherapy = 345 *0.8, nTherapyRand = 345 *0.4, nCostMana = 0},		--level 11
	{nTherapy = 378 *0.8, nTherapyRand = 378 *0.4, nCostMana = 0},		--level 12
	{nTherapy = 411 *0.8, nTherapyRand = 411 *0.4, nCostMana = 0},		--level 13
	{nTherapy = 444 *0.8, nTherapyRand = 444 *0.4, nCostMana = 0},		--level 14
	{nTherapy = 477 *0.8, nTherapyRand = 477 *0.4, nCostMana = 0},		--level 15
	{nTherapy = 677 *0.8, nTherapyRand = 677 *0.4, nCostMana = 0},		--level 16
	{nTherapy = 702 *0.8, nTherapyRand = 702 *0.4, nCostMana = 0},		--level 17
	{nTherapy = 726 *0.8, nTherapyRand = 726 *0.4, nCostMana = 0},		--level 18
	{nTherapy = 750 *0.8, nTherapyRand = 750 *0.4, nCostMana = 0},		--level 19
	{nTherapy = 775 *0.8, nTherapyRand = 775 *0.4, nCostMana = 0},		--level 20
	{nTherapy = 799 *0.8, nTherapyRand = 799 *0.4, nCostMana = 0},		--level 21
	{nTherapy = 824 *0.8, nTherapyRand = 824 *0.4, nCostMana = 0},		--level 22
	{nTherapy = 848 *0.8, nTherapyRand = 848 *0.4, nCostMana = 0},		--level 23
	{nTherapy = 900 *0.8, nTherapyRand = 900 *0.4, nCostMana = 0},		--level 24
	{nTherapy = 956 *0.8, nTherapyRand = 956 *0.4, nCostMana = 0},		--level 25
	{nTherapy = 984 *0.8, nTherapyRand = 984 *0.4, nCostMana = 0},		--level 26
	{nTherapy = 1013*0.8, nTherapyRand = 1013*0.4, nCostMana = 0},		--level 27
	{nTherapy = 1042*0.8, nTherapyRand = 1042*0.4, nCostMana = 0},		--level 28
	{nTherapy = 1070*0.8, nTherapyRand = 1070*0.4, nCostMana = 0},		--level 29
	{nTherapy = 1099*0.8, nTherapyRand = 1099*0.4, nCostMana = 0},		--level 30
	{nTherapy = 1128*0.8, nTherapyRand = 1128*0.4, nCostMana = 0},		--level 31
	{nTherapy = 1156*0.8, nTherapyRand = 1156*0.4, nCostMana = 0},		--level 32
	{nTherapy = 1185*0.8, nTherapyRand = 1185*0.4, nCostMana = 0},		--level 33
	{nTherapy = 1213*0.8, nTherapyRand = 1213*0.4, nCostMana = 0},		--level 34
	{nTherapy = 1242*0.8, nTherapyRand = 1242*0.4, nCostMana = 0},		--level 35
	{nTherapy = 1271*0.8, nTherapyRand = 1271*0.4, nCostMana = 0},		--level 36
	{nTherapy = 1299*0.8, nTherapyRand = 1299*0.4, nCostMana = 0},		--level 37
	{nTherapy = 1328*0.8, nTherapyRand = 1328*0.4, nCostMana = 0},		--level 38
	{nTherapy = 1357*0.8, nTherapyRand = 1357*0.4, nCostMana = 0},		--level 39
	{nTherapy = 1385*0.8, nTherapyRand = 1385*0.4, nCostMana = 0},		--level 40
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