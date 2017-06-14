------------------------------------------------
-- �ļ���    :  ����ɽ��_2��BOSS_Գ����_�̷���ѩ��(����).lua
-- ������    : �²���
-- ����ʱ��  :  2009-4-15
-- ��;(ģ��):  ����BOSS
-- �书����  :  ����ɽ��
-- �书����  :  2��BOSS
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  : ����10s�����1600�����˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 135   *0.8, nDamageRand = 135  *0.2, nCostMana = 2493},		--level 1
	{nDamageBase = 229   *0.8, nDamageRand = 229  *0.2, nCostMana = 2493},		--level 2
	{nDamageBase = 328   *0.8, nDamageRand = 328  *0.2, nCostMana = 2493},		--level 3
	{nDamageBase = 477   *0.8, nDamageRand = 477  *0.2, nCostMana = 2493},		--level 4
	{nDamageBase = 626   *0.8, nDamageRand = 626  *0.2, nCostMana = 2493},		--level 5
	{nDamageBase = 861   *0.8, nDamageRand = 861  *0.2, nCostMana = 2493},		--level 6
	{nDamageBase = 1027  *0.8, nDamageRand = 1027 *0.2, nCostMana = 2493},		--level 7
	{nDamageBase = 1193  *0.8, nDamageRand = 1193 *0.2, nCostMana = 2493},		--level 8
	{nDamageBase = 1358  *0.8, nDamageRand = 1358 *0.2, nCostMana = 2493},		--level 9
	{nDamageBase = 1524  *0.8, nDamageRand = 1524 *0.2, nCostMana = 2493},		--level 10
	{nDamageBase = 1690  *0.8, nDamageRand = 1690 *0.2, nCostMana = 2493},		--level 11
	{nDamageBase = 1856  *0.8, nDamageRand = 1856 *0.2, nCostMana = 2493},		--level 12
	{nDamageBase = 2021  *0.8, nDamageRand = 2021 *0.2, nCostMana = 2493},		--level 13
	{nDamageBase = 2187  *0.8, nDamageRand = 2187 *0.2, nCostMana = 2493},		--level 14
	{nDamageBase = 2353  *0.8, nDamageRand = 2353 *0.2, nCostMana = 2493},		--level 15
	{nDamageBase = 2518  *0.8, nDamageRand = 2518 *0.2, nCostMana = 2493},		--level 16
	{nDamageBase = 2684  *0.8, nDamageRand = 2684 *0.2, nCostMana = 2493},		--level 17
	{nDamageBase = 2850  *0.8, nDamageRand = 2850 *0.2, nCostMana = 2493},		--level 18
	{nDamageBase = 3015  *0.8, nDamageRand = 3015 *0.2, nCostMana = 2493},		--level 19
	{nDamageBase = 3181  *0.8, nDamageRand = 3181 *0.2, nCostMana = 2493},		--level 20
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1037, 
		1
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
   skill.BindBuff(1,1028,1);		-- ����1��λBuff
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
    skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
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
	skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 10				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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