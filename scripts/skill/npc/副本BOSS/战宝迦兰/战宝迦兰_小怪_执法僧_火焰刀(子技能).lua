------------------------------------------------
-- �ļ���    :  ս������_С��_ִ��ɮ_���浶(�Ӽ���).lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-1
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ���浶
-- ����Ч��  :  2���������������ι�����ÿ��2000��һ�����6000�������ڹ��˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 185 * 0.8, nDamageRand = 185 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 253 * 0.8, nDamageRand = 253 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 429 * 0.8, nDamageRand = 429 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 615 * 0.8, nDamageRand = 615 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 895 * 0.8, nDamageRand = 895 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1175 * 0.8, nDamageRand = 1175 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1616 * 0.8, nDamageRand = 1616 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1927 * 0.8, nDamageRand = 1927 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 2238 * 0.8, nDamageRand = 2238 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 2549 * 0.8, nDamageRand = 2549 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2859 * 0.8, nDamageRand = 2859 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 3170 * 0.8, nDamageRand = 3170 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 3481 * 0.8, nDamageRand = 3481 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 3792 * 0.8, nDamageRand = 3792 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 4103 * 0.8, nDamageRand = 4103 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 4580 * 0.8, nDamageRand = 4580 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 4684 * 0.8, nDamageRand = 4684 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 4787 * 0.8, nDamageRand = 4787 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 4891 * 0.8, nDamageRand = 4891 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 4995 * 0.8, nDamageRand = 4995 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 5099 * 0.8, nDamageRand = 5099 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 5202 * 0.8, nDamageRand = 5202 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 5306 * 0.8, nDamageRand = 5306 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 5410 * 0.8, nDamageRand = 5410 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 5513 * 0.8, nDamageRand = 5513 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 5617 * 0.8, nDamageRand = 5617 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 5721 * 0.8, nDamageRand = 5721 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 5825 * 0.8, nDamageRand = 5825 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 5928 * 0.8, nDamageRand = 5928 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 6032 * 0.8, nDamageRand = 6032 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 6136 * 0.8, nDamageRand = 6136 * 0.4, nCostMana = 0},		--level 31
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
	skill.nAngleRange		= 85;					-- ������Χ�����νǶȷ�Χ 120��
	skill.nAreaRadius		= 4 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 8;				-- ����֡��
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
    --skill.nBrokenRate     = 1024 * PERCENT_BASE;	  -- ���ܱ���ϵĸ���.����1024
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