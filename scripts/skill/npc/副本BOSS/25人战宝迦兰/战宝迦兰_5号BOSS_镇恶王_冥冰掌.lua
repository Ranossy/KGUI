------------------------------------------------
-- �ļ���    :  ս������_5��BOSS_�����_ڤ����.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-9
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ڤ����
-- ����Ч��  :  64�߷�Χ��������һ��DEBUFF���ܵ������ڹ��˺��ӱ�������ж��������20��



------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 0  *0.8, nDamageRand = 0   *0.4, nCostMana = 0},		--level 30
};               

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- ħ������ -------------------------------------------------

  -- 	skill.AddAttribute(
  -- 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--	  ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
	--	  tSkillData[dwSkillLevel].nDamageBase * 0.14, 
	--	  0											
  -- 		);
  -- 		
  -- 	skill.AddAttribute(
	--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
	--		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
	--		0
	--		);	
  -- 		
  -- 	skill.AddAttribute(
	--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
	--		0, 
	--		0
	--		);	

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  skill.BindBuff(1,1619,1);		-- ����1��λBuff 
	--skill.BindBuff(2,1272,1);		-- ����2��λBuff 
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
	skill.nMaxRadius		= 18 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 64 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 40;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 8;				-- ����֡��
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