------------------------------------------------
-- �ļ���    :  �ܵ�_Ұ��_BOSS_媹�����_�������.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-27
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  : 	�������
-- ����Ч��  : 	ֱ�Ӷ�ϵ�˺���2000�㣩����Ĭ��5�룩
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 314 * 0.8, nDamageRand = 314 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 430 * 0.8, nDamageRand = 430 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 729 * 0.8, nDamageRand = 729 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1045 * 0.8, nDamageRand = 1045 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1521 * 0.8, nDamageRand = 1521 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1997 * 0.8, nDamageRand = 1997 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2747 * 0.8, nDamageRand = 2747 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3276 * 0.8, nDamageRand = 3276 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3804 * 0.8, nDamageRand = 3804 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 4332 * 0.8, nDamageRand = 4332 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 4861 * 0.8, nDamageRand = 4861 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 5389 * 0.8, nDamageRand = 5389 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 5918 * 0.8, nDamageRand = 5918 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 6446 * 0.8, nDamageRand = 6446 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 6975 * 0.8, nDamageRand = 6975 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 7786 * 0.8, nDamageRand = 7786 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 7962 * 0.8, nDamageRand = 7962 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 8139 * 0.8, nDamageRand = 8139 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 8315 * 0.8, nDamageRand = 8315 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 55500 * 0.8, nDamageRand = 55500 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 8668 * 0.8, nDamageRand = 8668 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 8844 * 0.8, nDamageRand = 8844 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 9020 * 0.8, nDamageRand = 9020 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 9196 * 0.8, nDamageRand = 9196 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 9373 * 0.8, nDamageRand = 9373 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 9549 * 0.8, nDamageRand = 9549 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 9725 * 0.8, nDamageRand = 9725 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 9902 * 0.8, nDamageRand = 9902 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 10078 * 0.8, nDamageRand = 10078 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 10254 * 0.8, nDamageRand = 10254 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 10431 * 0.8, nDamageRand = 10431 * 0.4, nCostMana = 0},		--level 31
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

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  	skill.BindBuff(1,1723,1);		-- ����1��λBuff �����������HOT
	--skill.BindBuff(2,1723,1);		-- ����2��λBuff
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
	skill.nTargetCountLimit	= 32;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 32;				-- ����֡��
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
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
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