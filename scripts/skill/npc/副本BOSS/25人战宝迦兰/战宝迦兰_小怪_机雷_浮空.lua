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
	{nDamageBase = 316 * 0.8, nDamageRand = 316 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 433 * 0.8, nDamageRand = 433 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 734 * 0.8, nDamageRand = 734 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1053 * 0.8, nDamageRand = 1053 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1532 * 0.8, nDamageRand = 1532 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2011 * 0.8, nDamageRand = 2011 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2766 * 0.8, nDamageRand = 2766 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3299 * 0.8, nDamageRand = 3299 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3831 * 0.8, nDamageRand = 3831 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 4363 * 0.8, nDamageRand = 4363 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 4895 * 0.8, nDamageRand = 4895 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 5428 * 0.8, nDamageRand = 5428 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 5960 * 0.8, nDamageRand = 5960 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 6492 * 0.8, nDamageRand = 6492 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 4000 * 0.8, nDamageRand = 4000 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 7841 * 0.8, nDamageRand = 7841 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 8019 * 0.8, nDamageRand = 8019 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 8196 * 0.8, nDamageRand = 8196 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 8374 * 0.8, nDamageRand = 8374 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 8551 * 0.8, nDamageRand = 8551 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 8729 * 0.8, nDamageRand = 8729 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 8906 * 0.8, nDamageRand = 8906 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 9084 * 0.8, nDamageRand = 9084 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 9262 * 0.8, nDamageRand = 9262 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 9439 * 0.8, nDamageRand = 9439 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 9617 * 0.8, nDamageRand = 9617 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 9794 * 0.8, nDamageRand = 9794 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 9972 * 0.8, nDamageRand = 9972 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 10149 * 0.8, nDamageRand = 10149 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 6000 * 0.8, nDamageRand = 6000 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 10504 * 0.8, nDamageRand = 10504 * 0.4, nCostMana = 0},		--level 31
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    skill.BindBuff(1, 2132, 2);		-- ����1��λBuff
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	--skill.nMaxRadius		= 6 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 80;				-- ����֡��
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