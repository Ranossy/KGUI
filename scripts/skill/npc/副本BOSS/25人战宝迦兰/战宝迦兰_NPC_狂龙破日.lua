------------------------------------------------
-- �ļ���    :  ս������_NPC_��������.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-03-02
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
	{nDamageBase = 186 * 0.8, nDamageRand = 186 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 254 * 0.8, nDamageRand = 254 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 431 * 0.8, nDamageRand = 431 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 618 * 0.8, nDamageRand = 618 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 900 * 0.8, nDamageRand = 900 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1181 * 0.8, nDamageRand = 1181 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1625 * 0.8, nDamageRand = 1625 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1937 * 0.8, nDamageRand = 1937 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 2250 * 0.8, nDamageRand = 2250 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 2562 * 0.8, nDamageRand = 2562 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2875 * 0.8, nDamageRand = 2875 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 3187 * 0.8, nDamageRand = 3187 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 3500 * 0.8, nDamageRand = 3500 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 3812 * 0.8, nDamageRand = 3812 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 4125 * 0.8, nDamageRand = 4125 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 4605 * 0.8, nDamageRand = 4605 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 4709 * 0.8, nDamageRand = 4709 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 4813 * 0.8, nDamageRand = 4813 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 4917 * 0.8, nDamageRand = 4917 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 5022 * 0.8, nDamageRand = 5022 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 5126 * 0.8, nDamageRand = 5126 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 5230 * 0.8, nDamageRand = 5230 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 5335 * 0.8, nDamageRand = 5335 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 5439 * 0.8, nDamageRand = 5439 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 5543 * 0.8, nDamageRand = 5543 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 5647 * 0.8, nDamageRand = 5647 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 5752 * 0.8, nDamageRand = 5752 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 5856 * 0.8, nDamageRand = 5856 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 5960 * 0.8, nDamageRand = 5960 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 6064 * 0.8, nDamageRand = 6064 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 6169 * 0.8, nDamageRand = 6169 * 0.4, nCostMana = 0},		--level 31
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
		--skill.BindBuff(1, 1705, 1);		-- ����1��λBuff
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
		skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 12 * LENGTH_BASE;		-- �������ð뾶 
		skill.nTargetCountLimit	= 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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