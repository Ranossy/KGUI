------------------------------------------------
-- �ļ���    :  Ӣ������Ͽ_3��BOSS_������_���Ͻ�.lua
-- ������    :  CBG	
-- ����ʱ��  :  2009-10-26
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ��֪����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 969 * 0.8, nDamageRand = 969 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1333 * 0.8, nDamageRand = 1333 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1589 * 0.8, nDamageRand = 1589 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1846 * 0.8, nDamageRand = 1846 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 2102 * 0.8, nDamageRand = 2102 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2358 * 0.8, nDamageRand = 2358 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 2615 * 0.8, nDamageRand = 2615 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 2871 * 0.8, nDamageRand = 2871 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 3128 * 0.8, nDamageRand = 3128 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 3384 * 0.8, nDamageRand = 3384 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 3777 * 0.8, nDamageRand = 3777 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3863 * 0.8, nDamageRand = 3863 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3949 * 0.8, nDamageRand = 3949 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 4034 * 0.8, nDamageRand = 4034 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 4120 * 0.8, nDamageRand = 4120 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 4205 * 0.8, nDamageRand = 4205 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 4291 * 0.8, nDamageRand = 4291 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 4376 * 0.8, nDamageRand = 4376 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 4462 * 0.8, nDamageRand = 4462 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 4547 * 0.8, nDamageRand = 4547 * 0.4, nCostMana = 0},		--level 25

};  
    
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
    
    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------

  	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0, 
		0
	);                                                                     

	    ----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(1400, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);-- ����Ŀ��Buff
    
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
	skill.nMaxRadius		= 25 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
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