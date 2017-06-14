------------------------------------------------
-- �ļ���    :  Ӣ�۵����_3��BOSS_Ф��_����������.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-11-20
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  ��Һò�����ĺ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 1026 * 0.8, nDamageRand = 1026 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 1406 * 0.8, nDamageRand = 1406 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 2382 * 0.8, nDamageRand = 2382 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 3417 * 0.8, nDamageRand = 3417 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 4972 * 0.8, nDamageRand = 4972 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 6527 * 0.8, nDamageRand = 6527 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 8980 * 0.8, nDamageRand = 8980 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 10707 * 0.8, nDamageRand = 10707 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 12435 * 0.8, nDamageRand = 12435 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 14162 * 0.8, nDamageRand = 14162 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 15890 * 0.8, nDamageRand = 15890 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 17617 * 0.8, nDamageRand = 17617 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 19345 * 0.8, nDamageRand = 19345 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 21072 * 0.8, nDamageRand = 21072 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 22800 * 0.8, nDamageRand = 22800 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 25451 * 0.8, nDamageRand = 25451 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 26027 * 0.8, nDamageRand = 26027 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 26604 * 0.8, nDamageRand = 26604 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 27180 * 0.8, nDamageRand = 27180 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 27756 * 0.8, nDamageRand = 27756 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 28333 * 0.8, nDamageRand = 28333 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 28909 * 0.8, nDamageRand = 28909 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 29485 * 0.8, nDamageRand = 29485 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 30062 * 0.8, nDamageRand = 30062 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 30638 * 0.8, nDamageRand = 30638 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 31214 * 0.8, nDamageRand = 31214 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 31791 * 0.8, nDamageRand = 31791 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 32367 * 0.8, nDamageRand = 32367 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 32943 * 0.8, nDamageRand = 32943 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 33519 * 0.8, nDamageRand = 33519 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 34096 * 0.8, nDamageRand = 34096 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
			tSkillData[dwSkillLevel].nDamageBase * 0.14, 
			0
			);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);
    
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
			0, 
			0
			);
		

    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		skill.BindBuff(1, 1546, 1);		-- ����1��λBuff
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
		skill.nMaxRadius		= 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
		--skill.nAreaRadius		= 12 * LENGTH_BASE;		-- �������ð뾶 
		--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
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