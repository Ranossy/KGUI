------------------------------------------------
-- ������   :  ֣����	
-- ����ʱ��	:  20110915
-- Ч����ע	:  ��������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0},		--level 1
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0},		--level 3
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0},		--level 5
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0},		--level 7
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0},		--level 9
	{nDamageBase = 945 * 0.95, nDamageRand = 945 * 0.1, nCostMana = 0},		--level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
  	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
		0,
		-1024
		);
		
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		8111, 
		1
	);	
 
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(3203, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(8111, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
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
    --skill.SetNormalCoolDown(1, 463);	--������ͨCD
    --skill.SetCheckCoolDown(1,444);	--ֻ��鲻�ߵ�CD
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
	  skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	  skill.nMaxRadius		= 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	  skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 48;				-- ����֡��
      skill.nChannelInterval	= 272*0.1 * dwSkillLevel; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 240;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	if dwSkillLevel == 1 then
    	skill.nTargetLifePercentMin	= 90;			-- Ѫ����Сֵ>=
    	skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 2 then
		skill.nTargetLifePercentMin	= 80;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 90;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 3 then
		skill.nTargetLifePercentMin	= 70;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 80;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 4 then
		skill.nTargetLifePercentMin	= 60;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 70;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 5 then
		skill.nTargetLifePercentMin	= 50;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 60;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 6 then
		skill.nTargetLifePercentMin	= 40;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 50;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 7 then
		skill.nTargetLifePercentMin	= 30;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 40;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 8 then
		skill.nTargetLifePercentMin	= 20;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 30;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 9 then
		skill.nTargetLifePercentMin	= 10;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 20;			-- Ѫ�����ֵ<=
	elseif dwSkillLevel == 10 then
		skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
		skill.nTargetLifePercentMax = 10;			-- Ѫ�����ֵ<=
	end
		
    ----------------- ����Ѫ������ ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
    ----------------- ���˴��������� -------------------------------------------------
    --skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent		= 1536 * dwSkillLevel;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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