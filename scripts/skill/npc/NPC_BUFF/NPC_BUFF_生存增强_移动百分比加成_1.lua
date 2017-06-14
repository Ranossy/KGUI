------------------------------------------------
-- �ļ���    :  NPCս������_BUFF_������ǿ_�ƶ��ٷֱȼӳ�_120.lua
-- ������    :  zhangqi		
-- ����ʱ��  :  2008-12-31
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  NPCս������_BUFF_������ǿ_�ƶ��ٷֱȼӳ�_120
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 1 },		--level 1 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 2 },		--level 2 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 3 },		--level 3 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 4 },		--level 4 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 5 },		--level 5 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 6 },		--level 6 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 7 },		--level 7 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 8 },		--level 8 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 9 },		--level 9 
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 10},		--level 10
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 11},		--level 11
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 12},		--level 12
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 13},		--level 13
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 14},		--level 14
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 15},		--level 15
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 16},		--level 16
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 17},		--level 17
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 18},		--level 18
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 19},		--level 19
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 20},		--level 20
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 21},		--level 21
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 22},		--level 22
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 23},		--level 23
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 24},		--level 24
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 25},		--level 25
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 26},		--level 26
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 27},		--level 27
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 28},		--level 28
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 29},		--level 29
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 30},		--level 30
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 31},		--level 31
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 32},		--level 32
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 33},		--level 33
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 34},		--level 34
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 35},		--level 35
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 36},		--level 36
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 37},		--level 37
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 38},		--level 38
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 39},		--level 39
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0, nBuffID=833, nBuffLevel= 40},		--level 40
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
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
    skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
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
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 10 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 5				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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