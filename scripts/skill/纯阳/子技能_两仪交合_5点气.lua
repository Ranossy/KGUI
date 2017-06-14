------------------------------------------------
-- �ļ���    :  �Ӽ���_���ǽ���_1����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-07-08
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 74, 	nDamageRand = 8}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 212, 	nDamageRand = 16}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 290, 	nDamageRand = 23}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 368, 	nDamageRand = 31}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 446, 	nDamageRand = 39}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 524, 	nDamageRand = 47}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 602, 	nDamageRand = 55}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 680, 	nDamageRand = 62}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 758, 	nDamageRand = 70}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 836, 	nDamageRand = 78}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 914, 	nDamageRand = 86},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 992, 	nDamageRand = 94}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1070, 	nDamageRand = 101}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1148, 	nDamageRand = 109}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1226, 	nDamageRand = 117}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1304, 	nDamageRand = 125}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1382, 	nDamageRand = 133}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1460, 	nDamageRand = 140}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1538, 	nDamageRand = 148}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1616, 	nDamageRand = 156}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1694, 	nDamageRand = 164}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1772, 	nDamageRand = 172}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1850, 	nDamageRand = 179}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1928, 	nDamageRand = 187}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2006, 	nDamageRand = 195}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2084, 	nDamageRand = 203}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2162, 	nDamageRand = 211}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2240, 	nDamageRand = 218}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2318, 	nDamageRand = 226}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2396, 	nDamageRand = 234}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2474, 	nDamageRand = 242}, -- Level 31
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2552, 	nDamageRand = 250}, -- Level 32
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2630, 	nDamageRand = 257}, -- Level 33
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2708, 	nDamageRand = 265}, -- Level 34
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2786, 	nDamageRand = 273}, -- Level 35 
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel 	= skill.dwLevel;
    local nSubsection 	= 1;
    
   	----------------- ħ������ -------------------------------------------------
   	

	skill.AddAttribute(														--�����˺�
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3443,
		dwSkillLevel
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(3472, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetPublicCoolDown(16);						--����CD 1.5��
    --skill.SetNormalCoolDown(1, 489);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostRage		= 0;									-- �������ĵ�ŭ��
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
	--skill.nMinRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 22 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    skill.nChannelInterval	= 9 * nSubsection; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame			= 0;	-- ͨ��������ʱ�䣬��λ֡�� 
    -- ������ͨ��ʱ����Ϊ����AP���ݾ���ʱ��������Ч��
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    skill.nBrokenRate         	= PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com