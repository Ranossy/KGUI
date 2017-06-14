------------------------------------------------
-- �ļ���    :  NPC_�˺�_����_��������_2.lua
-- ������    :  zhangqi		
-- ����ʱ��  :  2008-12-31
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  NPC_�˺�_����_��������_2
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 74  *0.8, nDamageRand = 74  *0.4, nCostMana = 0},		--level 1 
	{nDamageBase = 105 *0.8, nDamageRand = 105 *0.4, nCostMana = 0},		--level 2 
	{nDamageBase = 138 *0.8, nDamageRand = 138 *0.4, nCostMana = 0},		--level 3 
	{nDamageBase = 194 *0.8, nDamageRand = 194 *0.4, nCostMana = 0},		--level 4 
	{nDamageBase = 250 *0.8, nDamageRand = 250 *0.4, nCostMana = 0},		--level 5 
	{nDamageBase = 329 *0.8, nDamageRand = 329 *0.4, nCostMana = 0},		--level 6 
	{nDamageBase = 390 *0.8, nDamageRand = 390 *0.4, nCostMana = 0},		--level 7 
	{nDamageBase = 450 *0.8, nDamageRand = 450 *0.4, nCostMana = 0},		--level 8 
	{nDamageBase = 511 *0.8, nDamageRand = 511 *0.4, nCostMana = 0},		--level 9 
	{nDamageBase = 571 *0.8, nDamageRand = 571 *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 632 *0.8, nDamageRand = 632 *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 692 *0.8, nDamageRand = 692 *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 753 *0.8, nDamageRand = 753 *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 813 *0.8, nDamageRand = 813 *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 878 *0.8, nDamageRand = 878 *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 1265*0.8, nDamageRand = 1265*0.4, nCostMana = 0},		--level 16
	{nDamageBase = 1308*0.8, nDamageRand = 1308*0.4, nCostMana = 0},		--level 17
	{nDamageBase = 1350*0.8, nDamageRand = 1350*0.4, nCostMana = 0},		--level 18
	{nDamageBase = 1392*0.8, nDamageRand = 1392*0.4, nCostMana = 0},		--level 19
	{nDamageBase = 1434*0.8, nDamageRand = 1434*0.4, nCostMana = 0},		--level 20
	{nDamageBase = 1476*0.8, nDamageRand = 1476*0.4, nCostMana = 0},		--level 21
	{nDamageBase = 1518*0.8, nDamageRand = 1518*0.4, nCostMana = 0},		--level 22
	{nDamageBase = 1560*0.8, nDamageRand = 1560*0.4, nCostMana = 0},		--level 23
	{nDamageBase = 1654*0.8, nDamageRand = 1654*0.4, nCostMana = 0},		--level 24
	{nDamageBase = 1755*0.8, nDamageRand = 1755*0.4, nCostMana = 0},		--level 25
	{nDamageBase = 1805*0.8, nDamageRand = 1805*0.4, nCostMana = 0},		--level 26
	{nDamageBase = 1855*0.8, nDamageRand = 1855*0.4, nCostMana = 0},		--level 27
	{nDamageBase = 1905*0.8, nDamageRand = 1905*0.4, nCostMana = 0},		--level 28
	{nDamageBase = 1955*0.8, nDamageRand = 1955*0.4, nCostMana = 0},		--level 29
	{nDamageBase = 2005*0.8, nDamageRand = 2005*0.4, nCostMana = 0},		--level 30
	{nDamageBase = 2055*0.8, nDamageRand = 2055*0.4, nCostMana = 0},		--level 31
	{nDamageBase = 2105*0.8, nDamageRand = 2105*0.4, nCostMana = 0},		--level 32
	{nDamageBase = 2155*0.8, nDamageRand = 2155*0.4, nCostMana = 0},		--level 33
	{nDamageBase = 2205*0.8, nDamageRand = 2205*0.4, nCostMana = 0},		--level 34
	{nDamageBase = 2255*0.8, nDamageRand = 2255*0.4, nCostMana = 0},		--level 35
	{nDamageBase = 2305*0.8, nDamageRand = 2305*0.4, nCostMana = 0},		--level 36
	{nDamageBase = 2355*0.8, nDamageRand = 2355*0.4, nCostMana = 0},		--level 37
	{nDamageBase = 2405*0.8, nDamageRand = 2405*0.4, nCostMana = 0},		--level 38
	{nDamageBase = 2455*0.8, nDamageRand = 2455*0.4, nCostMana = 0},		--level 39
	{nDamageBase = 2505*0.8, nDamageRand = 2505*0.4, nCostMana = 0},		--level 40
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/2, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
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
	skill.nMaxRadius		= 3 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

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