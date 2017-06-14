------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2010-11-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80/6*0.95*1.1, 	nDamageRand = 80/6*0.1*1.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 88/6*0.95*1.1, 	nDamageRand = 88/6*0.1*1.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 96/6*0.95*1.1, 	nDamageRand = 96/6*0.1*1.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 104/6*0.95*1.1, 	nDamageRand = 104/6*0.1*1.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 112/6*0.95*1.1, 	nDamageRand = 112/6*0.1*1.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120/6*0.95*1.1, 	nDamageRand = 120/6*0.1*1.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 128/6*0.95*1.1, 	nDamageRand = 128/6*0.1*1.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 136/6*0.95*1.1, 	nDamageRand = 136/6*0.1*1.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 144/6*0.95*1.1, 	nDamageRand = 144/6*0.1*1.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 152/6*0.95*1.1, 	nDamageRand = 152/6*0.1*1.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160/6*0.95*1.1, 	nDamageRand = 160/6*0.1*1.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 168/6*0.95*1.1, 	nDamageRand = 168/6*0.1*1.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 176/6*0.95*1.1, 	nDamageRand = 176/6*0.1*1.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 184/6*0.95*1.1, 	nDamageRand = 184/6*0.1*1.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 192/6*0.95*1.1, 	nDamageRand = 192/6*0.1*1.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 200/6*0.95*1.1, 	nDamageRand = 200/6*0.1*1.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 208/6*0.95*1.1, 	nDamageRand = 208/6*0.1*1.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 216/6*0.95*1.1, 	nDamageRand = 216/6*0.1*1.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 224/6*0.95*1.1, 	nDamageRand = 224/6*0.1*1.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 232/6*0.95*1.1, 	nDamageRand = 232/6*0.1*1.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 240/6*0.95*1.1, 	nDamageRand = 240/6*0.1*1.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 248/6*0.95*1.1, 	nDamageRand = 248/6*0.1*1.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 256/6*0.95*1.1, 	nDamageRand = 256/6*0.1*1.1, }, -- Level 23
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
		0, 
		0
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(2307, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL) -- ����Ŀ���ж�����
    
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
	skill.nMaxRadius		= 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- ����֡��
    --skill.nChannelInterval	= 16; 				-- ͨ�������ʱ�� 
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