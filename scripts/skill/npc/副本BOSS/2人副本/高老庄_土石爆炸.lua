------------------------------------------------
-- �ļ���    :  ����ׯ_��ʯ��ը.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-05-25
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
	{nDamageBase = 383 * 0.8, nDamageRand = 383 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 525 * 0.8, nDamageRand = 525 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 890 * 0.8, nDamageRand = 890 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1277 * 0.8, nDamageRand = 1277 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1858 * 0.8, nDamageRand = 1858 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2439 * 0.8, nDamageRand = 2439 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 3356 * 0.8, nDamageRand = 3356 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 4001 * 0.8, nDamageRand = 4001 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 4647 * 0.8, nDamageRand = 4647 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 5292 * 0.8, nDamageRand = 5292 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 5938 * 0.8, nDamageRand = 5938 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 6583 * 0.8, nDamageRand = 6583 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 7229 * 0.8, nDamageRand = 7229 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 7874 * 0.8, nDamageRand = 7874 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 8520 * 0.8, nDamageRand = 8520 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 9511 * 0.8, nDamageRand = 9511 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 9726 * 0.8, nDamageRand = 9726 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 9941 * 0.8, nDamageRand = 9941 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 10157 * 0.8, nDamageRand = 10157 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 10372 * 0.8, nDamageRand = 10372 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 10587 * 0.8, nDamageRand = 10587 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 10803 * 0.8, nDamageRand = 10803 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 11018 * 0.8, nDamageRand = 11018 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 11234 * 0.8, nDamageRand = 11234 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 11449 * 0.8, nDamageRand = 11449 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 11664 * 0.8, nDamageRand = 11664 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 11880 * 0.8, nDamageRand = 11880 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 12095 * 0.8, nDamageRand = 12095 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 12310 * 0.8, nDamageRand = 12310 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 12526 * 0.8, nDamageRand = 12526 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 12741 * 0.8, nDamageRand = 12741 * 0.4, nCostMana = 0},		--level 31
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
		--skill.BindBuff(1, 1761, 1);		-- ����1��λBuff
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
		skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 5 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
		skill.nTargetCountLimit	= 25;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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