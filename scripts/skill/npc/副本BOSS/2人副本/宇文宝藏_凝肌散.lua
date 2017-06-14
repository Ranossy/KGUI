------------------------------------------------
-- �ļ���    :  ���ı���_����ɢ.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-04-06
-- ��;(ģ��):  ����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  �Թ�¡�Ķ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 29 * 0.8, nDamageRand = 29 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 39 * 0.8, nDamageRand = 39 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 67 * 0.8, nDamageRand = 67 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 96 * 0.8, nDamageRand = 96 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 140 * 0.8, nDamageRand = 140 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 183 * 0.8, nDamageRand = 183 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 252 * 0.8, nDamageRand = 252 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 301 * 0.8, nDamageRand = 301 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 349 * 0.8, nDamageRand = 349 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 398 * 0.8, nDamageRand = 398 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 446 * 0.8, nDamageRand = 446 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 495 * 0.8, nDamageRand = 495 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 543 * 0.8, nDamageRand = 543 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 591 * 0.8, nDamageRand = 591 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 640 * 0.8, nDamageRand = 640 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 714 * 0.8, nDamageRand = 714 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 731 * 0.8, nDamageRand = 731 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 747 * 0.8, nDamageRand = 747 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 763 * 0.8, nDamageRand = 763 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 779 * 0.8, nDamageRand = 779 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 795 * 0.8, nDamageRand = 795 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 811 * 0.8, nDamageRand = 811 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 828 * 0.8, nDamageRand = 828 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 844 * 0.8, nDamageRand = 844 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 860 * 0.8, nDamageRand = 860 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 876 * 0.8, nDamageRand = 876 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 892 * 0.8, nDamageRand = 892 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 909 * 0.8, nDamageRand = 909 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 925 * 0.8, nDamageRand = 925 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 941 * 0.8, nDamageRand = 941 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 957 * 0.8, nDamageRand = 957 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
			tSkillData[dwSkillLevel].nDamageBase * 0.14, 
			0
			);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
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
    
	----------------- BUFF��� -------------------------------------------------
		skill.BindBuff(1, 1783, 1);		-- ����1��λBuff
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
		skill.nMinRadius		= 8 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 25 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
		--skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
		--skill.nTargetCountLimit	= 25;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 16;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		  = 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
    --skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
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