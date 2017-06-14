------------------------------------------------
-- �ļ���    :  ݶ��ʥ��_9��BOSS_��Գ֮Ӱ_����ȸ.lua
-- ������    : �ź�
-- ����ʱ��  :  2011-3-27
-- ��;(ģ��):  ����BOSS
-- �书����  :  ݶ��ʥ��
-- �书����  :  9��BOSS
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ���������ڹ��˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 1000, nDamageRand = 100, nCostMana = 2493},		--level 1
	{nDamageBase = 3300, nDamageRand = 330, nCostMana = 2493},		--level 2
	{nDamageBase = 3400, nDamageRand = 340, nCostMana = 2493},		--level 3
	{nDamageBase = 4400,  nDamageRand = 440, nCostMana = 2493},		--level 4
	{nDamageBase = 380,  nDamageRand = 0, nCostMana = 2493},		--level 5
	{nDamageBase = 380,  nDamageRand = 0, nCostMana = 2493},		--level 6
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 7
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 8
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 9
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 10
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 11
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 12
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 13
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 14
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 15
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 16
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 17
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 18
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 19
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 20
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 21
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 22
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 23
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 24
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 25
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 26
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 27
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 28
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 29
	{nDamageBase = 380, nDamageRand = 0, nCostMana = 2493},		--level 30
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
  -- skill.BindBuff(1,1027,1);		-- ����1��λBuff
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
	skill.nMaxRadius		= 3 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 10 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 50				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
    skill.nBreakRate			= 1024;		-- ���Ŀ��ʩ���ĸ���,����1024
	
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