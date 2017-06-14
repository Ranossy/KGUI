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
	{nAddRage = 0, nCostRage = 10, nDamageBase = 101*0.95, 	nDamageRand = 101*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120*0.95, 	nDamageRand = 120*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139*0.95, 	nDamageRand = 139*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 158*0.95, 	nDamageRand = 158*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 177*0.95, 	nDamageRand = 177*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 196*0.95, 	nDamageRand = 196*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 215*0.95, 	nDamageRand = 215*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 234*0.95, 	nDamageRand = 234*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 253*0.95, 	nDamageRand = 253*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 272*0.95, 	nDamageRand = 272*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 291*0.95, 	nDamageRand = 291*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 310*0.95, 	nDamageRand = 310*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 329*0.95, 	nDamageRand = 329*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 348*0.95, 	nDamageRand = 348*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 367*0.95, 	nDamageRand = 367*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 386*0.95, 	nDamageRand = 386*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 405*0.95, 	nDamageRand = 405*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 424*0.95, 	nDamageRand = 424*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 443*0.95, 	nDamageRand = 443*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 462*0.95, 	nDamageRand = 462*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 481*0.95, 	nDamageRand = 481*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 500*0.95, 	nDamageRand = 500*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 519*0.95, 	nDamageRand = 519*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 538*0.95, 	nDamageRand = 538*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 557*0.95, 	nDamageRand = 557*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 576*0.95, 	nDamageRand = 576*0.1, }, -- Level 26
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
--���Ӷ����ڹ�AP�ӳ�2��
	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.TRANSFER_LIFE,								-- ħ������
   		tSkillData[dwSkillLevel].nDamageBase,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(2309, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL) -- ����Ŀ���ж�����
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2488, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(1, 385);

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
	--skill.nAreaRadius		= 4 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
    --skill.nChannelInterval	= 32; 				-- ͨ�������ʱ�� 
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