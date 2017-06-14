------------------------------------------------
-- ������   :  �ź�		
-- ����ʱ��	:  2010-10-1
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 38800*0.8, nDamageRand = 38800*0.4, nCostMana = 0},		--level 1
	{nDamageBase = 19400*0.8, nDamageRand = 19400*0.4, nCostMana = 0},		--level 2
	{nDamageBase = 12933*0.8, nDamageRand = 12933*0.4, nCostMana = 0},		--level 3
	{nDamageBase = 9700*0.8, nDamageRand = 9700*0.4, nCostMana = 0},		--level 4
	{nDamageBase = 7760*0.8, nDamageRand = 7760*0.4, nCostMana = 0},		--level 5
	{nDamageBase = 6466*0.8, nDamageRand = 6466*0.4, nCostMana = 0},		--level 6
	{nDamageBase = 5542*0.8, nDamageRand = 5542*0.4, nCostMana = 0},		--level 7
	{nDamageBase = 4850*0.8, nDamageRand = 4850*0.4, nCostMana = 0},		--level 8
	{nDamageBase = 4311*0.8, nDamageRand = 4311*0.4, nCostMana = 0},		--level 9
	{nDamageBase = 3880*0.8, nDamageRand = 3880*0.4, nCostMana = 0},		--level 10
	{nDamageBase = 5872*0.8, nDamageRand = 5872*0.4, nCostMana = 0},		--level 11
	{nDamageBase = 5383*0.8, nDamageRand = 5383*0.4, nCostMana = 0},		--level 12
	{nDamageBase = 4969*0.8, nDamageRand = 4969*0.4, nCostMana = 0},		--level 13
	{nDamageBase = 4614*0.8, nDamageRand = 4614*0.4, nCostMana = 0},		--level 14
	{nDamageBase = 4306*0.8, nDamageRand = 4306*0.4, nCostMana = 0},		--level 15
	{nDamageBase = 4037*0.8, nDamageRand = 4037*0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3800*0.8, nDamageRand = 3800*0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3588*0.8, nDamageRand = 3588*0.4, nCostMana = 0},		--level 18
	{nDamageBase = 3400*0.8, nDamageRand = 3400*0.4, nCostMana = 0},		--level 19
	{nDamageBase = 3230*0.8, nDamageRand = 3230*0.4, nCostMana = 0},		--level 20
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 21
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 22
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 24
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 25
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 26
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 27
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 28
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 29
	{nDamageBase = 3200*0.8, nDamageRand = 3200*0.4, nCostMana = 0},		--level 30
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,			
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,							
   		tSkillData[dwSkillLevel].nDamageBase * 0.14,							
   		0																
   		);
    
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,						
   		tSkillData[dwSkillLevel].nDamageRand * 0.14,						
   		0																
   		);
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			
   		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,								
   		0,																
   		0															
   		);

   
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    skill.AddSlowCheckDestBuff(2233,1,BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

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
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶 
  skill.nTargetCountLimit	= 25;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
    --skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
    ----------------- ���˴��������� -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
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