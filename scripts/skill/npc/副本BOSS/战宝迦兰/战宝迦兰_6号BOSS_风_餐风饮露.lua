------------------------------------------------
-- �ļ���    :  ս������_6��BOSS_��_�ͷ���¶.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-11
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  �ͷ���¶
-- ����Ч��  :  �ظ�6000HP

------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 506 * 0.8, nDamageRand = 506 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 694 * 0.8, nDamageRand = 694 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 1176 * 0.8, nDamageRand = 1176 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1686 * 0.8, nDamageRand = 1686 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 2453 * 0.8, nDamageRand = 2453 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 3221 * 0.8, nDamageRand = 3221 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 4431 * 0.8, nDamageRand = 4431 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 5283 * 0.8, nDamageRand = 5283 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 6135 * 0.8, nDamageRand = 6135 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 6988 * 0.8, nDamageRand = 6988 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 7840 * 0.8, nDamageRand = 7840 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 8693 * 0.8, nDamageRand = 8693 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 9545 * 0.8, nDamageRand = 9545 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 10397 * 0.8, nDamageRand = 10397 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 101250 * 0.8, nDamageRand = 101250 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 12558 * 0.8, nDamageRand = 12558 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 12842 * 0.8, nDamageRand = 12842 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 13127 * 0.8, nDamageRand = 13127 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 13411 * 0.8, nDamageRand = 13411 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 13696 * 0.8, nDamageRand = 13696 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 13980 * 0.8, nDamageRand = 13980 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 14264 * 0.8, nDamageRand = 14264 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 14549 * 0.8, nDamageRand = 14549 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 14833 * 0.8, nDamageRand = 14833 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 15117 * 0.8, nDamageRand = 15117 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 15402 * 0.8, nDamageRand = 15402 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 15686 * 0.8, nDamageRand = 15686 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 15970 * 0.8, nDamageRand = 15970 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 16255 * 0.8, nDamageRand = 16255 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 680000 * 0.8, nDamageRand = 680000 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 16824 * 0.8, nDamageRand = 16824 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
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
  --skill.BindBuff(1,1232,1);		-- ����1��λBuff
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
	skill.nAreaRadius		= 99 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 32;				-- ����֡��
    --skill.nChannelInterval	= 16; 				-- ͨ�������ʱ�� 
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
    --skill.nBrokenRate     = 0 * PERCENT_BASE;	  -- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
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