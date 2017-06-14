------------------------------------------------
-- �ļ���    : ս������_С��_�޺�ɮ_Τ�����ơ�͵ѧ.lua
-- ������    :  �	
-- ����ʱ��  :  2009-6-26
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  Τ�����ơ�͵ѧ
-- ����Ч��  :  ����Ŀ�꣬��������ڹ��˺�3000
----------------                                               
                                            
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 277 * 0.8, nDamageRand = 277 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 380 * 0.8, nDamageRand = 380 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 643 * 0.8, nDamageRand = 643 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 922 * 0.8, nDamageRand = 922 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1342 * 0.8, nDamageRand = 1342 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1762 * 0.8, nDamageRand = 1762 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2424 * 0.8, nDamageRand = 2424 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 2890 * 0.8, nDamageRand = 2890 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3356 * 0.8, nDamageRand = 3356 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 3823 * 0.8, nDamageRand = 3823 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 4289 * 0.8, nDamageRand = 4289 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 4755 * 0.8, nDamageRand = 4755 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 5222 * 0.8, nDamageRand = 5222 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 5688 * 0.8, nDamageRand = 5688 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 6154 * 0.8, nDamageRand = 6154 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 6870 * 0.8, nDamageRand = 6870 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 7026 * 0.8, nDamageRand = 7026 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 7181 * 0.8, nDamageRand = 7181 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 7337 * 0.8, nDamageRand = 7337 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 7492 * 0.8, nDamageRand = 7492 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 7648 * 0.8, nDamageRand = 7648 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 7803 * 0.8, nDamageRand = 7803 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 7959 * 0.8, nDamageRand = 7959 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 8115 * 0.8, nDamageRand = 8115 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 8270 * 0.8, nDamageRand = 8270 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 8426 * 0.8, nDamageRand = 8426 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 8581 * 0.8, nDamageRand = 8581 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 8737 * 0.8, nDamageRand = 8737 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 8892 * 0.8, nDamageRand = 8892 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 10048 * 0.8, nDamageRand = 10048 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 9203 * 0.8, nDamageRand = 9203 * 0.4, nCostMana = 0},		--level 31
};          

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- ħ������ -------------------------------------------------
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

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  --skill.BindBuff(1,1230,1);		-- ����1��λBuff
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