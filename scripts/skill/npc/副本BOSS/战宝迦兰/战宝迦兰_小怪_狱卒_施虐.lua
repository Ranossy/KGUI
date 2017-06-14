------------------------------------------------
-- �ļ���    :  ս������_С��_����_ʩŰ.lua
-- ������    :  �	
-- ����ʱ��  :  2009-6-23
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  : ʩŰ
-- ����Ч��  :  ʹ��Ŀ���ܵ������˺�2000�㣬���������1500�㡣
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 90     *0.8, nDamageRand = 90    *0.4, nReduceMana = -67    ,nCostMana = 0},		--level 1
	{nDamageBase = 123    *0.8, nDamageRand = 123   *0.4, nReduceMana = -92    ,nCostMana = 0},		--level 2
	{nDamageBase = 209    *0.8, nDamageRand = 209   *0.4, nReduceMana = -157   ,nCostMana = 0},		--level 3
	{nDamageBase = 300    *0.8, nDamageRand = 300   *0.4, nReduceMana = -225   ,nCostMana = 0},		--level 4
	{nDamageBase = 436    *0.8, nDamageRand = 436   *0.4, nReduceMana = -327   ,nCostMana = 0},		--level 5
	{nDamageBase = 572    *0.8, nDamageRand = 572   *0.4, nReduceMana = -429   ,nCostMana = 0},		--level 6
	{nDamageBase = 788    *0.8, nDamageRand = 788   *0.4, nReduceMana = -591   ,nCostMana = 0},		--level 7
	{nDamageBase = 939    *0.8, nDamageRand = 939   *0.4, nReduceMana = -704   ,nCostMana = 0},		--level 8
	{nDamageBase = 1091   *0.8, nDamageRand = 1091  *0.4, nReduceMana = -818   ,nCostMana = 0},		--level 9
	{nDamageBase = 1242   *0.8, nDamageRand = 1242  *0.4, nReduceMana = -932   ,nCostMana = 0},		--level 10
	{nDamageBase = 1394   *0.8, nDamageRand = 1394  *0.4, nReduceMana = -1045  ,nCostMana = 0},		--level 11
	{nDamageBase = 1545   *0.8, nDamageRand = 1545  *0.4, nReduceMana = -1159  ,nCostMana = 0},		--level 12
	{nDamageBase = 1697   *0.8, nDamageRand = 1697  *0.4, nReduceMana = -1273  ,nCostMana = 0},		--level 13
	{nDamageBase = 1848   *0.8, nDamageRand = 1848  *0.4, nReduceMana = -1386  ,nCostMana = 0},		--level 14
	{nDamageBase = 2000   *0.8, nDamageRand = 2000  *0.4, nReduceMana = -1500  ,nCostMana = 0},		--level 15
	{nDamageBase = 2232   *0.8, nDamageRand = 2232  *0.4, nReduceMana = -1674  ,nCostMana = 0},		--level 16
	{nDamageBase = 2283   *0.8, nDamageRand = 2283  *0.4, nReduceMana = -1712  ,nCostMana = 0},		--level 17
	{nDamageBase = 2334   *0.8, nDamageRand = 2334  *0.4, nReduceMana = -1750  ,nCostMana = 0},		--level 18
	{nDamageBase = 2384   *0.8, nDamageRand = 2384  *0.4, nReduceMana = -1788  ,nCostMana = 0},		--level 19
	{nDamageBase = 2435   *0.8, nDamageRand = 2435  *0.4, nReduceMana = -1826  ,nCostMana = 0},		--level 20
	{nDamageBase = 2485   *0.8, nDamageRand = 2485  *0.4, nReduceMana = -1864  ,nCostMana = 0},		--level 21
	{nDamageBase = 2536   *0.8, nDamageRand = 2536  *0.4, nReduceMana = -1902  ,nCostMana = 0},		--level 22
	{nDamageBase = 2586   *0.8, nDamageRand = 2586  *0.4, nReduceMana = -1940  ,nCostMana = 0},		--level 23
	{nDamageBase = 2637   *0.8, nDamageRand = 2637  *0.4, nReduceMana = -1978  ,nCostMana = 0},		--level 24
	{nDamageBase = 2687   *0.8, nDamageRand = 2687  *0.4, nReduceMana = -2016  ,nCostMana = 0},		--level 25
	{nDamageBase = 2738   *0.8, nDamageRand = 2738  *0.4, nReduceMana = -2053  ,nCostMana = 0},		--level 26
	{nDamageBase = 2788   *0.8, nDamageRand = 2788  *0.4, nReduceMana = -2091  ,nCostMana = 0},		--level 27
	{nDamageBase = 2839   *0.8, nDamageRand = 2839  *0.4, nReduceMana = -2129  ,nCostMana = 0},		--level 28
	{nDamageBase = 2890   *0.8, nDamageRand = 2890  *0.4, nReduceMana = -2167  ,nCostMana = 0},		--level 29
	{nDamageBase = 7000   *0.8, nDamageRand = 7000  *0.4, nReduceMana = -2205  ,nCostMana = 0},		--level 30
};                

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- ħ������ -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		  ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		  tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		  0											
   		);
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);	
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
			0, 
			0
	);	
   		
   		
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		  ATTRIBUTE_TYPE.CURRENT_MANA,
		  tSkillData[dwSkillLevel].nReduceMana, 
		  0											
   		);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  --skill.BindBuff(1,1213,1);		-- ����1��λBuff
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
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
    skill.nBrokenRate         = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
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