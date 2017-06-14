------------------------------------------------
-- �ļ���    :  NPC��ͨ����(������).lua
-- ������    :  CBG
-- ����ʱ��  :  2008-12-31
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ɱGiGi��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 37  *0.8, nDamageRand = 37  *0.4, nCostMana = 0},		--level 1 
	{nDamageBase = 63  *0.8, nDamageRand = 63  *0.4, nCostMana = 0},		--level 2 
	{nDamageBase = 90  *0.8, nDamageRand = 90  *0.4, nCostMana = 0},		--level 3 
	{nDamageBase = 131 *0.8, nDamageRand = 131 *0.4, nCostMana = 0},		--level 4 
	{nDamageBase = 172 *0.8, nDamageRand = 172 *0.4, nCostMana = 0},		--level 5 
	{nDamageBase = 236 *0.8, nDamageRand = 236 *0.4, nCostMana = 0},		--level 6 
	{nDamageBase = 282 *0.8, nDamageRand = 282 *0.4, nCostMana = 0},		--level 7 
	{nDamageBase = 327 *0.8, nDamageRand = 327 *0.4, nCostMana = 0},		--level 8 
	{nDamageBase = 373 *0.8, nDamageRand = 373 *0.4, nCostMana = 0},		--level 9 
	{nDamageBase = 418 *0.8, nDamageRand = 418 *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 464 *0.8, nDamageRand = 464 *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 509 *0.8, nDamageRand = 509 *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 555 *0.8, nDamageRand = 555 *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 600 *0.8, nDamageRand = 600 *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 650 *0.8, nDamageRand = 650 *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 981 *0.8, nDamageRand = 981 *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 1010*0.8, nDamageRand = 1010*0.4, nCostMana = 0},		--level 17
	{nDamageBase = 1039*0.8, nDamageRand = 1039*0.4, nCostMana = 0},		--level 18
	{nDamageBase = 1069*0.8, nDamageRand = 1069*0.4, nCostMana = 0},		--level 19
	{nDamageBase = 1098*0.8, nDamageRand = 1098*0.4, nCostMana = 0},		--level 20
	{nDamageBase = 1127*0.8, nDamageRand = 1127*0.4, nCostMana = 0},		--level 21
	{nDamageBase = 1157*0.8, nDamageRand = 1157*0.4, nCostMana = 0},		--level 22
	{nDamageBase = 1186*0.8, nDamageRand = 1186*0.4, nCostMana = 0},		--level 23
	{nDamageBase = 1256*0.8, nDamageRand = 1256*0.4, nCostMana = 0},		--level 24
	{nDamageBase = 1332*0.8, nDamageRand = 1332*0.4, nCostMana = 0},		--level 25
	{nDamageBase = 1368*0.8, nDamageRand = 1368*0.4, nCostMana = 0},		--level 26
	{nDamageBase = 1403*0.8, nDamageRand = 1403*0.4, nCostMana = 0},		--level 27
	{nDamageBase = 1439*0.8, nDamageRand = 1439*0.4, nCostMana = 0},		--level 28
	{nDamageBase = 1474*0.8, nDamageRand = 1474*0.4, nCostMana = 0},		--level 29
	{nDamageBase = 1510*0.8, nDamageRand = 1510*0.4, nCostMana = 0},		--level 30
	{nDamageBase = 1546*0.8, nDamageRand = 1546*0.4, nCostMana = 0},		--level 31
	{nDamageBase = 1581*0.8, nDamageRand = 1581*0.4, nCostMana = 0},		--level 32
	{nDamageBase = 1617*0.8, nDamageRand = 1617*0.4, nCostMana = 0},		--level 33
	{nDamageBase = 1652*0.8, nDamageRand = 1652*0.4, nCostMana = 0},		--level 34
	{nDamageBase = 1688*0.8, nDamageRand = 1688*0.4, nCostMana = 0},		--level 35
	{nDamageBase = 1723*0.8, nDamageRand = 1723*0.4, nCostMana = 0},		--level 36
	{nDamageBase = 1759*0.8, nDamageRand = 1759*0.4, nCostMana = 0},		--level 37
	{nDamageBase = 1795*0.8, nDamageRand = 1795*0.4, nCostMana = 0},		--level 38
	{nDamageBase = 1830*0.8, nDamageRand = 1830*0.4, nCostMana = 0},		--level 39
	{nDamageBase = 1866*0.8, nDamageRand = 1866*0.4, nCostMana = 0},		--level 40
	{nDamageBase = 2091 * 0.8, nDamageRand = 2091 * 0.4, nCostMana = 0},		--level 51
	{nDamageBase = 2318 * 0.8, nDamageRand = 2318 * 0.4, nCostMana = 0},		--level 52
	{nDamageBase = 2545 * 0.8, nDamageRand = 2545 * 0.4, nCostMana = 0},		--level 53
	{nDamageBase = 2773 * 0.8, nDamageRand = 2773 * 0.4, nCostMana = 0},		--level 54
	{nDamageBase = 3000 * 0.8, nDamageRand = 3000 * 0.4, nCostMana = 0},		--level 55
	{nDamageBase = 3349 * 0.8, nDamageRand = 3349 * 0.4, nCostMana = 0},		--level 56
	{nDamageBase = 3425 * 0.8, nDamageRand = 3425 * 0.4, nCostMana = 0},		--level 57
	{nDamageBase = 3500 * 0.8, nDamageRand = 3500 * 0.4, nCostMana = 0},		--level 58
	{nDamageBase = 3576 * 0.8, nDamageRand = 3576 * 0.4, nCostMana = 0},		--level 59
	{nDamageBase = 3652 * 0.8, nDamageRand = 3652 * 0.4, nCostMana = 0},		--level 60
	{nDamageBase = 3728 * 0.8, nDamageRand = 3728 * 0.4, nCostMana = 0},		--level 61
	{nDamageBase = 3804 * 0.8, nDamageRand = 3804 * 0.4, nCostMana = 0},		--level 62
	{nDamageBase = 3880 * 0.8, nDamageRand = 3880 * 0.4, nCostMana = 0},		--level 63
	{nDamageBase = 3955 * 0.8, nDamageRand = 3955 * 0.4, nCostMana = 0},		--level 64
	{nDamageBase = 4031 * 0.8, nDamageRand = 4031 * 0.4, nCostMana = 0},		--level 65
	{nDamageBase = 4107 * 0.8, nDamageRand = 4107 * 0.4, nCostMana = 0},		--level 66
	{nDamageBase = 4183 * 0.8, nDamageRand = 4183 * 0.4, nCostMana = 0},		--level 67
	{nDamageBase = 4259 * 0.8, nDamageRand = 4259 * 0.4, nCostMana = 0},		--level 68
	{nDamageBase = 4335 * 0.8, nDamageRand = 4335 * 0.4, nCostMana = 0},		--level 69
	{nDamageBase = 4410 * 0.8, nDamageRand = 4410 * 0.4, nCostMana = 0},		--level 70
	{nDamageBase = 4181 * 0.8, nDamageRand = 4181 * 0.4, nCostMana = 0},		--level 71
	{nDamageBase = 4636 * 0.8, nDamageRand = 4636 * 0.4, nCostMana = 0},		--level 72
	{nDamageBase = 5091 * 0.8, nDamageRand = 5091 * 0.4, nCostMana = 0},		--level 73
	{nDamageBase = 5545 * 0.8, nDamageRand = 5545 * 0.4, nCostMana = 0},		--level 74
	{nDamageBase = 6000 * 0.8, nDamageRand = 6000 * 0.4, nCostMana = 0},		--level 75
	{nDamageBase = 6698 * 0.8, nDamageRand = 6698 * 0.4, nCostMana = 0},		--level 76
	{nDamageBase = 6849 * 0.8, nDamageRand = 6849 * 0.4, nCostMana = 0},		--level 77
	{nDamageBase = 7001 * 0.8, nDamageRand = 7001 * 0.4, nCostMana = 0},		--level 78
	{nDamageBase = 7153 * 0.8, nDamageRand = 7153 * 0.4, nCostMana = 0},		--level 79
	{nDamageBase = 7304 * 0.8, nDamageRand = 7304 * 0.4, nCostMana = 0},		--level 80
	{nDamageBase = 7456 * 0.8, nDamageRand = 7456 * 0.4, nCostMana = 0},		--level 81
	{nDamageBase = 7608 * 0.8, nDamageRand = 7608 * 0.4, nCostMana = 0},		--level 82
	{nDamageBase = 7759 * 0.8, nDamageRand = 7759 * 0.4, nCostMana = 0},		--level 83
	{nDamageBase = 7911 * 0.8, nDamageRand = 7911 * 0.4, nCostMana = 0},		--level 84
	{nDamageBase = 8063 * 0.8, nDamageRand = 8063 * 0.4, nCostMana = 0},		--level 85
	{nDamageBase = 8214 * 0.8, nDamageRand = 8214 * 0.4, nCostMana = 0},		--level 86
	{nDamageBase = 8366 * 0.8, nDamageRand = 8366 * 0.4, nCostMana = 0},		--level 87
	{nDamageBase = 8518 * 0.8, nDamageRand = 8518 * 0.4, nCostMana = 0},		--level 88
	{nDamageBase = 8669 * 0.8, nDamageRand = 8669 * 0.4, nCostMana = 0},		--level 89
	{nDamageBase = 8821 * 0.8, nDamageRand = 8821 * 0.4, nCostMana = 0},		--level 90
	{nDamageBase = 9199 * 0.8, nDamageRand = 9199 * 0.4, nCostMana = 0},		--level 91
	{nDamageBase = 10199 * 0.8, nDamageRand = 10199 * 0.4, nCostMana = 0},		--level 92
	{nDamageBase = 11199 * 0.8, nDamageRand = 11199 * 0.4, nCostMana = 0},		--level 93
	{nDamageBase = 12200 * 0.8, nDamageRand = 12200 * 0.4, nCostMana = 0},		--level 94
	{nDamageBase = 13200 * 0.8, nDamageRand = 13200 * 0.4, nCostMana = 0},		--level 95
	{nDamageBase = 14735 * 0.8, nDamageRand = 14735 * 0.4, nCostMana = 0},		--level 96
	{nDamageBase = 15068 * 0.8, nDamageRand = 15068 * 0.4, nCostMana = 0},		--level 97
	{nDamageBase = 15402 * 0.8, nDamageRand = 15402 * 0.4, nCostMana = 0},		--level 98
	{nDamageBase = 15736 * 0.8, nDamageRand = 15736 * 0.4, nCostMana = 0},		--level 99
	{nDamageBase = 16069 * 0.8, nDamageRand = 16069 * 0.4, nCostMana = 0},		--level 100
	{nDamageBase = 16403 * 0.8, nDamageRand = 16403 * 0.4, nCostMana = 0},		--level 101
	{nDamageBase = 16737 * 0.8, nDamageRand = 16737 * 0.4, nCostMana = 0},		--level 102
	{nDamageBase = 17070 * 0.8, nDamageRand = 17070 * 0.4, nCostMana = 0},		--level 103
	{nDamageBase = 17404 * 0.8, nDamageRand = 17404 * 0.4, nCostMana = 0},		--level 104
	{nDamageBase = 17738 * 0.8, nDamageRand = 17738 * 0.4, nCostMana = 0},		--level 105
	{nDamageBase = 18071 * 0.8, nDamageRand = 18071 * 0.4, nCostMana = 0},		--level 106
	{nDamageBase = 18405 * 0.8, nDamageRand = 18405 * 0.4, nCostMana = 0},		--level 107
	{nDamageBase = 18739 * 0.8, nDamageRand = 18739 * 0.4, nCostMana = 0},		--level 108
	{nDamageBase = 19072 * 0.8, nDamageRand = 19072 * 0.4, nCostMana = 0},		--level 109
	{nDamageBase = 19406 * 0.8, nDamageRand = 19406 * 0.4, nCostMana = 0},		--level 110
	{nDamageBase = 19740 * 0.8, nDamageRand = 19740 * 0.4, nCostMana = 0},		--level 111
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

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
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
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