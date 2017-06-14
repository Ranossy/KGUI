------------------------------------------------
-- �ļ���    :  �̿���ȸ_�׷�����צ.lua
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
	{nDamageBase = 1200 * 0.8, nDamageRand = 1200 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 74 * 0.8, nDamageRand = 74 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 125 * 0.8, nDamageRand = 125 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 179 * 0.8, nDamageRand = 179 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 260 * 0.8, nDamageRand = 260 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 342 * 0.8, nDamageRand = 342 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 470 * 0.8, nDamageRand = 470 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 561 * 0.8, nDamageRand = 561 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 651 * 0.8, nDamageRand = 651 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 742 * 0.8, nDamageRand = 742 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 832 * 0.8, nDamageRand = 832 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 922 * 0.8, nDamageRand = 922 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 1013 * 0.8, nDamageRand = 1013 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 1103 * 0.8, nDamageRand = 1103 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 1194 * 0.8, nDamageRand = 1194 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 1333 * 0.8, nDamageRand = 1333 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 1363 * 0.8, nDamageRand = 1363 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 1393 * 0.8, nDamageRand = 1393 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 1423 * 0.8, nDamageRand = 1423 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 1453 * 0.8, nDamageRand = 1453 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 1484 * 0.8, nDamageRand = 1484 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 1514 * 0.8, nDamageRand = 1514 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 1544 * 0.8, nDamageRand = 1544 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 1574 * 0.8, nDamageRand = 1574 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 1604 * 0.8, nDamageRand = 1604 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 1634 * 0.8, nDamageRand = 1634 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 1665 * 0.8, nDamageRand = 1665 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 1695 * 0.8, nDamageRand = 1695 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 1725 * 0.8, nDamageRand = 1725 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 1755 * 0.8, nDamageRand = 1755 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 1785 * 0.8, nDamageRand = 1785 * 0.4, nCostMana = 0},		--level 31
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
	skill.nMaxRadius		= 5 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 42;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 5 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 3;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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