------------------------------------------------
-- �ļ���    :  ݶ����_BOSS1����_��Ӱ�Ứ.lua
-- ������    : CBG
-- ����ʱ��  :  2009-11-26
-- ��;(ģ��):  
-- �书����  :  ݶ����
-- �书����  : 
-- �书��·  :  
-- ��������  :  ������֬����
-- ����Ч��  :  ������֬���ᱣ��ϸ��Ĥ����������ԣ��Ա���ϸ�������������ܡ� 

------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 230 * 0.8, nDamageRand = 230 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 314 * 0.8, nDamageRand = 314 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 533 * 0.8, nDamageRand = 533 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 764 * 0.8, nDamageRand = 764 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1112 * 0.8, nDamageRand = 1112 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1460 * 0.8, nDamageRand = 1460 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2009 * 0.8, nDamageRand = 2009 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 2395 * 0.8, nDamageRand = 2395 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 2781 * 0.8, nDamageRand = 2781 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 3168 * 0.8, nDamageRand = 3168 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 3554 * 0.8, nDamageRand = 3554 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 3941 * 0.8, nDamageRand = 3941 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 4327 * 0.8, nDamageRand = 4327 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 4713 * 0.8, nDamageRand = 4713 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 5100 * 0.8, nDamageRand = 5100 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 5693 * 0.8, nDamageRand = 5693 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 5822 * 0.8, nDamageRand = 5822 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 5951 * 0.8, nDamageRand = 5951 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 6080 * 0.8, nDamageRand = 6080 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 6209 * 0.8, nDamageRand = 6209 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 6338 * 0.8, nDamageRand = 6338 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 6466 * 0.8, nDamageRand = 6466 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 6595 * 0.8, nDamageRand = 6595 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 6724 * 0.8, nDamageRand = 6724 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 6853 * 0.8, nDamageRand = 6853 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 6982 * 0.8, nDamageRand = 6982 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 7111 * 0.8, nDamageRand = 7111 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 7240 * 0.8, nDamageRand = 7240 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 7369 * 0.8, nDamageRand = 7369 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 7498 * 0.8, nDamageRand = 7498 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 7627 * 0.8, nDamageRand = 7627 * 0.4, nCostMana = 0},		--level 31
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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 50 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 50 * LENGTH_BASE;		-- �������ð뾶 
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