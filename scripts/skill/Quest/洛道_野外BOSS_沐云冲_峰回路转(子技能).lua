------------------------------------------------
-- �ļ���    :  ���_Ұ��BOSS_���Ƴ�_���·ת(�Ӽ���).lua
-- ������    :  CBG
-- ����ʱ��  :  2009-12-25
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  Merry Christmas
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 151 * 0.8, nDamageRand = 151 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 207 * 0.8, nDamageRand = 207 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 351 * 0.8, nDamageRand = 351 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 504 * 0.8, nDamageRand = 504 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 733 * 0.8, nDamageRand = 733 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 962 * 0.8, nDamageRand = 962 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1323 * 0.8, nDamageRand = 1323 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1578 * 0.8, nDamageRand = 1578 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1832 * 0.8, nDamageRand = 1832 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 2087 * 0.8, nDamageRand = 2087 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2342 * 0.8, nDamageRand = 2342 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 2596 * 0.8, nDamageRand = 2596 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 2851 * 0.8, nDamageRand = 2851 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 3105 * 0.8, nDamageRand = 3105 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 3360 * 0.8, nDamageRand = 3360 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 3751 * 0.8, nDamageRand = 3751 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3836 * 0.8, nDamageRand = 3836 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3921 * 0.8, nDamageRand = 3921 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 4005 * 0.8, nDamageRand = 4005 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 26770 * 0.8, nDamageRand = 26770 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 4175 * 0.8, nDamageRand = 4175 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 4260 * 0.8, nDamageRand = 4260 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 4345 * 0.8, nDamageRand = 4345 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 4430 * 0.8, nDamageRand = 4430 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 4515 * 0.8, nDamageRand = 4515 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 4600 * 0.8, nDamageRand = 4600 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 4685 * 0.8, nDamageRand = 4685 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 4770 * 0.8, nDamageRand = 4770 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 4855 * 0.8, nDamageRand = 4855 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 4940 * 0.8, nDamageRand = 4940 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 5025 * 0.8, nDamageRand = 5025 * 0.4, nCostMana = 0},		--level 31
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

    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		--skill.BindBuff(1, 994, 3);		-- ����1��λBuff
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
		--skill.nMinRadius		= 8 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 28 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 12;					-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 28 * LENGTH_BASE;		-- �������ð뾶 
		skill.nTargetCountLimit	= 32;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
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