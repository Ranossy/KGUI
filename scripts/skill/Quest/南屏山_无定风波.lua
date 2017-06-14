------------------------------------------------
-- �ļ���    :  ����ɽ_�޶��粨.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-8-14
-- ��;(ģ��):  BOSS
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ��������  :  ߾!
-- ����Ч��  :  ���˲߻�! ��Ϊ����?
----------------------�͵��ķָ���--------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 9000 * 0.8, nDamageRand = 9000 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 3000 * 0.8, nDamageRand = 3000 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 2090 * 0.8, nDamageRand = 2090 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 2998 * 0.8, nDamageRand = 2998 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 4362 * 0.8, nDamageRand = 4362 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 5725 * 0.8, nDamageRand = 5725 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 7877 * 0.8, nDamageRand = 7877 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 9392 * 0.8, nDamageRand = 9392 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 10908 * 0.8, nDamageRand = 10908 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 12423 * 0.8, nDamageRand = 12423 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 13938 * 0.8, nDamageRand = 13938 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 15454 * 0.8, nDamageRand = 15454 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 16969 * 0.8, nDamageRand = 16969 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 18484 * 0.8, nDamageRand = 18484 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 20000 * 0.8, nDamageRand = 20000 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 22325 * 0.8, nDamageRand = 22325 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 22831 * 0.8, nDamageRand = 22831 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 23337 * 0.8, nDamageRand = 23337 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 23842 * 0.8, nDamageRand = 23842 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 24348 * 0.8, nDamageRand = 24348 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 24853 * 0.8, nDamageRand = 24853 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 25359 * 0.8, nDamageRand = 25359 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 25864 * 0.8, nDamageRand = 25864 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 26370 * 0.8, nDamageRand = 26370 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 26875 * 0.8, nDamageRand = 26875 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 27381 * 0.8, nDamageRand = 27381 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 27886 * 0.8, nDamageRand = 27886 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 28392 * 0.8, nDamageRand = 28392 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 28898 * 0.8, nDamageRand = 28898 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 29403 * 0.8, nDamageRand = 29403 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 29909 * 0.8, nDamageRand = 29909 * 0.4, nCostMana = 0},		--level 31
};                                                                               

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
		local dwSkillLevel	= skill.dwLevel
	
	
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
  	--skill.AddSlowCheckSelfBuff(1159, 1,BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ��������Buff
  skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
   skill.AddSlowCheckDestBuff(5014, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 1500, 1);								-- ����1��λBuff
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
		--skill.nCostLife		= 0;										-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;								-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
		skill.nMinRadius		= 8 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 25* LENGTH_BASE;			-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 128;								-- ������Χ�����νǶȷ�Χ 
		--skill.nAreaRadius		= 30 * LENGTH_BASE;		-- �������ð뾶 
 		--skill.nTargetCountLimit	= 50;						-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 48;			-- ����֡��
    --skill.nChannelInterval	= 48; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 145;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
   	--skill.nBeatBackRate      = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate					= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
		--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	    skill.nDismountingRate		= PERCENT_BASE;				-- ��Ŀ�����������,����1024��Ĭ��0	
	----------------- �����˺���� ---------------------------------------------
		--skill.nWeaponDamagePercent		= 0;		-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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