------------------------------------------------
-- �ļ���    :  ݶ��ʥ��_9��BOSS_����֮��_����ײ.lua
-- ������    :  �ź�
-- ����ʱ��  :  2011-3-27
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  ��������ܿ�������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 18000 * 0.8, nDamageRand = 18000 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 40200 * 0.8, nDamageRand = 40200 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 40200 * 0.8, nDamageRand = 40200 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 55200 * 0.8, nDamageRand = 55200 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1832 * 0.8, nDamageRand = 1832 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2405 * 0.8, nDamageRand = 2405 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 3308 * 0.8, nDamageRand = 3308 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3945 * 0.8, nDamageRand = 3945 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 4581 * 0.8, nDamageRand = 4581 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 5218 * 0.8, nDamageRand = 5218 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 5854 * 0.8, nDamageRand = 5854 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 6491 * 0.8, nDamageRand = 6491 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 7127 * 0.8, nDamageRand = 7127 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 7763 * 0.8, nDamageRand = 7763 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 8400 * 0.8, nDamageRand = 8400 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 9377 * 0.8, nDamageRand = 9377 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 9589 * 0.8, nDamageRand = 9589 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 9801 * 0.8, nDamageRand = 9801 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 10014 * 0.8, nDamageRand = 10014 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 10226 * 0.8, nDamageRand = 10226 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 10438 * 0.8, nDamageRand = 10438 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 10651 * 0.8, nDamageRand = 10651 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 10863 * 0.8, nDamageRand = 10863 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 11075 * 0.8, nDamageRand = 11075 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 11288 * 0.8, nDamageRand = 11288 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 11500 * 0.8, nDamageRand = 11500 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 11712 * 0.8, nDamageRand = 11712 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 11925 * 0.8, nDamageRand = 11925 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 12137 * 0.8, nDamageRand = 12137 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 12349 * 0.8, nDamageRand = 12349 * 0.4, nCostMana = 0},		--level 30
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

    	skill.AddAttribute(													--����6��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_REPULSED,
		13,      --ʱ��
		0
    		);
    

    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		--skill.BindBuff(1, 994, 5);		-- ����1��λBuff
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
		skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
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