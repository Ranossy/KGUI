------------------------------------------------
-- �ļ���    :  ������Ӱ_����.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-03-23
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  �ͻ�
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 10 * 0.8, nDamageRand = 10 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 14 * 0.8, nDamageRand = 14 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 23 * 0.8, nDamageRand = 23 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 33 * 0.8, nDamageRand = 33 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 48 * 0.8, nDamageRand = 48 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 63 * 0.8, nDamageRand = 63 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 87 * 0.8, nDamageRand = 87 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 103 * 0.8, nDamageRand = 103 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 120 * 0.8, nDamageRand = 120 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 137 * 0.8, nDamageRand = 137 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 153 * 0.8, nDamageRand = 153 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 170 * 0.8, nDamageRand = 170 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 187 * 0.8, nDamageRand = 187 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 203 * 0.8, nDamageRand = 203 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 220 * 0.8, nDamageRand = 220 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 246 * 0.8, nDamageRand = 246 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 251 * 0.8, nDamageRand = 251 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 257 * 0.8, nDamageRand = 257 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 262 * 0.8, nDamageRand = 262 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 268 * 0.8, nDamageRand = 268 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 273 * 0.8, nDamageRand = 273 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 279 * 0.8, nDamageRand = 279 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 285 * 0.8, nDamageRand = 285 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 290 * 0.8, nDamageRand = 290 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 296 * 0.8, nDamageRand = 296 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 301 * 0.8, nDamageRand = 301 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 307 * 0.8, nDamageRand = 307 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 312 * 0.8, nDamageRand = 312 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 318 * 0.8, nDamageRand = 318 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 323 * 0.8, nDamageRand = 323 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 329 * 0.8, nDamageRand = 329 * 0.4, nCostMana = 0},		--level 31
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
  --skill.BindBuff(1,1205,1);		-- ����1��λBuff
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