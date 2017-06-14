------------------------------------------------
-- �ļ���    :  ��ˮ��_Ұ��_BOSS_Գ�ɹ���_�ν�.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-27
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  : 	�ν�
-- ����Ч��  : 	����Χ�뾶20�׷�Χ��ɴ����⹦�˺���8000��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 360      *0.8, nDamageRand = 360       *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 493      *0.8, nDamageRand = 493       *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 836      *0.8, nDamageRand = 836       *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1199     *0.8, nDamageRand = 1199      *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1745     *0.8, nDamageRand = 1745      *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2290     *0.8, nDamageRand = 2290      *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 3151     *0.8, nDamageRand = 3151      *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3757     *0.8, nDamageRand = 3757      *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 4363     *0.8, nDamageRand = 4363      *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 4969     *0.8, nDamageRand = 4969      *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 5575     *0.8, nDamageRand = 5575      *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 6182     *0.8, nDamageRand = 6182      *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 6788     *0.8, nDamageRand = 6788      *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 7394     *0.8, nDamageRand = 7394      *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 8000     *0.8, nDamageRand = 8000      *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 8930     *0.8, nDamageRand = 8930      *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 9133     *0.8, nDamageRand = 9133      *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 9335     *0.8, nDamageRand = 9335      *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 9537     *0.8, nDamageRand = 9537      *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 9739     *0.8, nDamageRand = 9739      *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 9941     *0.8, nDamageRand = 9941      *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 10144    *0.8, nDamageRand = 10144     *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 10346    *0.8, nDamageRand = 10346     *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 10548    *0.8, nDamageRand = 10548     *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 10750    *0.8, nDamageRand = 10750     *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 10953    *0.8, nDamageRand = 10953     *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 11155    *0.8, nDamageRand = 11155     *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 11357    *0.8, nDamageRand = 11357     *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 11559    *0.8, nDamageRand = 11559     *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 11761    *0.8, nDamageRand = 11761     *0.4, nCostMana = 0},		--level 30
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
	skill.nMaxRadius		= 19 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
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