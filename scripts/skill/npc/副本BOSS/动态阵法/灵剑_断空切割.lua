------------------------------------------------
-- �ļ���    :  �齣_�Ͽ��и�.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-3-01
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  : 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 2600 * 0.8, nDamageRand = 2600 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 165 * 0.8, nDamageRand = 165 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 279 * 0.8, nDamageRand = 279 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 401 * 0.8, nDamageRand = 401 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 583 * 0.8, nDamageRand = 583 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 766 * 0.8, nDamageRand = 766 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1053 * 0.8, nDamageRand = 1053 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1256 * 0.8, nDamageRand = 1256 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1458 * 0.8, nDamageRand = 1458 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 1661 * 0.8, nDamageRand = 1661 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 1864 * 0.8, nDamageRand = 1864 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 2066 * 0.8, nDamageRand = 2066 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 2269 * 0.8, nDamageRand = 2269 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 2472 * 0.8, nDamageRand = 2472 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 2674 * 0.8, nDamageRand = 2674 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 2985 * 0.8, nDamageRand = 2985 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3053 * 0.8, nDamageRand = 3053 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3120 * 0.8, nDamageRand = 3120 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 3188 * 0.8, nDamageRand = 3188 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 3256 * 0.8, nDamageRand = 3256 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 3323 * 0.8, nDamageRand = 3323 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 3391 * 0.8, nDamageRand = 3391 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 3458 * 0.8, nDamageRand = 3458 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3526 * 0.8, nDamageRand = 3526 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 3594 * 0.8, nDamageRand = 3594 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 3661 * 0.8, nDamageRand = 3661 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 3729 * 0.8, nDamageRand = 3729 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 3796 * 0.8, nDamageRand = 3796 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 3864 * 0.8, nDamageRand = 3864 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 3932 * 0.8, nDamageRand = 3932 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 3999 * 0.8, nDamageRand = 3999 * 0.4, nCostMana = 0},		--level 31
};             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- ħ������ -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,							-- ħ������
   		tSkillData[dwSkillLevel].nDamageBase * 0.14,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,							-- ħ������
   		tSkillData[dwSkillLevel].nDamageRand * 0.14,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
    
    skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,								-- ħ������
   		0,																-- ����ֵ1
   		0																-- ����ֵ2
   		);
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  --skill.BindBuff(1,1331,1);		-- ����1��λBuff �����������HOT
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
	skill.nMaxRadius		= 6 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
    --skill.nBrokenRate         = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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