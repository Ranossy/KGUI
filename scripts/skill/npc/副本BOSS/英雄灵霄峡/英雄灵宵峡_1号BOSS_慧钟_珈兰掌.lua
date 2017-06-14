------------------------------------------------
-- �ļ���    :  Ӣ������Ͽ_1��BOSS_����_������.lua
-- ������    :  CBG	
-- ����ʱ��  :  2009-10-26
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ��������������ϵ����ɣ�����������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 1292 * 0.8, nDamageRand = 1292 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1777 * 0.8, nDamageRand = 1777 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 2119 * 0.8, nDamageRand = 2119 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 2461 * 0.8, nDamageRand = 2461 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 2803 * 0.8, nDamageRand = 2803 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 3144 * 0.8, nDamageRand = 3144 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 3486 * 0.8, nDamageRand = 3486 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 3828 * 0.8, nDamageRand = 3828 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 4170 * 0.8, nDamageRand = 4170 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 4512 * 0.8, nDamageRand = 4512 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 5037 * 0.8, nDamageRand = 5037 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 5151 * 0.8, nDamageRand = 5151 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 5265 * 0.8, nDamageRand = 5265 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 5379 * 0.8, nDamageRand = 5379 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 5493 * 0.8, nDamageRand = 5493 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 5607 * 0.8, nDamageRand = 5607 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 5721 * 0.8, nDamageRand = 5721 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 5835 * 0.8, nDamageRand = 5835 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 5949 * 0.8, nDamageRand = 5949 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 6063 * 0.8, nDamageRand = 6063 * 0.4, nCostMana = 0},		--level 25

};  
    
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
    
    local dwSkillLevel = skill.dwLevel;

  	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0, 
		0
	);                 


	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
		8,
        		0
    	);
   	----------------- ħ������ -------------------------------------------------

	    ----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(1400, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);-- ����Ŀ��Buff
    
	    ----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1,994,3);		-- ����1��λBuff
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
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 30 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
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